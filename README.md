# Friday Night Funkin' - Codename Engine (WIP)

## PLEASE NOTE - THIS IS STILL IN A BETA STATE
### Mods created with beta versions of Codename may not be compatible with the release version
Known issues in the beta:
- Some options are missing
- Week 5 has no monster animation
- Week 6 still have no dialogue
- Week 7 have no running tankman

Build instructions are below. Press TAB on the main menu to switch mods.

Also, `lime test windows` uses the source assets folder instead of the export one for easier development.

## Codename Engine

Codename Engine is a new Friday Night Funkin' Engine aimed for easier modding, along with extensiblity and ease of use.

### It includes many new features, as seen [here](FEATURES.md)

## How to download

Latest builds for the engine can be found in the [Actions](https://github.com/YoshiCrafter29/CodenameEngine/actions) tab.

<details>
  <summary><h2>Credits</h2></summary>

- Credits to [Ne_Eo](https://twitter.com/Ne_Eo_Twitch) and the [3D-HaxeFlixel](https://github.com/lunarcleint/3D-HaxeFlixel) repository for Away3D Flixel support
- Credits to the [FlxAnimate](https://github.com/Dot-Stuff/flxanimate) team for the Animate Atlas support.
- Credits to Smokey555 for the backup Animate Atlas to spritesheet code.
</details>

<details>
  <summary><h2>How to build</h2></summary>
  
1. **Install the following components.**
  * [Java Developer Kit 11.0.18](https://www.oracle.com/uk/java/technologies/javase/jdk11-archive-downloads.html) <sub> you gotta make an oracle account. </sub>
  * [NDK r21e](https://github.com/android/ndk/wiki/Unsupported-Downloads#r21e)
    - Extract the zip somewhere (keep in mind the path).
  * [Android Studio](https://developer.android.com/studio)
    - After installing Android Studio, Go to Settings => Appearance & Behavior => System Settings => Android SDK and install the following:
        - SDK Platform - Android 4.4 (KitKat).
        - SDK Tools - Android SDK Build-Tools, Android SDK Platform-Tools.
        
2. **Setup Lime for Android.** - run `haxelib run lime setup android`
    * Path to Android SDK = *C:\Users\user\AppData\Local\Android\Sdk* (default path).
    * Path to Android NDK = *Path of the zip you just extracted.*
    * Path to Java JDK = *C:\Program Files\Java\jdk-11* (default path).

3. **Build to Android** - make sure you have a phone with USB debugging enable plugged in to your computer.
    * Run `haxelib run lime test android` to test the game
</details>

