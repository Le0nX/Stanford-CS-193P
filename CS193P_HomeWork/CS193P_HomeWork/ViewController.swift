//
//  ViewController.swift
//  CS193P_HomeWork
//
//  Created by Denis Nefedov on 25.09.2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsCard: (cardsButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            FlipsLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardsButtons: [UIButton]!
    
    @IBOutlet weak var FlipsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchBtn(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardsButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
        } else {
            print("card is not in an array")
        }
    }
    
    func updateViewFromModel() {
        for index in cardsButtons.indices {
            let cardBtn = cardsButtons[index]
            let card = game.cards[index]
            
            if card.isFacedUp {
                cardBtn.setTitle(emoji(for: card), for: .normal)
                cardBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cardBtn.setTitle("", for: .normal)
                cardBtn.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    func emoji(for: Card) {
        
    }
    
}

