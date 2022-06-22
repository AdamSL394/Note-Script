//
//  NotePrototypeCell.swift
//  Note-Script
//
//  Created by Adam Lehrer on 6/22/22.
//

import UIKit

class NotePrototypeCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var note: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
