# FlooidLayout

Turn this autolayout code:

```swift
NSLayoutConstraint.activate([
    view.centerXAnchor.constraint(equalTo: container.centerXAnchor),
    view.topAnchor.constraint(equalTo: container.topAnchor),
    view.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -2*20),
    view.heightAnchor.constraint(equalTo: container.heightAnchor, constant: -2*20)
])
```

into this:

```swift
image.constraints { view in
    view.centerTopAnchor == container.centerTopAnchor
    view.sizeAnchor == container.sizeAnchor -- 20
}
```
## Installation

### Cocoapods

```
pod 'FlooidLayout', '~> 1.0.7'
```

### Swift Package Manager

```
.package(url: "https://github.com/martin-lalev/FlooidLayout", from: "1.0.7")
```

## How it works

FlooidLayout defines custom operators on `NSLayoutAnchor` (e.g. `==`, `<=`, `>=`, etc.), which produce `NSLayoutConstraint`. Examples:
* simple constants for width and height anchors: `view.heightAnchor == 50` 
* anchor reference: `view.leadingAnchor == container.centerXAnchor`
* anchor reference with multiplier: `view.widthAnchor <= container.widthAnchor * 0.8`
* anchor reference with constant: `view.leadingAnchor == sibilingView.trailingAnchor + 15`
* anchor reference with multiplier and constant: `view.heightAnchor == container.heightAnchor * 0.8 - 10`
> Width and height anchors can also have their constants assigned with `++` or `--` which simply multiplies the value by 2. This is useful when you want to express paddings or margins on a view, e.g: `view.widthAnchor == container.widthAnchor -- 10` is equivalent to `view.widthAnchor == container.widthAnchor - 20`.

You can also call `constraints` on a view, which will provide you with a result builder, expecting a list of `NSLayoutConstraint`, which are then activated.

## Modifications and variable assignment

Sometimes you may need to change the priority of a constraint or assign an identifier. You can do this inline with the `--!` operator:

#### Assigning custom priority

```swift
view.heightAnchor == view.widthAnchor * 0.6 --! .priority(.defaultHigh)
```

#### Assigning an identifier

```swift
view.centerXAnchor == container.centerXAnchor --! .identifier("iconCenterX")
```

#### Activation

```swift
view.centerXAnchor == container.centerXAnchor --! .activated
```
> Should be used only if you are declaring a constraint outside of the `constraints` method. `constraints` will automatically activate all constraints listed in the result builder.

#### Store in a vairable

```swift
view.topAnchor == container.topAnchor + 20 --> imageTopConstraint
```

#### Chaining

All of the modifiers can be chained together with the only rule being that the assignment is at the end:

```swift
view.heightAnchor == view.widthAnchor * 0.6 --! .priority(.defaultHigh) --! .identifier("iconHeight") --> iconHeightConstraint
```

## Additional anchors

FlooidLayout provides a few additional "anchors", which will make your anchor declarations even simpler:

#### `sizeAnchor`

Modifies both the width and height anchors

```swift
// Constant assignment
view.sizeAnchor == CGSize(width: 30, height: 30)

// Another sizeAnchor assignment
view.sizeAnchor == container.sizeAnchor

// Expanding both dimensions
view.sizeAnchor == container.sizeAnchor + 20

// Shrinking both dimensions (the constant is multipled by two in this example)
view.sizeAnchor == container.sizeAnchor -- 20

// Scaling both dimensions
view.sizeAnchor == container.sizeAnchor * 0.5

// Expanding each dimensions separately
view.sizeAnchor == container.sizeAnchor + (width: 20, height: 40)

// Shrinking each dimensions separately (the constants are multipled by two in this example)
view.sizeAnchor == container.sizeAnchor -- (width: 20, height: 10)

// Scaling each dimensions separately
view.sizeAnchor == container.sizeAnchor * (width: 0.5, height: 0.4)
```

#### `centerAnchor`

Modifies both the centerX centerY anchors. Similarly other location anchors are available, like `leadingTopAnchor`, `centerBottomAnchor`, `rightCenterAnchor`, etc.

```swift

// Another locationAnchor assignment
view.centerAnchor == container.centerAnchor

// Moving both axis
view.leadingTopAnchor == container.leadingTopAnchor + 20

// Moving each axis separately
view.leadingCenterAnchor == container.trailingCenterAnchor + (x: 10, y: 0)
```

#### `edgesAnchor`

Modifies the top, bottom, leading and trailing anchors

```swift

// Another locationAnchor assignment
view.edgesAnchor == container.edgesAnchor

// Insetting all edges equally
view.edgesAnchor == container.edgesAnchor -- 10

// Insetting edges separately per axis
view.edgesAnchor == container.edgesAnchor -- (horizontally: 20, vertically: 10)

// Insetting each edge separately
view.edgesAnchor == container.edgesAnchor -- (leading: 5, trailing: 15, top: 10, bottom: 20)
```

#### `horizontalEdgesAnchor`

Modifies both the leading and trailing anchors

```swift

// Another horizontalEdgesAnchor assignment
view.horizontalEdgesAnchor == container.horizontalEdgesAnchor

// Insetting both edges equally
view.horizontalEdgesAnchor == container.horizontalEdgesAnchor -- 10

// Insetting each edge separately
view.horizontalEdgesAnchor == container.horizontalEdgesAnchor -- (leading: 5, trailing: 15)
```

#### `verticalEdgesAnchor`

Modifies both the top and bottom anchors

```swift

// Another verticalEdgesAnchor assignment
view.verticalEdgesAnchor == container.verticalEdgesAnchor

// Insetting all edges equally
view.verticalEdgesAnchor == container.verticalEdgesAnchor -- 10

// Insetting each edge separately
view.verticalEdgesAnchor == container.verticalEdgesAnchor -- (top: 10, bottom: 20)
```
