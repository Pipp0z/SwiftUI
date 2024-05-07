//
//  ProductsView.swift
//  Loko
//
//  Created by Filippo Rizzolo on 05/05/24.
//

import SwiftUI

struct ListView: View {
    
    @State private var newItem = ""
    @State private var selectedOption = "Bici"
    @State private var items: [String] = ["Bici: Università", "Bici: Nonna"]

    let options = ["Bici"] // si potranno aggiungere altri elementi

    var body: some View {
        VStack {
            HStack {
                Picker("Seleziona opzione", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                TextField("New Vehicle", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: addItem) {
                    Text("Add")
                }
                .padding()
            }

            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItems)
            }
//            .background()
//            .scrollContentBackground(.hidden)
            
        }
//        .background(.lilac)
        .navigationTitle("Lista")
    }

    func addItem() {
        guard !newItem.isEmpty else { return }
        items.append("\(selectedOption): \(newItem)")
        newItem = ""
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

#Preview {
    ListView()
}
