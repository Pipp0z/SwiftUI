//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Filippo Rizzolo on 28/03/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        
        ZStack {
            // MARK: - 3. Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. Light
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.8)
            
            // MARK: - 1. Surface
            LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
