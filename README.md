# PlutoSeamless

Mac automation for opening links in a remote machine.

## How to use?

- Unzip the application from [`dist/PlutoSeamless.zip`](dist/PlutoSeamless.zip)
- Run the application to register it as handlers for HTTP / HTTPS schemes
- Set `PlutoSeamless` as the default application. Go to `System Preferences` -> `General` -> `Default web browser:`. Choose `PlutoSeamless` from the list of browsers.
- Set URL patterns as environment variable `launchctl setenv REMOTE_URL_PATTERN ".*\.google\.com|"`. This will open all google.com links in a remote machine.

## How to build a new version?

- Download [`Platypus`](http://sveinbjorn.org/platypus). Tested the setup with Platypus v5.2.
- Open `Platypus` application.
- Choose script type as `AppleScript`.
- Add args `-l` and `JavaScript`
- Choose the script from `src`.
- Update the app name to `PlutoSeamless`
- Update identifier to `me.varunkumar.plutoseamless`
- Check the option `Accepts dropped items` and click on `Settings`
- From the dialog that opens, check `Register as URI scheme handler`. Add `http`, `https`, and `pluto` as URI schemes. Click `Apply` and close the dialog.
- Click on `Create App` to create the application in the desired location.

## License

The source code is available [here](https://github.com/varunkumar/pluto-seamless) under [MIT license](http://varunkumar.mit-license.org/). Please send any bugs, feedback, complaints, patches.

-- [Varun](http://www.varunkumar.me)
