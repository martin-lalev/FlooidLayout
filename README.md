# FlooidLayout

FloodLayout is a Swift DSL, which helps you write autolayout code in a more intuitive way. For example, the following code snippet:

```swift
NSLayoutConstraint.activate([
    image.centerXAnchor.constraint(equalTo: container.centerXAnchor),
    image.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
    image.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -2*20),
    image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.6)
])
```

could be rewritten as:

```swift
image.constraints { view in
    view.centerXAnchor == container.centerXAnchor
    view.topAnchor == container.topAnchor + 20
    view.widthAnchor == container.widthAnchor -- 20
    view.heightAnchor == view.widthAnchor * 0.6
}
```
## Installation

### Cocoapods

Add the following line to your Podfile:

```
pod 'FlooidLayout', '~> 1.0.4'
```

### Swift Package Manager

Add the following dependency to your Package.swift:

```
.package(url: "https://github.com/martin-lalev/FlooidLayout.git", .upToNextMajor(from: "1.0.4"))
```

## How it works

Building `NSLayoutConstraint`s is done by assigning _layout expressions_ to `NSLayoutAnchor` objects via custom equality operators (`==`, `<=`, or `>=`). The syntax for the _layout expresions_ is:
* simple constant, for width and height anchors (e.g. `view.heightAnchor == 50`) 
* anchor (e.g. `view.leadingAnchor == container.centerXAnchor`)
* anchor with multiplier (e.g. `view.widthAnchor <= container.widthAnchor * 0.8`)
* anchor with constant (e.g. `view.leadingAnchor == thumbnail.trailingAnchor + 15`)
* anchor with multiplier and constant (e.g. `view.heightAnchor == container.heightAnchor * 0.8 - 10`)
> Width and height anchors can also have their constants assigned with `++` or `--` which just multiplies the value by 2. This is useful when you want to express paddings or margins on a view. E.g: `view.widthAnchor == container.widthAnchor -- 10` - this adds a margin of 10pt on the left and right and is equivalent to `view.widthAnchor == container.widthAnchor - 20`.

`FlooidLayout` also provides a result builder which generates a list of `NSLayoutConstraint`s. To use this resut builder, you can call the `constraints` method of  `UIView` (or `UILayoutGuide`) which would also activate the generated list of constraints.

## Modifications and variable assignment

FlooidLayout allows you to perform inline changes on some of the constraint properties as well as store the constraint in a variable, thus maintaining the declarative nature of your autolayout code.

#### Assigning custom priority

```swift
$0.heightAnchor == $0.widthAnchor * 0.6 --! .priority(.defaultHigh)
```

#### Assigning an identifier

```swift
$0.centerXAnchor == container.centerXAnchor --! .identifier("iconCenterX")
```

#### Activation

```swift
icon.centerXAnchor == container.centerXAnchor --! .activated
```
> Should be used only if you are declaring a constraint outside of the `constraints` method. `constraints` will automatically activate all constraints in the function builder block.

#### Store in a vairable

```swift
$0.topAnchor == container.topAnchor + 20 --> imageTopConstraint
```

#### Chaining

All of the modifiers can be chained together with the only rule being that the assignment is at the end:

```swift
$0.heightAnchor == $0.widthAnchor * 0.6 --! .priority(.defaultHigh) --! .identifier("iconHeight") --> iconHeightConstraint
```

## Additional anchors

FlooidLayout provides a few additional "anchors", which will make your anchor declarations even more expressive:

#### `sizeAnchor`

Modifies both the width and height anchors

```swift
// Constant assignment
$0.sizeAnchor == CGSize(width: 30, height: 30)

// Another sizeAnchor assignment
$0.sizeAnchor == container.sizeAnchor

// Expanding both dimensions
$0.sizeAnchor == container.sizeAnchor + 20

// Shrinking both dimensions (the constant is multipled by two in this example)
$0.sizeAnchor == container.sizeAnchor -- 20

// Scaling both dimensions
$0.sizeAnchor == container.sizeAnchor * 0.5

// Expanding each dimensions separately
$0.sizeAnchor == container.sizeAnchor + (width: 20, height: 40)

// Shrinking each dimensions separately (the constants are multipled by two in this example)
$0.sizeAnchor == container.sizeAnchor -- (width: 20, height: 10)

// Scaling each dimensions separately
$0.sizeAnchor == container.sizeAnchor * (width: 0.5, height: 0.4)
```

#### `centerAnchor`

Modifies both the centerX centerY anchors. Similarly other location anchors are available, like `leadingTopAnchor`, `centerBottomAnchor`, `rightCenterAnchor`, etc.

```swift

// Another locationAnchor assignment
$0.centerAnchor == container.centerAnchor

// Moving both axis
$0.leadingTopAnchor == icon.leadingTopAnchor + 20

// Moving each axis separately
$0.leadingCenterAnchor == siblingView.trailingCenterAnchor + (x: 10, y: 0)
```

#### `edgesAnchor`

Modifies the top, bottom, leading and trailing anchors

```swift

// Another locationAnchor assignment
$0.edgesAnchor == container.edgesAnchor

// Insetting all edges equally
$0.edgesAnchor == container.edgesAnchor -- 10

// Insetting edges separately per axis
$0.edgesAnchor == container.edgesAnchor -- (horizontally: 20, vertically: 10)

// Insetting each edge separately
$0.edgesAnchor == container.edgesAnchor -- (leading: 5, trailing: 15, top: 10, bottom: 20)
```

#### `horizontalEdgesAnchor`

Modifies both the leading and trailing anchors

```swift

// Another horizontalEdgesAnchor assignment
$0.horizontalEdgesAnchor == container.horizontalEdgesAnchor

// Insetting both edges equally
$0.horizontalEdgesAnchor == container.horizontalEdgesAnchor -- 10

// Insetting each edge separately
$0.horizontalEdgesAnchor == container.horizontalEdgesAnchor -- (leading: 5, trailing: 15)
```

#### `verticalEdgesAnchor`

Modifies both the top and bottom anchors

```swift

// Another verticalEdgesAnchor assignment
$0.verticalEdgesAnchor == container.verticalEdgesAnchor

// Insetting all edges equally
$0.verticalEdgesAnchor == container.verticalEdgesAnchor -- 10

// Insetting each edge separately
$0.verticalEdgesAnchor == container.verticalEdgesAnchor -- (top: 10, bottom: 20)
```
