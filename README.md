# Storage Lockers

A simple storage locker script for FiveM - **Qbox framework only!**

## Description

This resource adds functional storage lockers to your server, allowing players to store items securely at designated locker locations. Each locker provides configurable storage slots and weight capacity.

## Features

- Multiple storage locker locations
- Configurable storage capacity (slots and weight)
- Ox_lib integration for smooth UI interactions
- Ox inventory compatibility

## Dependencies

- [Qbox Framework](https://github.com/Qbox-project/qbx_core)
- [ox_lib](https://github.com/overextended/ox_lib)

## Installation

1. Download the resource
2. Place `donk_storagelockers` in your server's `resources` folder
3. Add `ensure donk_storagelockers` to your `server.cfg`
4. Restart your server

## Configuration

Edit `shared/config.lua` to customize:

- **Storage Capacity**: Adjust `Config.StorageSlots` and `Config.StorageWeight`
- **Locker Locations**: Add or modify coordinates in `Config.StorageLocations`

```lua
Config.StorageSlots = 50        -- Number of item slots
Config.StorageWeight = 100000   -- Maximum weight capacity
```

## Usage

Players can interact with storage lockers at the configured locations to access their personal storage.

## Credits

**Author**: donk

## Version

1.0.0

## License

This project is open source and available for modification.
