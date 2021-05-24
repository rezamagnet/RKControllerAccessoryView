//
//  BaseInputViewController.swift
//  StickableButton
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
        let view = AccessoryView(frame: .init(x: .zero, y: .zero, width: view.bounds.width, height: .zero))
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()


    open override var canBecomeFirstResponder: Bool { true }
    
    open override var canResignFirstResponder: Bool { true }
    
    open override var inputAccessoryView: UIView? { accessoryView }
}
