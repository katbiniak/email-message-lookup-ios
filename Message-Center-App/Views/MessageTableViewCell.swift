//
//  MessageTableViewCell.swift
//  Message-Center-App
//
//  Created by Katelyn Biniak on 5/16/23.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
