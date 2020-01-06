//
//  KeyboardKitViewController.swift
//  KeyboardKit
//
//  Created by Nicholas Mata on 1/5/20.
//

import UIKit

public protocol KeyboardKitDelegate {
    func keyboard(for type: UIKeyboardType) -> Keyboard
    func keyboardDidLoad(_ keyboard: Keyboard)
}

open class KeyboardKitViewController: UIInputViewController {
    
    public var currentKeyboard: Keyboard? {
        willSet {
            if let currentKeyboard = currentKeyboard {
                currentKeyboard.removeFromSuperview()
            }
        }
        didSet {
            if let currentKeyboard = currentKeyboard {
                self.view.addSubview(currentKeyboard)
                self.delegate?.keyboardDidLoad(currentKeyboard)
            }
        }
    }
    public var delegate: KeyboardKitDelegate?
    
    private var keyboardType: UIKeyboardType = .default
    public var currentKeyboardType: UIKeyboardType {
        get {
            return self.textDocumentProxy.keyboardType ?? .default
        }
    }
    
    open override func viewDidLoad() {
        keyboardType = self.textDocumentProxy.keyboardType ?? .default
        if let keyboard = self.delegate?.keyboard(for:  keyboardType) {
            currentKeyboard = keyboard
        }
    }
    
    open override func textWillChange(_ textInput: UITextInput?) {
        if keyboardType != currentKeyboardType {
            keyboardType = currentKeyboardType
            if let keyboard = self.delegate?.keyboard(for: keyboardType) {
                currentKeyboard = keyboard
            }
        }
    }
    
}
