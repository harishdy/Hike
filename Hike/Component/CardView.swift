//
//  CardView.swift
//  Hike
//
//  Created by Harish on 26/01/24.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    
    @State private var imageNumber:Int = 1
    @State private var randomNumber:Int = 1
    @State private var isShowingSheet:Bool = false
    
    //MARK: - FUNCTIONS
    
    func randomImage(){
        print("--- BUTTON WAS PRESSED ---")
        print("Status: Old Image Number =\(imageNumber)")
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Action: Random number Generated = \(randomNumber)")
        }while randomNumber == imageNumber
      
        imageNumber = randomNumber
        print("Result: New Image number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - HEADER
                VStack(alignment:.leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
                        Spacer()
                        Button{
                            //ACTION: Show a Sheet
                            print("The button was presssed")
                            isShowingSheet.toggle()
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friend and familie")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//:HEADER
                .padding(.horizontal,30)
                //MARK: - MAIN CONTENT
                ZStack {
//                    Circle()
//                        .fill(LinearGradient(colors: [Color("ColorIndigoMedium"),Color("ColorSalmonLight")], startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .frame(width: 256,height: 256)
                    CustomCircleView()
                     Image("image-\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                
                //MARK: - FOOTER
                Button{
                    // Action: Generate a random number
                    randomImage()

                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25,x: 1,y: 2)
                }
                .buttonStyle(GradientButton())
            }//:ZSTACK
        }
        //:CARD
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
 
