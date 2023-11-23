# MacOS Settings

This repository aims to list all scriptable MacOS settings. I have tried to identify the keys for each setting in the System Settings GUI and a handful of standard MacOS applications.

The settings are organised by their respective pane in System Settings. Most settings have been tested on macOS 13 (Ventura) and macOS 14 (Sonoma).

## Contributing

Some settings are still missing. They are marked with TODO. If you can identify them, feel free to create a pull request. Also, I didn't have the time to identify the settings for all default macOS apps.

To find out what `defaults` key changes a setting, try the following method:
```shell
defaults read > before.txt
# change setting in GUI
defaults read > after.txt
diff before.txt after.txt
```
This doesn't always work, as some settings are not stored in standard .plist files, but in sqlite databases or .plist files in non-standard locations. Also, sometimes you have to use the `defaults -currentHost read` option to find the corresponding key.

## Credits

I got many settings from [tiiiecherle](https://github.com/tiiiecherle/osx_install_config/blob/master/11_system_and_app_preferences/11c_macos_preferences_14.sh) and [Mathias Beynens](https://github.com/mathiasbynens/dotfiles/blob/main/.macos).
