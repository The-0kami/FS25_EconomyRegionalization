--[[
    FS25_EconomyRegionalization
    One-off multiplayer companion for FS25_additionalCurrencies.

    Behaviour:
      * Selects Swiss Franc (CHF) for every client running the server mod set.
      * Enables Additional Currencies' converter.
      * Replaces the CHF conversion factor at runtime only.
      * Locks the two currency controls while the prank mod is active.
      * Prevents the prank selection from being written to Additional Currencies'
        settings.xml, so removing this mod restores each player's previous choice
        on the next game start.

    No files belonging to Additional Currencies are modified.
]]

EconomyRegionalization = {
    MOD_NAME = g_currentModName or "FS25_EconomyRegionalization",
    VERSION = "1.0.0.0",

    TARGET_SYMBOL = "CHF",
    CONVERSION_FACTOR = 0.93,
    LOCK_SETTINGS = true,

    originalState = nil,
    originalConverter = nil,
    originalFactor = nil,
    targetIndex = nil,
    persistencePatched = false,
    settingsHookInstalled = false,
    applied = false
}

local function erLog(message)
    print(string.format("[EconomyRegionalization] %s", tostring(message)))
end

function EconomyRegionalization:findCurrencyIndex()
    if AdditionalCurrencies == nil or AdditionalCurrencies.currencies == nil then
        return nil
    end

    for index, currency in ipairs(AdditionalCurrencies.currencies) do
        if currency ~= nil and tostring(currency.unitShort or "") == self.TARGET_SYMBOL then
            return index
        end
    end

    return nil
end

function EconomyRegionalization:rememberOriginalState()
    if self.originalState ~= nil then
        return
    end

    self.originalState = AdditionalCurrencies.state
    self.originalConverter = AdditionalCurrencies.converter == true
end

function EconomyRegionalization:patchPersistence()
    if self.persistencePatched or AdditionalCurrencies == nil then
        return
    end

    local originalSave = AdditionalCurrencies.saveCurrencySettingsToXMLFile
    if originalSave == nil then
        erLog("WARNING: Additional Currencies save function was not found; prank settings may persist.")
        return
    end

    AdditionalCurrencies.saveCurrencySettingsToXMLFile = function(ac, ...)
        local prankState = ac.state
        local prankConverter = ac.converter

        if EconomyRegionalization.originalState ~= nil then
            ac.state = EconomyRegionalization.originalState
            ac.converter = EconomyRegionalization.originalConverter == true
        end

        local ok, result = pcall(originalSave, ac, ...)

        ac.state = prankState
        ac.converter = prankConverter

        if not ok then
            erLog("ERROR while preserving original Additional Currencies settings: " .. tostring(result))
            return nil
        end

        return result
    end

    self.persistencePatched = true
    erLog("Persistence guard installed; original player currency settings will be preserved.")
end

function EconomyRegionalization:lockControls()
    if not self.LOCK_SETTINGS then
        return
    end

    if g_inGameMenu ~= nil and g_inGameMenu.multiMoneyUnit ~= nil and g_inGameMenu.multiMoneyUnit.setDisabled ~= nil then
        g_inGameMenu.multiMoneyUnit:setDisabled(true)
    end

    if AdditionalCurrencies ~= nil and AdditionalCurrencies.checkCurrConv ~= nil and AdditionalCurrencies.checkCurrConv.setDisabled ~= nil then
        AdditionalCurrencies.checkCurrConv:setDisabled(true)
    end
end

function EconomyRegionalization:applyPolicy(reason)
    if AdditionalCurrencies == nil or AdditionalCurrencies.currencies == nil then
        erLog("Additional Currencies is not initialized; cannot apply regional profile.")
        return false
    end

    self:rememberOriginalState()

    local index = self.targetIndex or self:findCurrencyIndex()
    if index == nil then
        erLog("CHF entry was not found in Additional Currencies.")
        return false
    end

    self.targetIndex = index

    local currency = AdditionalCurrencies.currencies[index]
    if self.originalFactor == nil then
        self.originalFactor = currency.factor
    end

    currency.factor = self.CONVERSION_FACTOR
    AdditionalCurrencies.converter = true

    if AdditionalCurrencies.checkCurrConv ~= nil and AdditionalCurrencies.checkCurrConv.setIsChecked ~= nil then
        AdditionalCurrencies.checkCurrConv:setIsChecked(true, true)
    end

    AdditionalCurrencies:setMoneyUnit(index)
    self:lockControls()

    if not self.applied then
        erLog(string.format(
            "Regional profile active: %s, converter ON, factor %.4f (trigger: %s)",
            self.TARGET_SYMBOL,
            self.CONVERSION_FACTOR,
            tostring(reason or "unknown")
        ))
    end

    self.applied = true
    return true
end

function EconomyRegionalization:installSettingsHook()
    if self.settingsHookInstalled or InGameMenuSettingsFrame == nil or InGameMenuSettingsFrame.onFrameOpen == nil then
        return
    end

    InGameMenuSettingsFrame.onFrameOpen = Utils.appendedFunction(
        InGameMenuSettingsFrame.onFrameOpen,
        function(...)
            EconomyRegionalization:applyPolicy("settings-open")
        end
    )

    self.settingsHookInstalled = true
end

function EconomyRegionalization:onMissionReady()
    if AdditionalCurrencies == nil or AdditionalCurrencies.currencies == nil then
        erLog("ERROR: FS25_additionalCurrencies is required but was not available after mission initialization.")
        return
    end

    self:rememberOriginalState()
    self:patchPersistence()
    self:installSettingsHook()
    self:applyPolicy("mission-load")
end

-- Additional Currencies registers a prepended Mission00.setMissionInfo hook.
-- This appended hook runs after it has initialized its currency table and UI.
Mission00.setMissionInfo = Utils.appendedFunction(
    Mission00.setMissionInfo,
    function(mission00, missionInfo, missionDynamicInfo)
        EconomyRegionalization:onMissionReady()
    end
)
