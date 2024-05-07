//
//  HomeView.swift
//  Loko
//
//  Created by Filippo Rizzolo on 06/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isClosed: Bool = true
    @State private var lightOn: Bool = false
    @State private var musicOn: Bool = false
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    let sliderWidth: CGFloat = 200 // Lunghezza fissa dello slider
    
    var body: some View {
        
        ZStack {
            
            Color(.lilac)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                
                // MARK: - HEADER
                Text("Loko")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .foregroundStyle(.night)
                    .padding(.horizontal)
                
                Spacer()
                
                // MARK: - BODY
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.night)
                    
                    VStack {
                        
                        HStack {
                            
                            // MARK: - BODY stats
                            VStack (alignment: .leading){
                                StatsComponent(MainTxt: "98%", Img: "battery.75", Desc: "battery")
                                    .foregroundStyle(.sky)
                                StatsComponent(MainTxt: "On", Img: "wifi", Desc: "bluetooth")
                                    .foregroundStyle(.sky)
                                Spacer()
                            } //: VSTACK
                            .padding(.top, 10)
                            
                            Spacer()
                            
                            // MARK: - BODY info
                            VStack {
                                    Text(isClosed ? """
                                                        C
                                                        L
                                                        O
                                                        S
                                                        E
                                                        D
                                                        """ : """
                                                                O
                                                                P
                                                                E
                                                                N
                                                                """)
                                    .font(.system(size: 45))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.lilac)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 15)
                                    
                                
                                Spacer()
                            } //: VSTACK
                            
                        } //: HSTACK
                        .padding()
                        
                        Spacer()
                        
                        HStack {
                            Button {
                                lightOn = !lightOn
                            } label: {
                                Image(systemName: lightOn ? "lightbulb.circle.fill" : "lightbulb.circle" )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                            }
                            Button {
                                musicOn = !musicOn
                            } label: {
                                Image(systemName: musicOn ? "play.circle.fill" : "play.circle" )
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .foregroundStyle(.sky)
                        
                        Spacer()
                        
                        // MARK: - BODY slider
                        HStack {
                            ZStack {
                                
                                // 1. background (static)
                                Capsule()
                                    .fill(.sky.opacity(0.2))
                                Capsule()
                                    .fill(.sky.opacity(0.2))
                                    .padding(8)
                                
                                // 2. call-to-action (static)
                                Text("Open")
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.sky)
                                    .offset(x: 20)
                                
                                // 3. capsule (dynamic width)
                                HStack {
                                    Capsule()
                                        .fill(.sky)
                                        .frame(width: buttonOffset > sliderWidth / 2 ? buttonOffset + 72 : buttonOffset + 80)
                                    
                                    Spacer()
                                }
                                
                                // 4. circle (draggable)
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(.sky)
                                        Circle()
                                            .fill(.night.opacity(0.3))
                                            .padding(8)
                                        Image(systemName: isClosed ? "lock" : "lock.open")
                                            .font(.system(size: 30, weight: .semibold))
                                    }
                                    .foregroundStyle(.sky)
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .offset(x: buttonOffset)
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - sliderWidth {
                                                    buttonOffset = gesture.translation.width
                                                }
                                            }
                                            .onEnded { _ in
                                                if buttonOffset > sliderWidth / 2 {
                                                    buttonOffset = buttonWidth - sliderWidth
                                                    isClosed = false
                                                    // altre azioni quando si arriva alla fine
                                                    // far apparire altra schermata oppure un semplice tastierino numerico per mettere un codice
                                                } else {
                                                    buttonOffset = 0
                                                    isClosed = true
                                                }
                                            }
                                    ) //: GESTURE
                                    
                                    Spacer()
                                }
                                
                            } //: SLIDER
                            .frame(width: 200 ,height: 80, alignment: .center)
                            .padding()
                            
                            Spacer()
                        }
                        
                    } //: VSTACK
                } //: ZSTACK
                .padding()
                
            } //: VSTACK
        } //: ZSTACK
    }
}

#Preview {
    HomeView()
}
