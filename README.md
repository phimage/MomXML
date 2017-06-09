# MomXML

Create or parse CoreData managed object model XMLs.

## Project description

### Model

Contains `struct` objects which describe each XML elements.

### ToXML
Contains `struct` extensions to create XML string from `struct` objects.

### FromXML

Contains `struct` extensions to create this `struct` objects using XML from `SWXMLHash` frameworks.

### FromCoreData

Contains CoreData extensions to create `struct` objects.
So you can serialize in memory data model into xml.

## Setup

### Using Carthage

Carthage is a decentralized dependency manager for Objective-C and Swift.

Add the project to your Cartfile.
```
github "phimage/MomXML"
```
Run carthage update and follow the additional steps in order to add MomXML to your project.

## Develop

### Download dependencies
Execute
```
carthage update --platform osx
```

### Contribute
- Fork
- Make PR
