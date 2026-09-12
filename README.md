# FS25_EconomyRegionalization

A tiny one-off multiplayer companion mod for **FS25_additionalCurrencies**.

## What it does

- Finds the Swiss Franc entry by its `CHF` symbol (no hard-coded currency index).
- Enables the Additional Currencies converter.
- Uses a fixed runtime conversion factor of `0.93`.
- Applies CHF to all clients that load the server's mod set.
- Locks currency/converter controls while active.
- Preserves each player's original Additional Currencies settings on disk.

## Removal

Disable/remove `FS25_EconomyRegionalization` from the server mod set and restart. Additional Currencies will load each player's previously stored settings again.

## Requirement

- `FS25_additionalCurrencies` 1.0.0.2 (or a compatible later version)

The original Additional Currencies files are not redistributed or modified.
