//
//  ContentView.swift
//  Lesson4
//
//  Created by Filippo Rizzolo on 01/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            Spacer()
            
            ZStack {
                
                Image("toronto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding()
                
                VStack(alignment: .center) {
                    Text("CN Tower")
                        .font(.largeTitle)
                    Text("Toronto")
                }
                .padding()
                .background(.black)
                .cornerRadius(15)
                .opacity(0.8)
                .foregroundColor(.white)
            }
            
            Spacer()
            
            ZStack {
                
                Image("london")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding()
                
                VStack(alignment: .center) {
                    Text("Big Ben")
                        .font(.largeTitle)
                    Text("London")
                }
                .padding()
                .background(.black)
                .cornerRadius(15)
                .opacity(0.8)
                .foregroundColor(.white)
            }
            
            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
