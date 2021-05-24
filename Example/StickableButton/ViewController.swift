//
//  ViewController.swift
//  StickableButton
//
//  Created by Reza Khonsari on 5/24/21.
//

import UIKit
import RKControllerAccessoryView

class ViewController: BaseInputViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = AppButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
        button.addTarget(self, action: #selector(buttonDidTouch), for: .touchUpInside)
        contentView = button
        
    }
    
    @objc private func buttonDidTouch() {
        print(#function)
    }
    

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
