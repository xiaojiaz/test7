//
//  ViewController.swift
//  concentraton
//
//  Created by jiang on 2018/11/3.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentraction(numberPairsOfCards:
        (cardButtons.count+1)/2)
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var filpCountLable: UILabel!

    var flipCount=0
    {
        didSet
        {
              filpCountLable.text="Score: \(120-flipCount)"
        }
    }
   
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber=cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print("there is no card")
        }
      
    }
    func updateViewFromModel() {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji(for:card), for: UIControlState.normal)
                 button.backgroundColor = UIColor.white
            }else
            {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9610558152, green: 0.5509537458, blue: 0.01276976243, alpha: 0):#colorLiteral(red: 0.9610558152, green: 0.5509537458, blue: 0.01276976243, alpha: 1)
            }
            
        }
    }
    var item = [0:["🎃","👻","🧙‍♀️","🐳","😈","👹","🤖","🐹"],
                1:["🍣","🍜","🍤","🍡","🍱","🎂","🍨","🍜"],
         2:["⚽️","🏐","🎱","⛸","⛷","🥋","🧗🏻‍♂️","⛹🏼‍♀️"],
         3:["🚇","✈️","🚖","🚈","🚁","🏍","🚔","🚀"],
         4:["💗","💝","💔","💕","💘","💞","💓","❣️"],]
    lazy var emojiChoices = item[0]!
    var emoji = [Int:String]()
    func emoji(for card:Card)->String
    {
        if emoji[card.identifer]==nil,emojiChoices.count>0
        {
            let randomInex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifer]=emojiChoices.remove(at: randomInex)
        }
        return emoji[card.identifer] ?? "?"
    }
   
    
    
    
    @IBAction func palyAgain(_ sender: UIButton) {
        game = Concentraction(numberPairsOfCards: (cardButtons.count+1)/2)
        let itemnum = Int( arc4random_uniform(UInt32(item.keys.count)))
        emojiChoices = item[itemnum]!
        updateViewFromModel()
        flipCount=0
    }

    
    
}

