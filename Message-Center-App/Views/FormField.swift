//
//  FormField.swift
//  Message-Center-App
//
//  Created by Katelyn Biniak on 5/15/23.
//

import Foundation
import UIKit

@IBDesignable class FormField: UIView {
    
    @IBOutlet weak var formTextField: UITextField!
    @IBOutlet weak var bottomBorderView: UIView!
    @IBOutlet weak var errorLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
