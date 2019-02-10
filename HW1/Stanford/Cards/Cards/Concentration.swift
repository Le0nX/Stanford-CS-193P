//
//  Concentration.swift
//  Cards
//
//  Created by Denis Nefedov on 10/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import Foundation

class Concentration {
    
    // array of cards
    var cards = [Card]()
    
    var ofOnlyOneFacedCardIndex: Int?
    
    func chooseCard(at index: Int) {
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMathced {
            if let matchIndex = ofOnlyOneFacedCardIndex,  matchIndex != index {
                // check if cards do match
                if cards[matchIndex].indentifier == cards[index].indentifier {
                    cards[matchIndex].isMathced = true
                    cards[index].isMathced = true
                }
                cards[index].isFaceUp = true
                ofOnlyOneFacedCardIndex = nil
            } else {
                // either no cards or two cards are faceUp
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                ofOnlyOneFacedCardIndex = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            // every append creates a copy!
//            choseCards.append(card)
//            choseCards.append(card)
            // creates two copy of card and sums it to initial array
            cards += [card, card]
        }
        // TODO: shuffle the cards
    }
}
