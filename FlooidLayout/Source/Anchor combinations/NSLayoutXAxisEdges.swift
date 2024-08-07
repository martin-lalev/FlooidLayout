//
//  NSLayoutXAxisEdges.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

@MainActor
public struct NSLayoutXAxisEdges {
    let leadingAxisAnchor: NSLayoutXAxisAnchor
    let trailingAxisAnchor: NSLayoutXAxisAnchor
}


@MainActor
public protocol LayoutXAxisEdgesProvider {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
}
extension UIView: LayoutXAxisEdgesProvider {}
extension UILayoutGuide: LayoutXAxisEdgesProvider {}

public extension LayoutXAxisEdgesProvider {
    var horizontalEdgesAnchor: NSLayoutXAxisEdges { .init(leadingAxisAnchor: self.leadingAnchor, trailingAxisAnchor: self.trailingAnchor) }
}
