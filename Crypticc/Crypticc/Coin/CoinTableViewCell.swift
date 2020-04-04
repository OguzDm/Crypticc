//
//  CoinTableViewCell.swift
//  Crypticc
//
//  Created by Squiretoss on 2.04.2020.
//  Copyright © 2020 Oguz Demirhan. All rights reserved.
//

import UIKit
//import WebKit

class CoinTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var CoinValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
