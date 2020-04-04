//
//  DescriptionViewController.swift
//  Crypticc
//
//  Created by Squiretoss on 1.04.2020.
//  Copyright © 2020 Oguz Demirhan. All rights reserved.
//

import Foundation
import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    @IBOutlet weak var highestPriceLabel: UILabel!
    
    var descriptionText = "DenemeDenemeDenemeDenemeDeneme"
    var price = "1000.00"
    var highestPrice = "5000.00"
    
    
    
    
    override func viewDidLoad() {
        print("Description Screen is active")
        
        descriptionTextView.text = descriptionText
        descriptionTextView.backgroundColor = .clear
        priceLabel.text = price
        highestPriceLabel.text = highestPrice
        
        
        
        
    }
}
