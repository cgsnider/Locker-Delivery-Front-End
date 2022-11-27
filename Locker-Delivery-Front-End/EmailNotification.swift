//
//  EmailNotification.swift
//  Locker-Delivery-Front-End
//
//  Created by Charles Snider on 11/26/22.
//
//

import UIKit
import SwiftUI

struct Email {
    @Environment(\.openURL) var openURL
    let toAddress: String
    let subject: String
    let body: String
    
    func sendEmail() {

        let urlString = "mailto:\(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        
        guard let url = URL(string: urlString) else { return }
        
        openURL(url) { accepted in
            if !accepted {
                print("This Device Does not support email")
            }
            
        }
    
    }

}

