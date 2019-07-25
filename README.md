
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-ios_macos-lightgrey.svg?style=flat)](https://developer.apple.com/resources/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager compatible](https://img.shields.io/badge/SwiftPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)
[![Build Status](https://travis-ci.org/phimage/MomXML.svg)](https://travis-ci.org/phimage/MomXML)

# MomXML

Create or parse CoreData managed object model XMLs.

## Project description

### Model

Contains `struct` objects which describe each XML elements.

```swift
var momXML = MomXML()
let entityStatus = MomEntity(name: "Status")
momXML.model.entities.append(entityStatus)
let elementStatus = MomElement(name: "Status")
momXML.model.elements.append(elementStatus)
```

### Equatable

Contains extensions to make model objects `Equatable`.

### ToXML
Contains `struct` extensions to create XML string from `struct` objects.

```swift
let string = momXML.xml
```

### FromXML

Contains `struct` extensions to create this `struct` objects using XML from `SWXMLHash` frameworks.

```swift
let xmlString = ... // from file or string
let mom = MomXML(xml: SWXMLHash.parse(xmlString))
```

### FromCoreData

Contains CoreData extensions to create `struct` objects.

```swift
let manageObjectModel: NSManagegObjectModel = ...
let mom: MomXML = manageObjectModel.mom
```

So you can serialize in memory data model into xml.

### ToCoreData

Contains `struct` extensions to create core data objects.

```swift
let mom: MomXML = ..
let manageObjectModel: NSManagegObjectModel = mom.coreData
```

## Setup

### Using Carthage

Carthage is a decentralized dependency manager for Objective-C and Swift.

Add the project to your Cartfile.
```
github "phimage/MomXML"
```
Run carthage update and follow the additional steps in order to add MomXML to your project.

### Using Cocoapod

Add the project to your Podfile to get Model/Equatable/ToXML.
```
pod "MomXML"
```

For only Model.
```
pod "MomXML/Model"
```

There is many subspec to get only the code you want.

For all about XMLs.
```
pod "MomXML/XML"
```

For all about core data.
```
pod "MomXML/CoreData"
```

## Limitations

- Abstract classes
- ...

## Develop

### Download dependencies
Execute
```
carthage update --platform osx
```

### TODO

- ToCoreData is only partially implemented
- Unit Tests on FromCoreData and ToCoreData

### Contribute
- Fork
- Make PR
