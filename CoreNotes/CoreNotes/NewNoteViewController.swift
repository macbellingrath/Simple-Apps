//
//  NewNoteViewController.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/16/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreData





class NewNoteViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var categoryPicker: UIPickerView! {
        didSet { categoryPicker.delegate = self ; categoryPicker.dataSource = self }
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) { dismissViewControllerAnimated(true, completion: nil) }
   
    
    @IBAction func createButtonPressed(sender: AnyObject) {
        
        createNote()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        fetchCategories()
    }
   var categories : [Category] = []
}



extension NewNoteViewController: UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate {
    
       
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return categories.count
        
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 30))
        view.backgroundColor = categories[row].color
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: pickerView.rowSizeForComponent(component).height
            ))
        label.text = categories[row].name
        label.textColor = UIColor.whiteColor()
        
        view.addSubview(label)
        
        return view
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}