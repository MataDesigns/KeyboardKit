//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Nicholas Mata on 1/4/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import KeyboardKit

struct GraySystemTextStyler: ViewStyler {
    func apply(to view: UIView) {
        TextKeyStyler.system.apply(to: view)
        switch view {
        case let label as UILabel:
            label.font = .systemFont(ofSize: 16)
        case let key as KeyboardKey:
            key.backgroundColor = UIColor(red: 172.0/255.0, green: 179.0/255.0, blue: 188.0/255.0, alpha: 1)
        default:
            break
        }
    }
}

struct BottomRowTextStyler: ViewStyler {
    func apply(to view: UIView) {
        TextKeyStyler.system.apply(to: view)
        switch view {
        case let label as UILabel:
            label.font = .systemFont(ofSize: 16)
        default:
            break
        }
    }
}
//
//class KeyboardViewController: UIInputViewController, KeyboardKeyDelegate {
//    func keyTapped(_ key: KeyboardKey) {
//        if let value = key.value {
//            switch value {
//            case "backspace":
//                textDocumentProxy.deleteBackward()
//            case "space":
//                textDocumentProxy.insertText(" ")
//            default:
//                textDocumentProxy.insertText(value)
//
//            }
//        }
//    }
//
//
//    @IBOutlet var nextKeyboardButton: UIButton!
//
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//
//        // Add custom view sizing constraints here
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let firstRow = KeyboardRow(keys: [
//            KeyboardTextKey(value: "Q", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "W", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "E", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "R", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "T", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "Y", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "U", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "I", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "O", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "P", style: TextKeyStyler.system)
//        ])
//        if let first = firstRow.keyStack.arrangedSubviews[safe: 0] {
//            firstRow.keyStack.arrangedSubviews.filter({$0 != first}).forEach({
//                first.heightAnchor.constraint(equalTo: $0.heightAnchor, multiplier: 1).isActive = true
//                first.widthAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 1).isActive = true
//            })
//        }
//        firstRow.keyStack.spacing = 5
//
//        let secondRow = KeyboardRow(keys: [
//            KeyboardTextKey(value: "A", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "S", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "D", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "F", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "G", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "H", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "J", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "K", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "L", style: TextKeyStyler.system)
//        ],padding: RowPadding(leading: 22, trailing: 22))
//
//        if let first = secondRow.keyStack.arrangedSubviews[safe: 0] {
//            secondRow.keyStack.arrangedSubviews.filter({$0 != first}).forEach({
//                first.heightAnchor.constraint(equalTo: $0.heightAnchor, multiplier: 1).isActive = true
//                first.widthAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 1).isActive = true
//            })
//        }
//        secondRow.keyStack.spacing = 5
//
//        let shiftOnce = KeyboardImageKey.shiftOnce
//        shiftOnce.style = ImageKeyStyler()
//
//        let backspace = KeyboardImageKey.backspace
//        backspace.style = ImageKeyStyler()
//        let thirdRow = KeyboardRow(keys: [
//            shiftOnce,
//            KeyboardTextKey(value: "Z", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "X", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "C", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "V", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "B", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "N", style: TextKeyStyler.system),
//            KeyboardTextKey(value: "M", style: TextKeyStyler.system),
//            backspace,
//        ])
//        thirdRow.keyStack.spacing = 5
//        if let first = thirdRow.keyStack.arrangedSubviews[safe: 2] {
//            thirdRow.keyStack.arrangedSubviews.enumerated().filter({$1 != first && $0 < 8 && $0 > 0}).forEach({
//                first.heightAnchor.constraint(equalTo: $1.heightAnchor, multiplier: 1).isActive = true
//                first.widthAnchor.constraint(equalTo: $1.widthAnchor, multiplier: 1).isActive = true
//            })
//        }
//
//        if let first = thirdRow.keyStack.arrangedSubviews[safe: 0],
//            let last = thirdRow.keyStack.arrangedSubviews[safe: thirdRow.keyStack.arrangedSubviews.count - 1]{
//            first.heightAnchor.constraint(equalTo: last.heightAnchor, multiplier: 1).isActive = true
//            first.widthAnchor.constraint(equalTo: last.widthAnchor, multiplier: 1).isActive = true
//        }
//
//
//        let fourthRow = KeyboardRow(keys: [
//            KeyboardTextKey(value: "123", style: GraySystemTextStyler()),
//            KeyboardTextKey(value: "space", style: BottomRowTextStyler()),
//            KeyboardTextKey(value: ".", style: BottomRowTextStyler()),
//            KeyboardTextKey(value: "go", style: GraySystemTextStyler()),
//        ])
//        if let first = fourthRow.keyStack.arrangedSubviews[safe: 0],
//            let last = fourthRow.keyStack.arrangedSubviews[safe: fourthRow.keyStack.arrangedSubviews.count - 1]{
//            first.heightAnchor.constraint(equalTo: last.heightAnchor, multiplier: 1).isActive = true
//            first.widthAnchor.constraint(equalTo: last.widthAnchor, multiplier: 1).isActive = true
//        }
//
//        if let first = fourthRow.keyStack.arrangedSubviews[safe: 1],
//            let last = fourthRow.keyStack.arrangedSubviews[safe: fourthRow.keyStack.arrangedSubviews.count - 2]{
//            first.widthAnchor.constraint(greaterThanOrEqualTo: last.widthAnchor,multiplier: 3).isActive = true
//            first.heightAnchor.constraint(equalTo: last.heightAnchor, multiplier: 1).isActive = true
//        }
//        fourthRow.keyStack.spacing = 5
//        let keyboard = Keyboard(rows: [
//            firstRow,
//            secondRow,
//            thirdRow,
//            fourthRow
//        ])
//        keyboard.rowStack.spacing = 10
//        keyboard.delegate = self
//        self.view.addSubview(keyboard)
//
//        keyboard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
//        keyboard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
//        keyboard.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 5).isActive = true
//        keyboard.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
//    }
//
//    override func textWillChange(_ textInput: UITextInput?) {
//        switch self.textDocumentProxy.keyboardType {
//        case .webSearch:
//            NSLog("Numbers and Punctuation")
//        default:
//            break
//        }
//    }
//}

public enum KeyboardState: Int {
    case shiftOnce
    case shiftOn
    case shiftOff
}

public struct KeyboardActionButton {
    static var shiftOnce = "shiftonce"
    static var shiftOn = "shifton"
    static var shiftOff = "shiftoff"
}

class KeyboardViewController: KeyboardKitViewController, KeyboardKitDelegate, KeyboardManager {
    
    var state: KeyboardState = .shiftOnce
    func tapped(key: KeyboardKey, at row: KeyboardRow, on keyboard: Keyboard) {
        if let value = key.value {
            switch value {
            case "backspace":
                textDocumentProxy.deleteBackward()
            case "space":
                textDocumentProxy.insertText(" ")
            case "shiftonce":
                state = .shiftOff
                reload()
            case "shiftoff":
                state = .shiftOnce
                reload()
            default:
                if state == .shiftOnce {
                    state = .shiftOff
                }
                reload()
                textDocumentProxy.insertText(value)
            }
        }
    }
    
    func reload(){
        self.currentKeyboard = self.keyboard(for: self.currentKeyboardType)
    }
    
    func keyboard(for type: UIKeyboardType) -> Keyboard {
        let keyboard = Keyboard(rows: [
            firstRow(for: type),
            secondRow(for: type),
            thirdRow(for: type),
            fourthRow(for: type)
        ])
        keyboard.spacing = 10
        keyboard.manager = self
        return keyboard
    }
    
    func keyboardDidLoad(_ keyboard: Keyboard) {
        let padding = Padding(all: 5)
        keyboard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding.leading).isActive = true
        keyboard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding.trailing).isActive = true
        keyboard.topAnchor.constraint(equalTo: self.view.topAnchor, constant: padding.top).isActive = true
        keyboard.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -padding.bottom).isActive = true
    }
    
    override func viewDidLoad() {
        self.delegate = self
        super.viewDidLoad()
    }
    
    func firstRow(for type: UIKeyboardType) -> KeyboardRow {
        let keys = ["q", "w", "e","r", "t", "y", "u", "i", "o", "p"].map({ (value) -> String in
            if state == .shiftOnce || state == .shiftOn {
                return value.uppercased()
            } else {
                return value.lowercased()
            }
        }).map { (key) -> KeyboardKey in
            return KeyboardTextKey(value: key, style: TextKeyStyler(cornerRadius: 5))
        }
        let row = KeyboardRow(keys: keys)
        row.spacing = 5
        return row
    }
    
    func secondRow(for type: UIKeyboardType) -> KeyboardRow {
        let keys = ["a", "s", "d","f", "g", "h", "j", "k", "l"].map({ (value) -> String in
            if state == .shiftOnce || state == .shiftOn {
                return value.uppercased()
            } else {
                return value.lowercased()
            }
        }).map { (key) -> KeyboardKey in
            return KeyboardTextKey(value: key, style: TextKeyStyler(cornerRadius: 5))
        }
        let row = KeyboardRow(keys: keys, padding: Padding(leading: 22, trailing: 22))
        row.spacing = 5
        return row
    }
    
    func thirdRow(for type: UIKeyboardType) -> KeyboardRow {
        var keys = ["z", "x", "c","v", "b", "n", "m"].map({ (value) -> String in
            if state == .shiftOnce || state == .shiftOn {
                return value.uppercased()
            } else {
                return value.lowercased()
            }
        }).map { (key) -> KeyboardKey in
            return KeyboardTextKey(value: key, style: TextKeyStyler(cornerRadius: 5))
        }
        let leftSpacer = KeyboardKeySpacer(sizing: .custom)
        keys.insert(leftSpacer, at: 0)
        leftSpacer.widthAnchor.constraint(equalToConstant: 1).isActive = true
        let rightSpacer = KeyboardKeySpacer(sizing: .custom)
        keys.append(rightSpacer)
        rightSpacer.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        let leftActionKey: KeyboardImageKey
        switch state {
        case .shiftOnce:
            leftActionKey = KeyboardImageKey.shiftOnce
            leftActionKey.sizing = .custom
            leftActionKey.style = ImageKeyStyler()
            keys.insert(leftActionKey, at: 0)
        case .shiftOff:
            fallthrough
        default:
            leftActionKey = KeyboardImageKey.shiftOff
            leftActionKey.sizing = .custom
            leftActionKey.style = ImageKeyStyler()
            keys.insert(leftActionKey, at: 0)
        }
        
        
        let backspace = KeyboardImageKey.backspace
        backspace.sizing = .custom
        backspace.style = ImageKeyStyler()
        keys.append(backspace)
        
        let row = KeyboardRow(keys: keys)
        row.spacing = 5
        
        leftActionKey.widthAnchor.constraint(equalTo: backspace.widthAnchor).isActive = true
        leftActionKey.heightAnchor.constraint(equalTo: backspace.heightAnchor).isActive = true
        return row
    }
    
    func fourthRow(for type: UIKeyboardType) -> KeyboardRow {
        let row = KeyboardRow(keys: [
            KeyboardTextKey(value: "123", style: GraySystemTextStyler(), sizing: .custom),
            KeyboardTextKey(value: "space", style: BottomRowTextStyler(), sizing: .custom),
            KeyboardTextKey(value: ".", style: BottomRowTextStyler(), sizing: .custom),
            KeyboardTextKey(value: "go", style: GraySystemTextStyler(), sizing: .custom),
        ])
        row.spacing = 5
        return row
    }
}
