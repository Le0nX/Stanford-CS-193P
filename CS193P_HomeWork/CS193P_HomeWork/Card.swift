//
//  Card.swift
//  CS193P_HomeWork
//
//  Created by Denis Nefedov on 25.09.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    let id: Int
    
    
    static var idFactory: Int = 0
    
    static func setUnicId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.setUnicId()
    }
}
