//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Filippo Rizzolo on 28/03/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - Funcitons
    
    // 1. random coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // 2. random size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    // 3. random scale
    func randomScale() -> Double {
        return Double.random(in: 0.1...2.0)
    }
    // 4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // 5. random delay
    func randomDelay() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    var body: some View {
        ForEach(0...randomCircle, id: \.self) { item in
            Circle()
                .fill()
                .foregroundStyle(.white)
                .opacity(0.25)
                .frame(width: randomSize())
                .position(x: randomCoordinate(), y: randomCoordinate())
                .scaleEffect(isAnimating ? randomScale() : 1)
                .onAppear(perform: {
                    withAnimation(
                        .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    ) {
                        isAnimating = true
                    }
                })
            .frame(width: 256, height: 256)
            .mask(Circle())
            .drawingGroup()
        }
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
    }
}
