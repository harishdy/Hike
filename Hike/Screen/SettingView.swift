//
//  SettingView.swift
//  Hike
//
//  Created by Harish on 01/02/24.
//

import SwiftUI

struct SettingView: View {
    
    //MARK: - PROPERTIES
    private let alternateAppIcons:[String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    
    var body: some View {
        List{
         
            //MARK: - SECTION:HEADER
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDrak], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top,8)
                VStack(spacing: 8){
                    
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is evenbtter once you are actully there.The hike that you hope to do again someday. \nFind the best ady hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium  )
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)
            //MARK: - SECTION ICON

            Section(header:Text("Alertnate Icons")){
                ScrollView(.horizontal,showsIndicators:false){
                    HStack (spacing:12){
                        ForEach(alternateAppIcons.indices,id: \.self) { item in
                            Button{
                                print("\(alternateAppIcons[item]) Icon was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil{
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }//;SCROLL VIEW
                .padding(.top,12)
                Text("Choose your favourite app icon from the Collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }//:SECTION
            .listRowSeparator(.hidden)
            //MARK: - SECTION ABOUT
            Section(header:Text("ABOUT THE APP"),
                    footer: HStack{
                Spacer()
                Text("Copyright © All right reserved")
                Spacer()
            }
                .padding(.vertical,8)){
               // 1. Basic Labeled Content
//                    LabeledContent("Application",value:"Hike")
                    
              // 2. Advanced labeled Content

                    CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                    CustomListRowView(rowLabel: "Compatibility ", rowIcon: "info.circle", rowContent: "iOS,iPads", rowTintColor: .red)
                    CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .red)
                    CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                    CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Harish yadav", rowTintColor: .mint)
                    CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Rober", rowTintColor: .pink)
//                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "https://google.com", rowTintColor: .indigo)
                    CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo,rowLinkLabel: "Google",rowLinkDestination: "https://Google.com")
            }
        }//: LIST
    }
}

#Preview {
    SettingView()
}
