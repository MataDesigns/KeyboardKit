//
//  KeyboardKey.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/4/20.
//

import UIKit

@objc public protocol KeyboardKeyDelegate {
    @objc func tapped(key: KeyboardKey)
    @objc optional func longPressed(key: KeyboardKey)
}

public enum KeyboardKeySizing {
    case equally
    case custom
}

public class KeyboardKey: UIView {
    
    public var value: String?
    public var sizing: KeyboardKeySizing
    public var delegate: KeyboardKeyDelegate?
    internal var style: ViewStyler? {
        didSet {
            style?.apply(to: self)
        }
    }
    
    public init(value: String, style: ViewStyler?, sizing: KeyboardKeySizing = .equally) {
        self.value = value
        self.style = style
        self.sizing = sizing
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        self.addGestureRecognizer(tapGesture)
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressed(_:)))
        self.addGestureRecognizer(longPressGesture)
        self.isUserInteractionEnabled = true
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        self.delegate?.tapped(key: self)
    }
    
    @objc func longPressed(_ sender: UITapGestureRecognizer) {
        self.delegate?.longPressed?(key: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
