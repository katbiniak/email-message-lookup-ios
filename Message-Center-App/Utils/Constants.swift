//
//  Constants.swift
//  Message-Center-App
//
//  Created by Katelyn Biniak on 5/15/23.
//

import Foundation


struct Constants {
    static let emailRegex:String = "[A-Z0-9a-z+!#$%&'*/=?^_`{|}~@.-]+@[A-Za-z0-9!#$%&'*+/=?^_`{|}~@.-]+\\.[A-Za-z]{2,64}"
    static let emailSearchEndpoint = "https://vcp79yttk9.execute-api.us-east-1.amazonaws.com/messages/users/"
    static let noMessages = "No Messages Found"
}
