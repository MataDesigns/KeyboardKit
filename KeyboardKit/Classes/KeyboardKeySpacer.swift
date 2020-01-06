//
//  KeyboardKeySpacer.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/5/20.
//

import UIKit

public class KeyboardKeySpacer: KeyboardKey {
    
    internal struct NoStyler: ViewStyler {
        public var minimumWidth: CGFloat = 1
        func apply(to view: UIView) {
            switch view {
            case let key as KeyboardKey:
                key.widthAnchor.constraint(greaterThanOrEqualToConstant: minimumWidth).isActive = true
            default:
                break
            }
        }
    }
    public convenience init(sizing: KeyboardKeySizing = .equally) {
        self.init(value: "", style: NoStyler(), sizing: sizing)
        self.gestureRecognizers?.removeAll()
    }

}
