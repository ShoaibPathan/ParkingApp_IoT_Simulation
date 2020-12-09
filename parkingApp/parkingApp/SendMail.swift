//
//  SendMail.swift
//  parkingApp
//
//  Created by Nils Brand on 08.01.20.
//  Copyright © 2020 hypeTech. All rights reserved.
//

import Foundation
import MessageUI
import UIKit

//https://developer.apple.com/documentation/messageui/mfmailcomposeviewcontroller

func sendemail(){
    if !MFMailComposeViewController.canSendMail() {
        print("Mail services are not available")
        return
    }
    
    let composeVC = MFMailComposeViewController()
   
    //geht nicht: self.composeVC.mailComposeDelegate
     
    // Configure the fields of the interface.
    composeVC.setToRecipients(["coordinator@vicinity-h2020.eu"])
    composeVC.setSubject("Hello!")
    composeVC.setMessageBody("Dear Professor Grimm,", isHTML: false)
     
    // Present the view controller modally.
   // geht nicht: self.present(composeVC, animated: true, completion: nil)
    
    func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
}
