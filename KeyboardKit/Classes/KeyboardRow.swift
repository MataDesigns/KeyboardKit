//
//  KeyboardRow.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/4/20.
//

import UIKit

public protocol KeyboardRowDelegate {
    func tapped(key: KeyboardKey, at row: KeyboardRow)
}

public class KeyboardRow: UIView, KeyboardKeyDelegate {
    public var spacing: CGFloat {
        get {
            return keyStack.spacing
        }
        set {
            keyStack.spacing = newValue
        }
    }
    private var keyStack: UIStackView
    public var delegate: KeyboardRowDelegate?
    
    public init(keys: [KeyboardKey], padding: Padding? = nil, styler: ViewStyler? = nil) {
        keyStack = UIStackView(arrangedSubviews: keys)
        keyStack.axis = .horizontal
        keyStack.distribution = .fillProportionally
        keyStack.translatesAutoresizingMaskIntoConstraints = false
        keyStack.alignment = .fill
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let first = keys[safe: 0] {
            keys.filter({$0 != first && $0.sizing == .equally}).forEach({
                first.heightAnchor.constraint(equalTo: $0.heightAnchor, multiplier: 1).isActive = true
                first.widthAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 1).isActive = true
            })
        }
        
        for key in keys {
            key.delegate = self
        }
        self.addSubview(keyStack)
        keyStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding?.leading ?? 0).isActive = true
        keyStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(padding?.trailing ?? 0)).isActive = true
        keyStack.topAnchor.constraint(equalTo: self.topAnchor, constant: padding?.top ?? 0).isActive = true
        keyStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(padding?.bottom ?? 0)).isActive = true
        styler?.apply(to: self)
        styler?.apply(to: keyStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func tapped(key: KeyboardKey) {
        self.delegate?.tapped(key: key, at: self)
    }
}
