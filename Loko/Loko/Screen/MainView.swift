//
//  MainView.swift
//  Loko
//
//  Created by Filippo Rizzolo on 05/05/24.
//

import SwiftUI

struct MainView: View {
    
   @State private var defaultSelection = 2
    
    var body: some View {
        TabView (selection: $defaultSelection) {
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
                .tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(2)
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                }
                .tag(3)
        }
    }
}

#Preview {
    MainView()
}
