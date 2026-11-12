# SkyUI Community for Skyrim 1.7.104

This is a port of [SkyUI Community 6.11](https://github.com/doodlum/SkyUI-Community) for **Skyrim SE 1.7.104 and SKSE64 2.3.1**.

I made this for my own setup after updating Skyrim. It keeps the SkyUI inventory, favorites and MCM, with the menus updated to match the files shipped with 1.7.104. The work here builds on SkyUI Community; credit for SkyUI itself goes to the original team and the community contributors.

**[Download SkyUI-Community-1.7.104](https://github.com/orlfman/SkyUI-Community-1.7.104/releases/latest)**

## Requirements

- Skyrim Special Edition **1.7.104**
- **SKSE64 2.3.1**, including its scripts

You don't need the Creation Kit or any build tools to install the release.

## Installation

1. Download **SkyUI-Community-1.7.104.zip** from the releases page. Choose the mod ZIP, not GitHub's source code downloads.
2. Install it with your mod manager and enable **SkyUI_SE.esp**.
3. Disable your previous SkyUI installation if you have one. This download is the complete mod, not a patch to stack on top of another version.
4. Launch Skyrim through SKSE.

If you use other interface mods, check which menus they replace. Loose SWF files can override the menus in SkyUI's BSA, even when SkyUI appears later in your mod manager.

## What's changed?

The main menu, journal, save/load screens and other menus have been updated using Skyrim 1.7.104's own interface files, while keeping SkyUI's changes. That includes the newer menu calls and button handling, plus the quantity slider notification in barter menus.

The Papyrus sources are unchanged from SkyUI Community. They've been rebuilt using the SKSE 2.3.1 script sources.

For the code-level details, see [the port notes](PORT-1.7.104.md).

## Testing

I've used this on Skyrim 1.7.104 with SKSE 2.3.1 through MO2 on Linux with Proton. The menus I tried looked right, loading and saving worked, and the session logs showed SkyUI starting up without a recorded crash.

That's a test on one setup. Gamepad controls, a fresh New Game, and the MCM contents haven't been checked separately. Windows hasn't been tested here, and I haven't tested older Skyrim versions or VR.

If something looks wrong, [open an issue](https://github.com/orlfman/SkyUI-Community-1.7.104/issues) with your Skyrim and SKSE versions, the menu involved, and any other UI mods you use. A screenshot and steps to reproduce it help.

## Building and contributing

[Build instructions are here](BUILDING.md). Fixes and reports are welcome. Please file issues for this port here so they don't get mixed in with upstream SkyUI Community reports.

## Credits

- The original SkyUI team.
- [SkyUI Community](https://github.com/doodlum/SkyUI-Community), maintained by doodlum and its contributors.
- The SKSE team.
- [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler), used to work with the menu files.

This is an unofficial fork, not an official SkyUI Community release.
