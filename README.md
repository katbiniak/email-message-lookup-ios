# email-message-lookup-ios

This repo contains the code to run the Message Center Application, an iOS application created by Katelyn Biniak.

- [email-message-lookup-ios](#email-message-lookup-ios)
  - [Setup](#setup)
  - [File Structure](#file-structure)


## Setup

**Xcode Version: 14.3**
No cocoa pods install is needed for running this application locally. Just download the project and open the .xcodeproj in Xcode.

Min Supported iOS Version: 15.0+

Supported Devices: iPhone & iPad
Supported Orientations: Portrait & Upside Down (all devices), Landscape (iPad Only)

## File Structure

The files for this project are all located within the Message-Center-App main folder

```
Message-Center-App
├── AppDelegate.swift
├── Info.plist
├── SceneDelegate.swift
├── Resources
│   ├── Assets.xcassets (contains images and color sets)
│   ├── Poppins-Bold.ttf
│   └── Poppins-Regular.ttf
├── Controllers
│   ├── LookupViewController.swift
│   └── ResultsTableViewController.swift
├── Service
│   ├── Message.swift
│   └── MessageService.swift
├── Storyboards
│   ├── LaunchScreen.storyboard
│   └── Main.storyboard
├── Utils
│   ├── Constants.swift
│   └── UIColor+MessageCenter.swift
├── Views
│   ├── EmailFormField.swift & .xib
│   ├── MessageTableViewCell.swift & .xib
│   └── SearchButton.swift

```
