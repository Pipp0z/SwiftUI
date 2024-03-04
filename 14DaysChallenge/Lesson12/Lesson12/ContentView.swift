//
//  ContentView.swift
//  Lesson12
//
//  Created by Filippo Rizzolo on 04/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var valNum = 0
    @State private var isOver = false
    
    func increase() {
        let numIncrease = Int.random(in: 1...10)
        valNum += numIncrease
    }
    
    func decrease() {
        let numDecrease = Int.random(in: 1...10)
        valNum -= numDecrease
    }
    
    var body: some View {
        VStack {
            
            Text(String(valNum))
            
            Button(action: {
                
                if(isOver){
                    decrease()
                } else{
                    increase()
                }
                
                if(valNum > 50) {
                    isOver = true
                } else if (valNum < 0) {
                    isOver = false
                }
                
            }, label: {
                Text("ClickMe")
            })
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
