//
//  AppButton.swift
//  StickableButton
//
//  Created by Reza Khonsari on 5/23/21.
//

import UIKit

class AppButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .red
    }
    

}
