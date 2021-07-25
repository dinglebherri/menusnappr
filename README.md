# Menu Snappr Overview

![Menu Snappr](https://widgetworx.com/resources/menu_snappr.png)

*Menu Snappr* is a simple but full-featured screen capture utility that runs in your menu bar that supports the following functionality:

- Capture the entire screen (both with and without a 3 or 5 second timer)
- Capture a specific area or region of the screen
- Capture the entire screen as a video in 10, 15, and 30 second recordings
- Capture any screen window or dialog box
- Save your screen captures in PNG, JPEG, TIFF, or BMP format
- Choose where you want to store your screen captures, including on the Cloud via Google Drive (if installed)
- Copy the screen capture to the Clipboard
- Open the screen capture in Preview (or Quicktime if a video)
- Choose whether to include the mouse pointer or drop shadow in a screen capture
- Works in macOS’ Dark mode
- Choose whether or not to run Menu Snappr each time you login to your computer
- And more...


# Building Menu Snappr

*Menu Snappr* was written in a combination of Perl, AppleScript, and shell commands and built with [Platypus](https://www.sveinbjorn.org/platypus).

To build it:

1. Download and install Platypus
2. Use the included **Menu Snappr.platypus** profile and replace the existing script path with a local copy of **menu_cap.pl**
3. Include all of the various .PNG images and the **en_resource.def** file as part of the Platypus app bundle

Have fun!

