//
//  ContentView.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 02/11/2021.
//

import SwiftUI

struct ContentView: View {
    let emojes = ["🚒","🚕","🚗","🚙","🚌","🚎","🏎","🚓","🚑","🚐","🛻","🚚","🚛","🚜","🛺","🚨","🚔","🚍","🚘","🚖","✈️","⛴","🚀","🛳","🚞"]
    
    @State var visableCardsNumber = 4
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65, maximum: 100))] ){
                    ForEach(emojes[0..<visableCardsNumber] , id: \.self){
                       CardView(content: $0)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack{
                addNewCardButton.font(.largeTitle)
                Spacer()
                removeCardButton.font(.largeTitle)
            }.padding(.horizontal)
        }
    }
    
    var addNewCardButton: some View{
        Button{
            if visableCardsNumber < emojes.count{
                visableCardsNumber += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeCardButton: some View{
        Button{
            if visableCardsNumber > 1{
                visableCardsNumber -= 1
            }
        } label:{
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View{
    @State var isFaceUp = false
    let content : String
    var body: some View{
        let shape =  RoundedRectangle(cornerRadius: 20)
        ZStack{
            if isFaceUp{
                
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }else{
                shape
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
