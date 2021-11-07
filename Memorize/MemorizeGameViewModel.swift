//
//  MemorizeGameViewModel.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 08/11/2021.
//

import Foundation

class MemorizeGameViewModel {
    static let emojes = ["🚒","🚕","🚗","🚙","🚌","🚎","🏎","🚓","🚑","🚐","🛻","🚚","🚛","🚜","🛺","🚨","🚔","🚍","🚘","🚖","✈️","⛴","🚀","🛳","🚞"]
    
    static func createMemoryGameModel()-> MemorizeGameModel<String>{
        MemorizeGameModel<String>(numberOfPairseOfCards: 4){ index in
           return emojes[index]
       }
    }
    
    private var model = createMemoryGameModel()
    
    var cards: Array<MemorizeGameModel<String>.Card>{
        return model.cards
    }
    
    
    
}
