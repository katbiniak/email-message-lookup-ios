//
//  LookupViewController.swift
//  Message Center App
//
//  Created by Katelyn Biniak on 5/11/23.
//

import UIKit

class LookupViewController: UIViewController {
    
    @IBOutlet weak var SearchButton: SearchButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SearchButtonSelected(_ sender: SearchButton) {
        sender.isLoading = true
    }
}

