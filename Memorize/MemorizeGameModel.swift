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
            cards.append(Card(cardContent: content, id: index*2))
            cards.append(Card(cardContent: content, id: index*2+1))
        }
    }
    
   mutating func choose(_ card: Card){
        let index = cards.firstIndex{ card.id == $0.id}
        guard let index = index else{return}
        cards[index].isFaceUp.toggle()
    }
    
    struct Card: Identifiable {
        var isFaceUp    = false
        var isMatched   = false
        var cardContent: CardContent
        var id: Int
    }
    
}
