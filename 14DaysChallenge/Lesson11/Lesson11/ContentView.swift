//
//  ContentView.swift
//  Lesson11
//
//  Created by Filippo Rizzolo on 04/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var valNum = 0
    
    var body: some View {
        VStack {
            Text(String(valNum))
            
            HStack {
                Button(action: {
                    
                    valNum += 2
                    
                }, label: {
                    Text("Sum")
                })
                
                Button(action: {
                    
                    valNum *= 2
                    
                }, label: {
                    Text("Mulriply")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
