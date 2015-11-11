//
//  ViewController.swift
//  Bubbles
//
//  Created by Mac Bellingrath on 11/9/15.
//  Copyright © 2015 TeamOne. All rights reserved.
//

import UIKit
import AVFoundation

class BubblesViewController: UIViewController, AVAudioSessionDelegate, AVAudioPlayerDelegate, AVCaptureAudioDataOutputSampleBufferDelegate {

    var session = AVCaptureSession()
    
    var players: [AVAudioPlayer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio)
        
        let captureInput = try? AVCaptureDeviceInput(device: captureDevice)
        
        if session.canAddInput(captureInput) {
            session.addInput(captureInput)
        }
        
    
        let captureOutput = AVCaptureAudioDataOutput()
        
        captureOutput.setSampleBufferDelegate(self, queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
        
        
        if session.canAddInput(captureInput){
            session.addInput(captureInput)
        }
        
        guard session.canAddOutput(captureOutput) else { return }
        session.addOutput(captureOutput)
        
        session.startRunning()
    }
    
    //MARK: - AudioPlayer
    
    
    func playSound(name: AVAudioPlayer.AssetIdentifier) {
        
        if let player = AVAudioPlayer(assetIdentifier: name) {
            
            player.delegate = self
            player.play()
            print("playing sound")
        }
        
    }
    
    
    //MARK: - PLAYER

    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
    }
    
    /*
    randomize width & height
    
    change based on width and height corner radius
    
    
    randomize color between blue and purple
    
    
    change duraiton based on apl
    
    randomize bubble.center x & y
    
    

*/
    
    
    //MARK: CAPTURE OUTPUT
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
        
        guard let channel = connection.audioChannels.first where channel.averagePowerLevel > -5 else { return print("Not Blowing") }
     

        let bubble = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: randomCGFloat(10, max: 100), height: randomCGFloat(10, max: 100))))
        bubble.layer.cornerRadius = bubble.frame.size.height / 2
        bubble.layer.borderColor = randomColor().CGColor
        bubble.layer.borderWidth = 1
        
        bubble.center = CGPoint(x: view.center.x, y: view.frame.maxY)
        
        

        dispatch_async(dispatch_get_main_queue()) { () -> Void in
           
            self.view.addSubview(bubble)
            
            
    
            
            
            
            UIView.animateWithDuration(randomDouble(1.0, max: Double(channel.averagePowerLevel) + 5), delay: 0, options: .CurveEaseOut, animations: { () -> Void in
                
                
                bubble.center.y = (self.view.center.y) - randomCGFloat(10, max: 100)
                
                }) { (finished) -> Void in
                    
                    bubble.removeFromSuperview()
                
                    //Play Pop Sound
                    
                    if let bookData = NSDataAsset(name: "Books") {
                        if let player = try? AVAudioPlayer(data: bookData.data) {
                        self.players.append(player)
                            player.play()
                        }
                    }
            }
            
            print("Blowing")
            

            }
        }
   }




