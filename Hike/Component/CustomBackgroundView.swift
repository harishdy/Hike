//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Harish on 26/01/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        
        ZStack {
//            MARK: - 3. DEPTH
            Color.customGreenDrak
                .cornerRadius(40)
                .offset(y:12)

//            MARK: - 2. LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
//            MARK: - 3.SURFACE
            
            LinearGradient(colors: [Color.customGrayLight,Color.customGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding( )
}
