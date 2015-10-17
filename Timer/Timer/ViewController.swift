//
//  ViewController.swift
//  Timer
//
//  Created by Mac Bellingrath on 10/12/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    private var timerIsRunning = false
    
    
    var timeDisplay: String = "0"
    
    var time = 0 {
        didSet {
            timeDisplay = "\(time)"
            timeLabel.text = timeDisplay
        }
    }
    
    
    var timer = NSTimer()
    

    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBAction func startTimerPressed(sender: UIBarButtonItem) {
        
        
        
        
        //set timer time interval to fire once per second
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
    
        
        
    }
    
    
    @IBAction func stopTimerPressed(sender: UIBarButtonItem) {
        
        timer.invalidate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //updates time display
    
    
    func updateTime() {
        
        time++
        
    }


}

