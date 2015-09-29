//
//  DetailViewController.swift
//  TheList
//
//  Created by Mac Bellingrath on 9/28/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailLabel: UILabel?
    
    var detailItem: String? {
        didSet {
            detailLabel?.text = detailItem
            
        }
    }
    
    func configureView() {
        if let detail = self.detailItem {
            if let label = self.detailLabel {
                label.text = detail
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        

        
    

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
