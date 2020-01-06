//
//  Padding.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/5/20.
//

import Foundation

public struct Padding {
    public var leading: CGFloat
    public var trailing: CGFloat
    public var top: CGFloat
    public var bottom: CGFloat
    
    public static var zero = Padding()
    public init(all: CGFloat) {
        self.init(leading: all, trailing: all, top: all, bottom: all)
    }
    
    public init(leading: CGFloat = 0, trailing: CGFloat = 0 , top: CGFloat = 0, bottom: CGFloat = 0) {
        self.leading = leading
        self.trailing = trailing
        self.top = top
        self.bottom = bottom
    }
}
