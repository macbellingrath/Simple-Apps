//
//  InterfaceController.swift
//  CoreNotesWatch Extension
//
//  Created by Mac Bellingrath on 11/18/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var textLabel: WKInterfaceLabel!
    private let session : WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    
   override init() {
    super.init()
    
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        session?.delegate = self
        session?.activateSession()

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func sendBanana() {
        let message = ["message": "BANANA"]
       
        
        if session?.reachable == true {
            session?.sendMessage(message, replyHandler: nil, errorHandler: { (error) -> Void in
                 print("sending message")
                print(error)
            })
        }
    }
    
    func sessionReachabilityDidChange(session: WCSession) {
        print("reachability changed, session: \(session)")
    }
    //MARK: WCSession
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        print(message)
        
        guard let m = message.values.first as? String else { return }
        
        textLabel.setText(m)
    }
}
