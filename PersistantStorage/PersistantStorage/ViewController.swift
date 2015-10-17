//
//  ViewController.swift
//  PersistantStorage
//
//  Created by Mac Bellingrath on 10/12/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var name: String? {
        
        get {
           return NSUserDefaults.standardUserDefaults().objectForKey("name") as? String
        }
        
        set {
             NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "name")
        }
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func buttonPressed(sender: UIButton) {
        
        name = textField.text

        if let name = textField.text {
        textLabel.text = "Hi \(name)"
            NSUserDefaults.standardUserDefaults().setObject(name, forKey: "name")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = name {
            textLabel.text = "Welcome back " + name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

