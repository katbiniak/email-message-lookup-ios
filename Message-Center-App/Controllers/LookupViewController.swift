//
//  LookupViewController.swift
//  Message Center App
//
//  Created by Katelyn Biniak on 5/11/23.
//

import UIKit
import Foundation

class LookupViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var searchButton: SearchButton!
    @IBOutlet weak var emailFormField: EmailFormField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Tap gesture to resign first responder when keyboard is showing and user taps outside
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        // Add notification observer to enable the search cta
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(enableSearchButton),
                                               name: NSNotification.Name(rawValue: "EnableSearchButton"),
                                               object: nil
        )
    }
    
    // MARK: Observer Methods
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func enableSearchButton(_ notification: NSNotification) {
        if let isValid = notification.userInfo?["isValid"] as? Bool,
           isValid {
            searchButton.enabledState()
        } else {
            searchButton.disabledState()
        }
    }
}

// MARK: IBActions
extension LookupViewController {
    
    @IBAction func SearchButtonSelected(_ sender: SearchButton) {
        sender.isLoading = true
    }

}

