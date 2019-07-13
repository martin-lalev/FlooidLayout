# FlooidLayout

FloodLayout is an autolayout DSL, which helps you write a more intuitive and expressive code, by using custom operators. For example, the following standard autolayout code:

```swift
NSLayoutConstraint.activate([
    image.centerXAnchor.constraint(equalTo: container.centerXAnchor),
    image.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
    image.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -2*20),
    image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.6)
])
```

could be written as:

```swift
image.constraints { $0
    --| $1.centerXAnchor == container.centerXAnchor
    --| $1.topAnchor == container.topAnchor + 20
    --| $1.widthAnchor == container.widthAnchor -- 20
    --| $1.heightAnchor == $0.widthAnchor * 0.6
}
```
## Installation

### Cocoapods

Add the following line to your Podfile:

```
pod 'FlooidLayout', '~> 1.0.2.preXcode11'
```

### Swift Package Manager

Add the following dependency to your Package.swift (or use the url and version rule below when integrating via Xcode 11):

```
.package(url: "https://github.com/martin-lalev/FlooidLayout.git", .upToNextMajor(from: "1.0.2.preXcode11"))
```

## How it works

FlooidLayout builds `NSLayoutConstraint` using the `==`, `<=`, or the `>=` operators with the base anchor on the left hand side and a layout expression on the right hand side. The layout expresion may be just a constant (if the lhs is a dimension anchor), or a combination of another anchor, an optional multiplier (`* <multiplier value>`) and an optional constant (`+/- <constant value>`).
> Width and height anchors can also have their constants assigned with `++` or `--` which just multiplies the constant value by 2. This is useful when you want to express some sort of padding or margin on both sides.

To make layout construction even easier, all `UIView`s and `UILayoutGuide`s have a `constraints` helper method which takes a function builder closure. The closure has only one parameter - the object the `constraints` method was called on. This way, you can group related constraints into a single block of code.

## Modifications and variable assignment

FlooidLayout allows you to perform inline changes on some of the constraint properties as well as store the constraint in a variable, thus keeping the declarative nature of your autolayout code.

#### Assigning custom priority

```swift
--| $1.heightAnchor == $1.widthAnchor * 0.6 --! .priority(.defaultHigh)
```

#### Assigning an identifier

```swift
--| $1.centerXAnchor == container.centerXAnchor --! .identifier("iconCenterX")
```

#### Activation

```swift
icon.centerXAnchor == container.centerXAnchor --! .activated
```
> Should be used only if you are declaring a constraint outside of the `constraints` method, since it will automatically activate all constraints in the function builder block.

#### Store in a vairable

```swift
--| $1.topAnchor == container.topAnchor + 20 --> imageTopConstraint
```

#### Chaining

All of the above can be chained together with the only restriction being that the assignment should be at the end of the declaration:

```swift
--| $1.heightAnchor == $1.widthAnchor * 0.6 --! .priority(.defaultHigh) --! .identifier("iconHeight") --> iconHeightConstraint
```

## Additional anchors

FlooidLayout provides a few additional "anchors", which will make your anchor declarations even more expressive:

#### `sizeAnchor`

Modifies both the width and height anchors

```swift
// Constant assignment
--| $1.sizeAnchor == CGSize(width: 30, height: 30)

// Another sizeAnchor assignment
--| $1.sizeAnchor == container.sizeAnchor

// Expanding both dimensions
--| $1.sizeAnchor == container.sizeAnchor + 20

// Shrinking both dimensions (the constant is multipled by two in this example)
--| $1.sizeAnchor == container.sizeAnchor -- 20

// Scaling both dimensions
--| $1.sizeAnchor == container.sizeAnchor * 0.5

// Expanding each dimensions separately
--| $1.sizeAnchor == container.sizeAnchor + (width: 20, height: 40)

// Shrinking each dimensions separately (the constants are multipled by two in this example)
--| $1.sizeAnchor == container.sizeAnchor -- (width: 20, height: 10)

// Scaling each dimensions separately
--| $1.sizeAnchor == container.sizeAnchor * (width: 0.5, height: 0.4)
```

#### `centerAnchor`

Modifies both the centerX centerY anchors. Similarly other location anchors are available, like `leadingTopAnchor`, `centerBottomAnchor`, `rightCenterAnchor`, etc.

```swift

// Another locationAnchor assignment
--| $1.centerAnchor == container.centerAnchor

// Moving both axis
--| $1.leadingTopAnchor == icon.leadingTopAnchor + 20

// Moving each axis separately
--| $1.leadingCenterAnchor == siblingView.trailingCenterAnchor + (x: 10, y: 0)
```

#### `edgesAnchor`

Modifies the top, bottom, leading and trailing anchors

```swift

// Another locationAnchor assignment
--| $1.edgesAnchor == container.edgesAnchor

// Insetting all edges equally
--| $1.edgesAnchor == container.edgesAnchor -- 10

// Insetting edges separately per axis
--| $1.edgesAnchor == container.edgesAnchor -- (horizontally: 20, vertically: 10)

// Insetting each edge separately
--| $1.edgesAnchor == container.edgesAnchor -- (leading: 5, trailing: 15, top: 10, bottom: 20)
```

#### `horizontalEdgesAnchor`

Modifies both the leading and trailing anchors

```swift

// Another horizontalEdgesAnchor assignment
--| $1.horizontalEdgesAnchor == container.horizontalEdgesAnchor

// Insetting both edges equally
--| $1.horizontalEdgesAnchor == container.horizontalEdgesAnchor -- 10

// Insetting each edge separately
--| $1.horizontalEdgesAnchor == container.horizontalEdgesAnchor -- (leading: 5, trailing: 15)
```

#### `verticalEdgesAnchor`

Modifies both the top and bottom anchors

```swift

// Another verticalEdgesAnchor assignment
--| $1.verticalEdgesAnchor == container.verticalEdgesAnchor

// Insetting all edges equally
--| $1.verticalEdgesAnchor == container.verticalEdgesAnchor -- 10

// Insetting each edge separately
--| $1.verticalEdgesAnchor == container.verticalEdgesAnchor -- (top: 10, bottom: 20)
```
