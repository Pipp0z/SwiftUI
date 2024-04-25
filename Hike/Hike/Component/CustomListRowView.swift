//
//  CustomListRowView.swift
//  Hike
//
//  Created by Filippo Rizzolo on 28/03/24.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARk: - Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            // Contenuto
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                .fontWeight(.heavy)
            } else if(rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundStyle(rowTintColor)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            // Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Apple",
            rowLinkDestination: "https://apple.com"
        )
    }
}
