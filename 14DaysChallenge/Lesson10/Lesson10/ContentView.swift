//
//  ContentView.swift
//  Lesson10
//
//  Created by Filippo Rizzolo on 03/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("FirstClick")
            }, label: {
                Text("FirstButton")
            })
            
                Button(action: {
                    print("SecondClick")
                }, label: {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("SecondButton")
                    }
                })
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
