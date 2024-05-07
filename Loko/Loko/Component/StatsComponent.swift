//
//  statsComponent.swift
//  Loko
//
//  Created by Filippo Rizzolo on 06/05/24.
//

import SwiftUI

struct StatsComponent: View {
    
    @State var MainTxt: String
    @State var Img: String
    @State var Desc: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5){
            Text(MainTxt)
                .font(.system(size: 50))
                .fontWeight(.semibold)
            
            HStack {
                Image(systemName: Img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                Text(Desc)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
            } //: HSTACK
        } //: VSTACK
    }
}

#Preview {
    StatsComponent(MainTxt: "98%", Img: "battery.75", Desc: "battery")
}
