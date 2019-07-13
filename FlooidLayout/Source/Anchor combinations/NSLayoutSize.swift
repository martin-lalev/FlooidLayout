//
//  NSLayoutSize.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutSize {
    let widthAnchor: NSLayoutDimension
    let heightAnchor: NSLayoutDimension
}


public protocol LayoutSizeProvider {
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
}
extension UIView: LayoutSizeProvider {}
extension UILayoutGuide: LayoutSizeProvider {}

public extension LayoutSizeProvider {
    var sizeAnchor: NSLayoutSize { return .init(widthAnchor: self.widthAnchor, heightAnchor: self.heightAnchor) }
}
