# Building from source

### Prerequisites

- [CMake 4.2+](https://cmake.org/download/)
- [Visual Studio 2026](https://visualstudio.microsoft.com/) (or another CMake-supported generator; on Linux, the default make generator is used)
- [Java](https://www.java.com/en/download/) (required by the bundled ffdec-cli)
- [Proton](https://github.com/ValveSoftware/Proton) *(Linux only)* — auto-detected from your Steam installation. Skyrim SE must have been launched via Steam at least once to create the Proton prefix.
- A clean Skyrim Special Edition installation with:
  - The [Creation Kit](https://store.steampowered.com/app/1946180/Skyrim_Special_Edition_Creation_Kit/) installed and **run at least once** to unpack the base game script sources
  - The latest [SKSE64](https://skse.silverlock.org/) installed, including its script source files, overwriting the scripts included with the Creation Kit
  - No other mods or tools overwriting the base game or SKSE script sources

### Setup

Clone the repository with submodules:

```
git clone --recursive https://github.com/orlfman/SkyUI-Community-1.7.104.git
```

If you already cloned without `--recursive`, initialize the submodules with:

```
git submodule update --init
```

The build system expects Papyrus script sources at the following locations within your Skyrim SE game directory:

| Path | Contents |
|------|----------|
| `Data/Source/Scripts/` | Base game and Creation Kit script sources (`TESV_Papyrus_Flags.flg`, `Debug.psc`, `Form.psc`, etc.) |
| `Data/Scripts/Source/` | SKSE64 script sources (`UI.psc`, `StringUtil.psc`, `SKSE.psc`, etc.) |

### Building

The easiest way to build is to double-click `Build.bat`. It will automatically detect your Skyrim SE installation via the Steam registry. If auto-detection fails, it will prompt you to enter the path manually.

You can also set the `SkyrimSE_PATH` environment variable beforehand to skip the prompt:

```
set SkyrimSE_PATH=C:\Program Files (x86)\Steam\steamapps\common\Skyrim Special Edition
```
For convenient debugging, use `MOD_DEBUG_PATH`. `.swf` and `.pex` files will be placed in the specified path. If you only modify the `.swf`, you can test them without exiting the game. Skyrim's interface features "hot reloading." If you are already sitting in the modified menu, open it again to see the changes.
```
set MOD_DEBUG_PATH="C:\Users\user\AppData\Local\ModOrganizer\Skyrim Special Edition\mods\SkyUI_Test"
```

Alternatively, from the command line:

```
cmake --preset debug
cmake --build --preset debug
```

### Building on Linux

The easiest way to build is to run `./build.sh`. It will automatically detect your Skyrim SE installation from your Steam library. If auto-detection fails, it will prompt you to enter the path manually.

You can also set the `SkyrimSE_PATH` environment variable beforehand to skip the prompt:

```bash
export SkyrimSE_PATH="$HOME/.local/share/Steam/steamapps/common/Skyrim Special Edition"
```

For convenient debugging, use `MOD_DEBUG_PATH`:

```bash
export MOD_DEBUG_PATH="$HOME/.local/share/ModOrganizer/Skyrim Special Edition/mods/SkyUI-dev"
```

Alternatively, from the command line (ensure `SkyrimSE_PATH` is exported first):

```bash
cmake --preset debug
cmake --build --preset debug
```

Optional environment variables (or `-D` cache variables) for non-default setups:

| Variable | Purpose |
|----------|---------|
| `CreationKit_PATH` | Folder with `Papyrus Compiler/` and `Data/Source/Scripts/` when the Creation Kit is installed apart from the game (e.g. in another Steam library). Defaults to `SkyrimSE_PATH`. SKSE64 sources are still read from `SkyrimSE_PATH/Data/Scripts/Source/`. |
| `PROTON_WINE` | Wine binary used for the Windows build tools, e.g. `.../GE-Proton11-11/files/bin/wine`. |
| `WINEPREFIX_PATH` | Wine prefix for those tools. Defaults to the game's Steam prefix; point it at an empty folder to keep the build out of the game's prefix. |

### Output

The build produces `dist/SkyUI_SE-<version>.zip` containing:

- `SkyUI_SE.esp` - Plugin file
- `SkyUI_SE.bsa` - Archive containing compiled Papyrus scripts and all interface files

For release use the following command lines:

```
cmake --preset release
cmake --build --preset release
```

