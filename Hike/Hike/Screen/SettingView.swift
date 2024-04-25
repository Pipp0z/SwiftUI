//
//  SettingView.swift
//  Hike
//
//  Created by Filippo Rizzolo on 28/03/24.
//

import SwiftUI

struct SettingView: View {
    
    private var alternateAppIcons: [String] = [ "AppIcon-Backpack", "AppIcon-Camera", "AppIcon-Campfire", "AppIcon-MagnifyingGlass", "AppIcon-Map", "AppIcon-Mushroom"]
    
    var body: some View {
        List {
            
            // MARK: - Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Pips' choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Lorem ipsum dolor sit \n amet, consectetur ?")
                        .font(.title2)
                        .fontWeight(.heavy)
                
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                        .font(.footnote)
                        .italic()
                        
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenMedium)

                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: Header
            .listRowSeparator(.hidden)
            
            // MARK: - Section: icons
            Section(header: Text("Alterante app icon")) {
                
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update the app icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success icon changed")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }//: SCROOLVIEW
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } //: SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - Section: about
            Section(
                header: Text("About the app"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer ", rowIcon: "ellipsis.curlybraces", rowContent: "Mario Rossi", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Gino Verdi", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "GitHub", rowLinkDestination: "https://github.com/Pipp0z")
            } //: SECTION
            
        }
    }
}

#Preview {
    SettingView()
}
