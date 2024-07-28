//
//  NSLayoutEdges.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

@MainActor
public struct NSLayoutEdges {
    let leadingAxisAnchor: NSLayoutXAxisAnchor
    let trailingAxisAnchor: NSLayoutXAxisAnchor
    let topAxisAnchor: NSLayoutYAxisAnchor
    let bottomAxisAnchor: NSLayoutYAxisAnchor
}


@MainActor
public protocol EdgesAnchorProvider {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}
extension UIView: EdgesAnchorProvider {}
extension UILayoutGuide: EdgesAnchorProvider {}

public extension EdgesAnchorProvider {
    var edgesAnchor: NSLayoutEdges { .init(leadingAxisAnchor: self.leadingAnchor, trailingAxisAnchor: self.trailingAnchor, topAxisAnchor: self.topAnchor, bottomAxisAnchor: self.bottomAnchor) }
}
