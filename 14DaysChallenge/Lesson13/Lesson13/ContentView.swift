//
//  ContentView.swift
//  Lesson13
//
//  Created by Filippo Rizzolo on 04/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var credits = 1000
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    
    func spin() {
        slot1 = Int.random(in: 1...3)
        slot2 = Int.random(in: 1...3)
        slot3 = Int.random(in: 1...3)
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("SwiftUI Spin!")
                .font(.largeTitle)
            Spacer()
            Text("Credits: \(credits)")
            Spacer()
            
            HStack {
                Spacer()
                Image("fruit\(slot1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("fruit\(slot2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("fruit\(slot3)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            Spacer()
            Button(action: {
                
                spin()
                
                if(slot1 == slot2 && slot2 == slot3) {
                    credits += 15
                } else {
                    credits -= 5
                }
                
            }, label: {
                Text("Spin")
            })
            .padding()
            .padding([.leading, .trailing], 40)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(20)
            .font(.headline)
        
            Spacer()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
