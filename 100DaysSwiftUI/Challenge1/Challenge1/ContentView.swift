//
//  ContentView.swift
//  Challenge1
//
//  Created by Filippo Rizzolo on 21/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputVal = "sec"
    @State private var outputVal = "sec"
    @State private var userInput = 0.0
    @FocusState private var timeIsFocussed: Bool
    
    var units = ["sec", "min", "ore", "giorni"]
    
    var inputConverted: Double {
        
        let finalInput: Double = userInput
        
        switch inputVal {
        case "sec":
            return finalInput
        case "min":
            return finalInput * 60
        case "ore":
            return finalInput * 3600
        case "giorni":
            return finalInput * 86400
        default:
            return finalInput
        }
    }
    
    private var outputConverted: Double {
        
        let finalOutput: Double = inputConverted
        
        switch outputVal {
        case "sec":
            return finalOutput
        case "min":
            return finalOutput / 60
        case "ore":
            return finalOutput / 3600
        case "giorni":
            return finalOutput / 86400
        default:
            return finalOutput
        }
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Section("Tempo iniziale") {
                    TextField("Tempo", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Unita di misura", selection: $inputVal) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Tempo finale") {
                    Text(outputConverted, format: .number)
                    Picker("Unita di misura", selection: $outputVal) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("TimeConvert")
            .toolbar {
                if timeIsFocussed {
                    Button("Fine") {
                        timeIsFocussed = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
