//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Filippo Rizzolo on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "Francia", "Germania", "Irlanda", "Italia", "Monaco", "Nigeria", "Polonia", "Spagna", "Ucraina", "UK", "USA"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var scoreMsg = ""
    @State private var scorePoint = 0
    
    @State private var count = 0
    @State private var showResult = false
    
    
    var body: some View {
        
        
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red:0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.23), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Sceglia la bandiera")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Punteggio: \(scorePoint)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continua", action: askQuestion)
        } message: {
            Text(scoreMsg)
        }
        .alert("FINE", isPresented: $showResult) {
            Button("Inizia da capo", action: reset )
        } message: {
            Text("Il tuo punteggio finale è di \(scorePoint)")
        }
        
//        VARIANTE SEMPLICE
//        ZStack {
//            
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 30) {
//                VStack {
//                    Text("Sceglia la bandiera")
//                        .font(.subheadline.weight(.heavy))
//                    Text(countries[correctAnswer])
//                        .font(.largeTitle.weight(.semibold))
//                }
//                .foregroundColor(.white)
//                
//                ForEach(0..<3) { number in
//                    Button {
//                        flagTapped(number)
//                    } label: {
//                        Image(countries[number])
//                            .clipShape(.capsule)
//                            .shadow(radius: 5)
//                    }
//                }
//            }
//        }
//        .alert(scoreTitle, isPresented: $showScore) {
//            Button("Continua", action: askQuestion)
//        } message: {
//            Text("Il tuo punteggio è di ???")
//        }
        
        
    }
    
    func flagTapped(_ number:Int) {
        count += 1
        if number == correctAnswer {
            scoreTitle = "Corretto"
            scorePoint += 1
            scoreMsg = "Il tuo punteggio è di \(scorePoint)"
        } else {
            scoreTitle = "Errato"
            if(scorePoint > 0) { scorePoint -= 1 }
            scoreMsg = "Questa bandiera appartiene a \(countries[number])"
        }
        showScore = true
    }
    
    func askQuestion() {
        if(count < 8) {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else {
            showResult = true
        }
    }
    
    func reset() {
        scoreTitle = ""
        scorePoint = 0
        scoreMsg = ""
        showResult = false
        count = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
