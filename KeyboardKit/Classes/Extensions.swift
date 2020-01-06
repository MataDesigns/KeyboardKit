//
//  Extensions.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/4/20.
//

import Foundation

public extension Collection {
  /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
