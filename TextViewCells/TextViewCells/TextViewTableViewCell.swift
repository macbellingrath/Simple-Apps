//
//  TextViewTableViewCell.swift
//  TextViewCells
//
//  Created by Mac Bellingrath on 12/1/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView?  {
        didSet {
            if let attributed = attributedString {
                textView?.attributedText = attributed
            }
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if let attributed = attributedString {
            textView?.attributedText = attributed
        }

    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let attributed = attributedString {
            textView?.attributedText = attributed
        }
    }
    
    override func didAddSubview(subview: UIView) {
        super.didAddSubview(subview)
        if let attributed = attributedString {
            textView?.attributedText = attributed
        }

    }

    static let reuseID = TextViewTableViewCell.description()

    
    var attributedString: NSAttributedString?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView?.attributedText = attributedString
        textView?.sizeToFit()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

func attributedHTML(string string: String) -> NSAttributedString {
    guard let data = string
//        .stringByReplacingOccurrencesOfString("src=\"//", withString: "src=\"https://")
//        .stringByReplacingOccurrencesOfString("href=\"//", withString: "href=\"https://")
        .dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) else {
        return NSAttributedString(string: string)
    }
    
    guard let attributed = try? NSMutableAttributedString(
        data: data,
        options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
        documentAttributes: nil) else {
        return NSAttributedString(string: string)
    }

    attributed.addAttributes([
        NSFontAttributeName : UIFont.preferredFontForTextStyle(UIFontTextStyleBody)],range: NSRange(location: 0, length: attributed.length))
    
    return attributed
}

