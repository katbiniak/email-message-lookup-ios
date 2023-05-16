//
//  MessageService.swift
//  Message-Center-App
//
//  Created by Katelyn Biniak on 5/15/23.
//

import Foundation

struct MessageService {
    
    static func getAllMessages(for userEmail:String,
                               completion: @escaping (_ success: Bool, _ messages: [Message]?, _ errorMessage: String?) -> Void) {
        guard let url = URL(string: Constants.emailSearchEndpoint + userEmail) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(false, nil, error.localizedDescription)
                return
            }
            
            if let data = data {
                // Check if messages are returned
                do {
                    let messages = try JSONDecoder().decode([Message].self, from: data)
                    if messages.isEmpty {
                        completion(false, nil, Constants.noMessages)
                    } else {
                        completion(true, messages, nil)
                    }
                } catch let jsonError {
                    // Check if error json object is returned
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, String>
                        let jsonErrorMessage = json?["Error"] as? String ?? jsonError.localizedDescription

                        completion(false, nil, jsonErrorMessage)
                    } catch {
                        completion(false, nil, jsonError.localizedDescription)
                    }
                }
            } else {
                completion(false, nil, "")
            }
        }
        dataTask.resume()

    }
}
