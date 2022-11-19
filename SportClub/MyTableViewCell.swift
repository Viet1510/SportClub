//
//  MyTableViewCell.swift
//  SportClub
//
//  Created by Home on 11/18/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var TitleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
