//
//  ContentView.swift
//  Loko
//
//  Created by Filippo Rizzolo on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            
            Color(.blue)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 15) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                    
                    Text("""
                        Una frase distinguibile per Loko
                        Preferibilmente di due linee
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                
                Spacer()
                
                // MARK: - CENTER
                
                ZStack {
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        Circle()
                            .stroke(Color.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    } //: ZSTACK
                    
//                    Image("LockOpen")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 300)
                    Image(systemName: "lock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .opacity(1)
                        .foregroundStyle(.white)
                } //: CENTER
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // Parts of the custom button
                    
                    // 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL-TO-ACTION (STATIC)
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack {
                        Capsule()
                            .fill(Color.orange)
                            .frame(width: buttonOffset > buttonWidth / 2 ? buttonOffset + 72 : buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.orange)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "lock")
                                .font(.system(size: 30, weight: .semibold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        // altre azioni quando si arriva alla fine
                                        // far apparire altra schermata oppure un semplice tastierino numerico per mettere un codice
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                        ) //: GESTURE
                        
                        Spacer()
                        
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                
            } //: VSTACK
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
