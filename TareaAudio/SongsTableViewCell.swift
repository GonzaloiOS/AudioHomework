//
//  SongsTableViewCell.swift
//  TareaAudio
//
//  Created by Gonzalo Linares N on 6/12/16.
//  Copyright © 2016 Gonzalo Linares N. All rights reserved.
//

import UIKit

class SongsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
