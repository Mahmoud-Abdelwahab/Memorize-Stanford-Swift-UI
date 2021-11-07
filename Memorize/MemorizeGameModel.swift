//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 08/11/2021.
//

import Foundation

struct MemorizeGameModel<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairseOfCards: Int,createCardContent: (Int)->CardContent){
       cards = Array<Card>()
        // add numberOfPairseOfCards * 2 to cards array
        for index in 0..<numberOfPairseOfCards{
            let content = createCardContent(index)
            cards.append(Card(cardContent: content))
            cards.append(Card(cardContent: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    struct Card {
        var isFaceUp    = false
        var isMatched   = false
        var cardContent: CardContent
    }
    
}
