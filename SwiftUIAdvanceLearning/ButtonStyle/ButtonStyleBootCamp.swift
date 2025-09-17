//
//  ButtonStyleBootCamp.swift
//  SwiftUIAdvanceLearning
//
//  Created by Mahesh Behere on 17/09/25.
//

import SwiftUI


struct PressebleButtonStyle: ButtonStyle{
    let scaleAmount:CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .opacity(configuration.isPressed ? scaleAmount : 1.0)
    }
}

extension View{
    func pressebleButtonStyle(scaleAmount:CGFloat = 0.8) -> some View{
        buttonStyle(PressebleButtonStyle(scaleAmount: scaleAmount))
    }
}


struct ButtonStyleBootCamp: View {
    var body: some View {
        Button {
            // Action
        } label: {
            Text("Click Me")
                .themeButtonStyle()
            
        }
        . pressebleButtonStyle()
        .padding(40)

        Button {
            // Action
        } label: {
            Text("Register Me")
                .font(.headline)
                .fontWeight(.medium)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10)
            
        }
        . pressebleButtonStyle(scaleAmount: 0.5)
        .padding(40)

    }
}

#Preview {
    ButtonStyleBootCamp()
}
