//
//  Card.swift
//  Cards
//
//  Created by Denis Nefedov on 10/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMathced = false
    var indentifier: Int
    
    static var cardIdFactory = 0
    
    static func getUnicId() -> Int {
        cardIdFactory += 1
        return cardIdFactory
    }
    
    // constructor to set id of card
    init () {
        self.indentifier = Card.getUnicId()
    }
}
