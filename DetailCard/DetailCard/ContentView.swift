//
//  ContentView.swift
//  DetailCard
//
//  Created by Filippo Rizzolo on 01/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ZStack {
            
            Color(.systemMint)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0) {
                
                Image("niagarafalls")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    
                    Text("Niagara Falls")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack {
                        
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                        }
                        Text("(Reviews 341)")
                        
                    }
                    .foregroundColor(.orange)
                    .font(.caption)
                    
                }
                
                Text("Come visit the falls for an experienca of a lifetime.")
                
                
                HStack {
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binoculars.fill")
                }
                .foregroundColor(.gray)
                .font(.caption)
                
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 15))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
