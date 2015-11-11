//
//  ViewController.swift
//  SnappyCam
//
//  Created by Mac Bellingrath on 11/11/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
//    var savedImages: [String] = []
   
  let imgURLS = try! Realm().objects(ImageURL)
    
    
    @IBAction func pressedCaptureButton(sender: AnyObject) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        if  UIImagePickerController.isSourceTypeAvailable(.Camera) {
            picker.sourceType = .Camera
            
        }
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
}




