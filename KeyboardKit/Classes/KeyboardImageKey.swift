//
//  KeyboardImageKey.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/5/20.
//

import UIKit

public struct ImageKeyStyler: ViewStyler {
    public var tintColor: UIColor
    public var backgroundColor: UIColor
    public var cornerRadius: CGFloat
    
    public init(tintColor: UIColor = .black,
                backgroundColor: UIColor = UIColor(red: 172.0/255.0, green: 179.0/255.0, blue: 188.0/255.0, alpha: 1),
                cornerRadius: CGFloat = 5) {
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    public func apply(to view: UIView) {
        switch view {
        case let imageView as UIImageView:
            imageView.tintColor = tintColor
        case let key as KeyboardKey:
            key.backgroundColor = backgroundColor
            key.layer.cornerRadius = cornerRadius
        default:
            break
        }
    }
    
}

public class KeyboardImageKey: KeyboardKey {
    
    public static var backspace = KeyboardImageKey(image: UIImage(named: "Backspace", in: Bundle(for: Keyboard.self), compatibleWith: nil), value: "backspace")
    public static var shiftOnce = KeyboardImageKey(image: UIImage(named: "ShiftOnce", in: Bundle(for: Keyboard.self), compatibleWith: nil), value: "shiftonce")
    public static var shiftOff = KeyboardImageKey(image: UIImage(named: "ShiftOff", in: Bundle(for: Keyboard.self), compatibleWith: nil), value: "shiftoff")
    
    public var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    public var imageView: UIImageView!
    public override var style: ViewStyler? {
        didSet {
            style?.apply(to: imageView)
        }
    }
    
    public convenience init(image: UIImage?, value: String, style: ViewStyler? = nil) {
        self.init(value: value, style: style)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
//        self.imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        style?.apply(to: imageView)
        style?.apply(to: self)
    }
}
