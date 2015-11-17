//
//  ViewController.swift
//  TickyClock
//
//  Created by Mac Bellingrath on 11/10/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentTimeTimer: NSTimer?
    
    var countDownTimer: NSTimer?
    
    var countDownLeft: NSTimeInterval = 0
    
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBOutlet weak var countDownTextField: UITextField!
    
    @IBAction func timerButtonpressed(sender: TickyTimerButton) {

        guard let title = sender.titleLabel?.text,
            let seconds = Double(countDownTextField.text!) else { return }
        
        //guard countdowntimer == nil , let seconds text = countdownfield.text else return countdownleft = double(secondstext) ?? 0 if countdownleft < 0 ,
        
        countDownLeft = seconds ?? 0

        
        switch title {
        case "Start":
            guard countDownTimer == nil else { return }
          
            if countDownLeft >  0 {
                countDownLeft++
                updatCountDown()
                countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCountDown", userInfo: nil, repeats: true)
                countDownTimer?.invalidate()
            }
            
            countDownTextField.text = ""
            
            case "Lap":
                print("lapped")
            
            case "Clear":
                countDownTimer?.invalidate()
                countDownTimer = nil
                
                countDownLabel.text = "00:00:00"
                print("Cleared")
            
            
            
            default : print("unknown button"); break
        }
        
        
        
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
                updateCurrentTime()
        currentTimeTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCurrentTime", userInfo: nil, repeats: true)
    }
    
    func updateCurrentTime() {
        
        //get current date/time
        let date = NSDate()

        //update label with format hh:mm:ss
        let formatter = NSDateFormatter()
        
        formatter.timeStyle = .MediumStyle
       currentTimeLabel.text = formatter.stringFromDate(date)
//        let compFormatter = NSDateComponentsFormatter()
//        compFormatter.allowedUnits = [.Hour, .Minute, .Second]
//        
//        print(compFormatter.stringFromTimeInterval())
        
        print(formatter.stringFromDate(date))
        
    }
    
    func updatCountDown() {
        
        //decrementing a property
        countDownLeft--
        
//        let compformatter = NSDateComponentsFormatter()
//        compformatter.allowedUnits = [.Hour, .Minute, .Second]
        
        let hours = Int(floor(countDownLeft / 3600))
        let minutes = Int(floor((countDownLeft % 3600) / 60))
        let seconds = Int(countDownLeft % 60)
        
        
        
        let hoursString = hours < 10 ? "0\(hours)" : "\(hours)"
        let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        
        //update label with format hh:mm:ss
        countDownLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
        
        if countDownLeft <= 0 {
            countDownTimer?.invalidate()
            countDownTimer = nil
        }
        
    }
    
    
    
    //MARK: TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LapCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "00:00"
        
        return cell
    }
 


}

