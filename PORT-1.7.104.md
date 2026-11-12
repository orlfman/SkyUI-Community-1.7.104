# Port to Skyrim SE 1.7.104 / SKSE64 2.3.1

Base: upstream `main` at b7a24a9 (6.11 + start-menu fix + Linux build).

## What changed in the game

1.7.x merges the Switch 2 ("Ounce"/NX) UI into every platform's menus:

- two new platform ids, `PLATFORM_NX = 6` and `PLATFORM_NX_MOUSE = 7`; every
  "is this the mouse platform" test now reads `== 0 || == 7`;
- `NXArt` / `NXArtSecondary` button art on `CrossPlatformButtons`, plus new button
  bitmaps and sprites in most menus;
- new engine callbacks (`UpdateTurnPagesButton`, `UpdateLockPickingButtonPrompt`,
  `SetFirstExitedMenu`, `ExitJoyConStrapInstructionScreen`) and menu-to-engine calls
  (`FirstTimeOunceDataTransferCheck`, `OnOunceDataTransfer`, two-argument
  `RequestInputMappings`, `ResetControlsToDefaults_Ounce`);
- StartMenu: a 15th `setupMainMenu` argument, a `statusIcon` clip on main-menu
  entries (hidden per entry with `showIcon:false`), `SaveLoadPanel.SetPlatform`
  forwarding to its list;
- CreditsMenu: a second text field passed to `requestCredits`;
- Journal: `SystemPage` no longer sends the one-argument `CharacterSelected`, key
  remapping is debounced, lists get `SetPlatform`, a controls-category state (NX only);
- `Shared.BSScrollingList` exists in two builds (see below); mouse roll-over only
  selects on the mouse platforms;
- BarterMenu reports `QuantitySliderOpen` like the other item menus.

## What the port does

- **Base XML** (`source/swf`): the 15 vanilla-derived menus that changed, and
  `quest_journal`, are regenerated from the 1.7.104 SWFs with SkyUI's XML tweaks
  re-applied (widened bottom bars, MessageBox/TrainingMenu frame scripts, journal
  version/date fields, the `ConfigPanelFader` import — now on its own character id).
- **ActionScript**: Bethesda's changes are three-way merged into the vanilla-derived
  classes under `Vanilla/` and `PauseMenu/`. SkyUI's rewrites (`MessageBox`,
  `CenteredScrollingList`, `DialogueCenteredList`) keep their logic; only what the new
  XML needs was added (`statusIcon`). Upstream's runtime-version guards are kept, and
  the removed `CharacterSelected` call is still sent on runtimes older than 1.7.
- `VanillaSystem/Shared/BSScrollingList.as` is the StartMenu/Quest_Journal build of
  the list class; other menus use `Vanilla/Shared/BSScrollingList.as`.
- **Papyrus**: sources unchanged; they compile cleanly against SKSE64 2.3.1.
- **Build**: `CreationKit_PATH`, `PROTON_WINE` (env) and `WINEPREFIX_PATH`.

SkyUI's own menus (inventory family, crafting, favorites, map, MCM) are original
designs and were compared with 1.7.104 only at the engine boundary (callbacks,
`GameDelegate` calls): nothing else needed changing. They carry no Switch button art.

## Not done / not verified

- Initial in-game test on Skyrim 1.7.104 / SKSE64 2.3.1 through MO2 and Proton:
  menus used looked correct, existing-save loading and saving worked, and the logs
  showed SkyUI registrations and HUD widget loading without a recorded crash.
  This was one setup, not an exhaustive menu test. Gamepad input, Windows, older runtimes and VR remain unverified.
- `data/interface/*.swf` (reference copies of older vanilla menus) are untouched.
- `SetSaveDisabled` keeps upstream's argument list; vanilla's own call has the same
  shape in 1.6.1170 and 1.7.104.
