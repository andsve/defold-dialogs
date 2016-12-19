# defold-dialogs
Super simple Defold library for accessing native save and open dialogs (using LuaJit FFI).

## Usage
1. Add this library as a [dependency](http://www.defold.com/manuals/libraries/#_setting_up_library_dependencies) in your Defold project. Pick one of the release Zip file URLs from: https://github.com/andsve/defold-dialogs/releases

2. Currently you need to copy the `native_libs` folder supplied in the library to the root of your project.

3. In your script, add; `local dialogs = require "dialogs/dialogs"`.

4. When you want to show a dialog, call:
    * Show an open dialog:
    ```Lua
    print(dialogs.open(".txt,.lua", "c:/PathToDefaultDirectory"))
    ```

    * Show an save dialog:
    ```Lua
    print(dialogs.save(".txt,.lua", "c:/PathToDefaultDirectory"))
    ```

## Limitations
- Only works on Windows (32bit) and OSX (32bit+64bit) for now.

## Changelog
- `0.9 - 2016-12-19` - Initial release, Win32 and OSX support.

## Credits
Uses the fantastic [mlabbe/nativefiledialog](https://github.com/mlabbe/nativefiledialog) as precompiled dynamic libraries, see [`dialogs/native_libs`](dialogs/native_libs).
