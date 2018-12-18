//
//  Concentration.swift
//  concentraton
//
//  Created by jiang on 2018/11/20.
//  Copyright © 2018年 jiang. All rights reserved.
//

import Foundation
class Concentraction
{
    var cards=[Card]()
    var indexOfOneAndOnlyFaceUpCard:Int?
    {
        get
        {
            var foundIndex:Int?
            for index in cards.indices
            {
               if  cards[index].isFaceUp
               {
                  if foundIndex == nil
                  {
                    foundIndex = index
                 }else
                  {
                    return nil
                }
                }
            }
            return foundIndex
        }
        set
        {
            for index in cards.indices
            {
                cards[index].isFaceUp = (index==newValue)
            }
        }
    }
    func chooseCard(at index:Int)  {
     if !cards[index].isMatched
     {
        if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index
        {
            if cards[matchIndex].identifer == cards[index].identifer
            {
                cards[matchIndex].isMatched = true
                cards[index].isMatched=true
            }
            cards[index].isFaceUp = true
            
        }
        else
        {
            for filpDownIndex in cards.indices
            {
                cards[filpDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
        }
        }
    }
    init(numberPairsOfCards:Int) {
        for _ in 1...numberPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
        // TODO: Shuffle the cards
        cards.sort { _,_ in arc4random_uniform(2) > 0 }
       

    }
}
