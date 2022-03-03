//
//  BaseInputViewController.swift
//  RKControllerAccessoryView
//
//  Created by Reza Khonsari on 5/23/21.
//

import UIKit

open class BaseInputViewController: UIViewController {
    
    public var contentView: UIView? {
        didSet {
            guard let contentView = contentView else { fatalError("Use a view for this") }
            accessoryView.stackView.addArrangedSubview(contentView)
        }
    }
    
    public var bottomMarginSpace: CGFloat {
        get { accessoryView.contentViewBottomSpace }
        set(space) {
            accessoryView.contentViewBottomSpace = space
        }
    }

    private lazy var accessoryView: AccessoryView = {
        let view = AccessoryView(frame: .init(x: .zero, y: .zero, width: self.view.bounds.width, height: .zero))
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.hasSafeAreaInset = true
        return view
    }()
    
    public var hasSafeAreaInset: Bool {
        get { accessoryView.hasSafeAreaInset }
        set { accessoryView.hasSafeAreaInset = newValue }
    }

    open override var canBecomeFirstResponder: Bool { true }
    
    open override var canResignFirstResponder: Bool { true }
    
    open override var inputAccessoryView: UIView? { accessoryView }
}
