//
//  AddToTotalDelegate.swift
//  ninja_gold_vRemix
//
//  Created by Andy Feng on 5/18/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import Foundation

protocol AddToTotalDelegate: class {
    func addToTotal(amount: Int, isCasino: Bool)
}
