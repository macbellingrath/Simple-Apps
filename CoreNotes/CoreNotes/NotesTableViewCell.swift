//
//  NotesTableViewCell.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/17/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

protocol NoteCellDelegate {
    
    var color: UIColor { get }

}

protocol NoteCellDatasource {
    
    var title: String { get }
    var category: String { get }
}

extension NoteCellDelegate {
    var color : UIColor {
        return UIColor.yellowColor()
    }
}

typealias NoteCellProtocol = protocol<NoteCellDatasource, NoteCellDelegate>


struct NoteViewModel: NoteCellProtocol {
    var title = "Note!"
    var category = "Good Notes"
}



class NotesTableViewCell: UITableViewCell {

    private var delegate: NoteCellDelegate?
    private var datasource: NoteCellDatasource?
    
    @IBOutlet private weak var label: UILabel!
    
    
    func configure(withDatasource datasource: NoteCellDatasource, andDelegate delegate: NoteCellDelegate?) {
        self.delegate = delegate
        self.datasource = datasource
        
        self.textLabel?.text = datasource.title
        self.backgroundColor = delegate?.color
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
