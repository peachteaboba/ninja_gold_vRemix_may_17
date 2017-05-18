//
//  BuildingTableViewCell.swift
//  ninja_gold_vRemix
//
//  Created by Andy Feng on 5/18/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class BuildingTableViewCell: UITableViewCell {

    
    // Variable
    var addToTotalDel: AddToTotalDelegate?
    
    
    // Outlets
    @IBOutlet weak var buildingImageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    
    
    
    
    // Actions
    @IBAction func handleGoButtonPressed(_ sender: UIButton) {
        if let m = _model {
            m.count += 1
            countLabel.text = "\(m.name) count: \(m.count)"
        
            
            var rand = 0
            var isC = false
            
            
            /// Depending on the building, generate random number
            if m.name == "house"{

                // from 1 - 5
                rand = Int(arc4random_uniform(5)) + 1
                
                
            } else if m.name == "farm" {
                
                // from 10 - 20
                rand = Int(arc4random_uniform(11)) + 10

                
              
            } else if m.name == "cave" {
                
                // from 25 - 50
                rand = Int(arc4random_uniform(26)) + 25

                
                
            } else {
                
                // from 1 - 2
                rand = Int(arc4random_uniform(2)) + 1

                isC = true
                
            }

 
            addToTotalDel?.addToTotal(amount: rand, isCasino: isC)
            
            
        }
    }
    
    
    
    
    
    
    // Model
    private var _model: Building?
    
    var model: Building {
        
        /// Getter
        get {
            // something = model
            return _model!
        }
        
        
        /// Setter
        set {
            // model = something
            _model = newValue
            
            // Do stuff
            doStuff()
            
        }
        
    }
    
    
    
    
    
    
    
    
    // Helper functions
    func doStuff(){
        
        // Safe unwrap the optional
        if let m = _model {
            
            buildingImageView.image = m.buildingImage
            countLabel.text = "\(m.name) count: \(m.count)"
            
            if m.name == "house"{
                // I'm in a house
                amountLabel.text = "+1 ~ 5"
            } else if m.name == "farm" {
                amountLabel.text = "+10 ~ 20"
            } else if m.name == "cave" {
                amountLabel.text = "+25 ~ 50"
            } else {
                amountLabel.text = "+/- 10%"
            }
            
        }

    }
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
