//
//  ContentView.swift
//  Lesson5
//
//  Created by Filippo Rizzolo on 01/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "back"
    @State private var cpuCard = "back"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    
                    // generare numero random dal 2 al 14
                    var playerVal = Int.random(in: 2...14)
                    var cpuVal = Int.random(in: 2...14)
                    
                    //cambiare carta
                    playerCard = "card" + String(playerVal)
                    cpuCard = "card" + String(cpuVal)
                    
                    //aumentare punteggio
                    
                    if(playerVal > cpuVal) {
                        playerScore += 1
                    } else if (playerVal < cpuVal){
                        cpuScore += 1
                    }
                    
                     
                }, label: {
                    Image("dealbutton")
                })
                
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
