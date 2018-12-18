//
//  Card.swift
//  concentraton
//
//  Created by jiang on 2018/11/20.
//  Copyright © 2018年 jiang. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifer:Int
    static var identfierFactory = 0
    static func getUniqueIdentifer()->Int
    {
        identfierFactory += 1
        return identfierFactory
    }
    init() {
        self.identifer = Card.getUniqueIdentifer()
    }
}
