//
//  MainViewController.swift
//  ninja_gold_vRemix
//
//  Created by Andy Feng on 5/18/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddToTotalDelegate {

    // Create an array of Building objects ---> var buildingArr = [Building]()
    var buildingArr = [Building]()
    var total: Double = 0
    
    
    // Outlets
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    // Protocol functions
    func addToTotal(amount: Int, isCasino: Bool) {
     
        if isCasino {
            /// It is a casino
            if amount == 1 {
                // Add 10%
                
                total = total + (total * 0.1)
                
            } else {
                // Minus 10%
                
                total = total - (total * 0.1)
            }
        } else {
            /// Not casino
            total += Double(amount)
        }
        
        
        totalLabel.text = "Total Golds: \(String(format: "%.2f", total))"
        
        
    }
    
    
    
    
    
    
    // UI Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /// Generate 4 buildings and push them into the array
        buildingArr.append(Building(name: "house", i: UIImage(named: "house")!))
        buildingArr.append(Building(name: "farm", i: UIImage(named: "farm")!))
        buildingArr.append(Building(name: "cave", i: UIImage(named: "cave")!))
        buildingArr.append(Building(name: "casino", i: UIImage(named: "casino")!))
        
        
        totalLabel.text = "Total Golds: \(total)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    /// How many rows in this table?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildingArr.count
    }
    
    
    /// What does each cell look like?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1 - Instantiate a cell from the reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! BuildingTableViewCell
        
        
        // 2 - Setting the model
        cell.model = buildingArr[indexPath.row]
        
        cell.addToTotalDel = self
        
        print(cell.model)
        
        // 3 - Return the cell so it shows up in the table
        return cell
    }
    
    
    
   
    
    
    
    
}







