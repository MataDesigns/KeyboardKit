//
//  KeyboardTextKey.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/4/20.
//

import UIKit

public struct TextKeyStyler: ViewStyler {
    
    public var textAlignment: NSTextAlignment
    public var textColor: UIColor
    public var font: UIFont
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    
    public static var system = TextKeyStyler(textAlignment: .center,
                                             textColor: .black,
                                             font: .systemFont(ofSize: 21),
                                             cornerRadius: 5,
                                             backgroundColor: .white)
    
    public init(textAlignment: NSTextAlignment = .center,
                textColor: UIColor = .black,
                font: UIFont = .systemFont(ofSize: 21),
                cornerRadius: CGFloat = 5,
                backgroundColor: UIColor = .white) {
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
    
    public func apply(to view: UIView) {
        switch view {
        case let label as UILabel:
            label.textAlignment = self.textAlignment
            label.textColor = self.textColor
            label.font = self.font
        case let key as KeyboardKey:
            key.backgroundColor = self.backgroundColor
            key.layer.cornerRadius = self.cornerRadius
            key.clipsToBounds = true
        default:
            break
        }
    }
}

public class KeyboardTextKey: KeyboardKey {
    
    public var textLabel: UILabel
    public override var style: ViewStyler? {
        didSet {
            style?.apply(to: textLabel)
        }
    }
    
    public override init(value: String, style: ViewStyler?, sizing: KeyboardKeySizing = .equally) {
        textLabel = UILabel()
        textLabel.text = value
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.5
        textLabel.isUserInteractionEnabled = true
        super.init(value: value, style: style, sizing: sizing)
        style?.apply(to: textLabel)
        style?.apply(to: self)

        self.addSubview(textLabel)
        
        self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: 45).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
