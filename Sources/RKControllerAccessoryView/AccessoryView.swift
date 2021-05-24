//
//  AccessoryView.swift
//  StickableButton
//
//  Created by Reza Khonsari on 5/23/21.
//

import UIKit

class AccessoryView: UIView {
    
    var contentViewBottomSpace: CGFloat = 20 {
        didSet {
            stackViewBottomConstraint.constant = bottomInset
        }
    }
    var stackView = UIStackView()
    private lazy var stackViewBottomConstraint = stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackViewBottomConstraint,
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        registerKeyboardNotifications()
    }
    
    override var intrinsicContentSize: CGSize { stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize) }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func registerKeyboardNotifications() {
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(keyboardChangeFrame(notification:)),
                                                name: UIResponder.keyboardWillChangeFrameNotification,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(keyboardWillHide(notification:)),
                                                name: UIResponder.keyboardWillHideNotification,
                                                object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        
        
     }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
  
    @objc func keyboardChangeFrame(notification: Notification) {
        let userInfo = notification.userInfo!
        guard let keyboardEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        // MARK: - 100 Can be more stable
        stackViewBottomConstraint.constant = keyboardEndFrame.height > 100 ? -contentViewBottomSpace : bottomInset
    }
     
     @objc func keyboardWillHide(notification: Notification) {
        stackViewBottomConstraint.constant = bottomInset
     }
    
    var bottomInset: CGFloat {
        if #available(iOS 11.0, *) {
            return safeAreaInsets.bottom > 0 ? .zero : -contentViewBottomSpace
        } else {
            return -contentViewBottomSpace
        }
    }
    
}
