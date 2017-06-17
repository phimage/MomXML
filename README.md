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
So you can serialize in memory data model into xml.

### Equatable

Contains extensions to make model objects `Equatable`.

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
