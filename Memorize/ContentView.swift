//
//  ContentView.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 02/11/2021.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: MemorizeGameViewModel
    
    @State var visableCardsNumber = 4
    var body: some View {
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65, maximum: 100))] ){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
    }
    
}

struct CardView: View{
    let card: MemorizeGameModel<String>.Card
    var body: some View{
        let shape =  RoundedRectangle(cornerRadius: 20)
        ZStack{
            if card.isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.cardContent)
                    .font(.largeTitle)
            }else{
                shape
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MemorizeGameViewModel()
        ContentView(viewModel: viewModel)
            .preferredColorScheme(.light)
        ContentView(viewModel: viewModel)
            .preferredColorScheme(.dark)
    }
}
