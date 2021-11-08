//
//  MemorizeGameViewModel.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 08/11/2021.
//

import Foundation

class MemorizeGameViewModel: ObservableObject {
    static let emojes = ["🚒","🚕","🚗","🚙","🚌","🚎","🏎","🚓","🚑","🚐","🛻","🚚","🚛","🚜","🛺","🚨","🚔","🚍","🚘","🚖","✈️","⛴","🚀","🛳","🚞"]
    
    static func createMemoryGameModel()-> MemorizeGameModel<String>{
        MemorizeGameModel<String>(numberOfPairseOfCards: 4){ index in
           return emojes[index]
       }
    }
    
    @Published private var model = createMemoryGameModel()

    var cards: Array<MemorizeGameModel<String>.Card>{
        return model.cards
    }
    
    func choose(card: MemorizeGameModel<String>.Card) {
        model.choose(card)
    }
    
}
