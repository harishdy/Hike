//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Harish on 27/01/24.
//

import Foundation
import SwiftUI

struct GradientButton:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                //Conditional statement with nil coalscing
                //Condition ? A : B
                configuration.isPressed ?
                //A: WHen user pressed the Button
                LinearGradient(
                    colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom
                )
                :
                //B:When the Button is not pressed
                LinearGradient(
                    colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
    
}
