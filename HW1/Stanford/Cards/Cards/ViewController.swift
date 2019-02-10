//
//  ViewController.swift
//  Cards
//
//  Created by Denis Nefedov on 09/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cards: [UIButton]!
    @IBOutlet weak var fleepCount: UILabel!
    
    // cards / 2 == pairs of cards
    // lazy необходим для того, чтобы cards успел проинициализироваться
    lazy var game = Concentration(numberOfPairsOfCards: (cards.count + 1) / 2)
    
    var fleeps = 0 {
        didSet {
            fleepCount.text = "Flips: \(fleeps)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        fleeps += 1
        if let cardNum = cards.index(of: sender) {
            game.chooseCard(at: cardNum)
            updateViewFromModel()
        } else {
            print("out of bounds card")
        }
        
        
    }
    
    func updateViewFromModel() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMathced ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    var emojis = ["👻","🎃","😈","👹","🍎","🙀","😱"]
    var emoji = [Int:String]()
    
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.indentifier] == nil ,emojis.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
                emoji[card.indentifier] = emojis.remove(at: randomIndex) // returns a removed ellement
            }
        return emoji[card.indentifier] ?? "?"
    }
    
}

