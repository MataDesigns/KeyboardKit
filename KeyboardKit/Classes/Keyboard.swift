import UIKit

@objc public protocol KeyboardManager {
    @objc optional func stateDidChange(keyboard: Keyboard, from: Int, to: Int)
    func tapped(key: KeyboardKey, at row: KeyboardRow, on: Keyboard)
}

public class Keyboard: UIView, KeyboardRowDelegate {
    
    public var rows: [KeyboardRow] {
        didSet {
            rowStack.removeFromSuperview()
            
        }
    }
    public var spacing: CGFloat {
        get {
            return rowStack.spacing
        }
        set {
            rowStack.spacing = newValue
        }
    }
    private var rowStack: UIStackView
    public var manager: KeyboardManager?
    
    public init(rows: [KeyboardRow]) {
        self.rowStack = UIStackView(arrangedSubviews: rows)
        self.rows = rows
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.process(rows: rows)
        self.addSubview(rowStack)
        
        self.rowStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.rowStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.rowStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.rowStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    public func getKey(row: Int, key: Int) -> KeyboardKey? {
        if let keys = self.rowStack.arrangedSubviews[row] as? UIStackView {
            return keys.arrangedSubviews[key] as? KeyboardKey
        }
        
        return nil
    }
    
    private func process(rows: [KeyboardRow]) {
        rowStack.axis = .vertical
        rowStack.distribution = .fillEqually
        rowStack.alignment = .fill
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        for row in rows {
            row.delegate = self
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func tapped(key: KeyboardKey, at row: KeyboardRow) {
        self.manager?.tapped(key: key, at: row, on: self)
    }
}
