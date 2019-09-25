//
//  Concentration.swift
//  CS193P_HomeWork
//
//  Created by Denis Nefedov on 25.09.2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsCard: Int) {
        for _ in 0..<numberOfPairsCard {
            let card = Card()
            cards += [card, card] // creates 2 copyes of card
        }
        // TODO: shuffle the cards
    }
}
