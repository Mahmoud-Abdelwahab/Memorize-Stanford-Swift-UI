//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 08/11/2021.
//

import Foundation

struct MemorizeGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int?
    
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
       
       if let index = cards.firstIndex(where: { card.id == $0.id}) ,
       !cards[index].isFaceUp ,
       !cards[index].isMatched {
           if let indexOfTheOnlyFaceUpCard = indexOfTheOnlyFaceUpCard {
               if cards[indexOfTheOnlyFaceUpCard].cardContent == cards[index].cardContent {
                   cards[indexOfTheOnlyFaceUpCard].isMatched = true
                   cards[index].isMatched = true
               }
               self.indexOfTheOnlyFaceUpCard = nil
           }else{
               for index in cards.indices {
                   cards[index].isFaceUp = false
               }
               self.indexOfTheOnlyFaceUpCard = index
           }
           cards[index].isFaceUp.toggle()
       }
      
       
    }
    
    struct Card: Identifiable {
        var isFaceUp    = false
        var isMatched   = false
        var cardContent: CardContent
        var id: Int
    }
    
}
