//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Filippo Rizzolo on 28/03/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // se premuto mostra un colore, altrimenti un altro
                configuration.isPressed ? LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom) : LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
