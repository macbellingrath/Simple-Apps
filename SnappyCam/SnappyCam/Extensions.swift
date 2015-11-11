//
//  Extensions.swift
//  SnappyCam
//
//  Created by Mac Bellingrath on 11/11/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import AmazonS3RequestManager

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //MARK: IMAGE PICKER
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        defer {  picker.dismissViewControllerAnimated(true, completion: nil) }
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { print("no image"); return }
        
        guard let imageData = UIImagePNGRepresentation(image) else { print("making image data failed"); return }
    
        // Save to S3
        let amazonS3Manager = AmazonS3RequestManager(bucket: bucket, region: .USStandard, accessKey: myAmazonS3AccessKey, secret: myAmazonS3Secret)
        
        let date =  Int(NSDate().timeIntervalSince1970)
        


      
        amazonS3Manager.putObject(imageData, destinationPath: "\(date).png").responseJSON { (response) in
            
            print("value: ", response.result.value)
            guard let urlResponse  = response.response else { return }
            guard let url = urlResponse.URL?.absoluteString else { return }
            
            
            self.savedImages.append(url)
            
            
//            
//            switch response.response!.statusCode {
//            
//            case 200:
//                let ac = UIAlertController(title: "All Good :) ", message: "Your photo is now in the clouds.", preferredStyle: .Alert)
//                ac.addAction(UIAlertAction(title: "Okay then.", style: .Default, handler: { (ac) -> Void in
//                    self.dismissViewControllerAnimated(true, completion: nil)
//                }))
//                self.presentViewController(ac, animated: true, completion: nil)
//            default:
//                let ac = UIAlertController(title: "OH NO!", message: "Your photo didn't make it to the clouds...", preferredStyle: .Alert)
//                ac.addAction(UIAlertAction(title: "Okay then.", style: .Default, handler: { (ac) -> Void in
//                    self.dismissViewControllerAnimated(true, completion: nil)
//                }))
//                self.presentViewController(ac, animated: true, completion: nil)
//            }
//            
//        }
        }

    
        self.collectionView.reloadData()
        
        picker.dismissViewControllerAnimated(true, completion: nil)

   }
}


// CollectionView
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
       
        item.contentView.subviews.map{ $0.removeFromSuperview()}
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        
        guard let imgNSURL = NSURL(string: savedImages[indexPath.item]) else { print("no"); return item }
       
        print(imgNSURL)
        
        //Background
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) { () -> Void in
            
            guard let data = NSData(contentsOfURL: imgNSURL) else { return }
            
            //Main
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                
                imageView.image = UIImage(data: data)
            }
            
        }
        
        item.contentView.addSubview(imageView)
        
        return item
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return savedImages.count
    }
    
    
}