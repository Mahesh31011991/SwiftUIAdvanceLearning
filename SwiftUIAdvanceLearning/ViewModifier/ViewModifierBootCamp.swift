//
//  ViewModifierBootCamp.swift
//  SwiftUIAdvanceLearning
//
//  Created by Mahesh Behere on 17/09/25.
//

import SwiftUI

struct DefaultButtonStyle: ViewModifier{
    let backgroundColor:Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .frame(height:60)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding()
    }
}

extension View{
    
    func themeButtonStyle(backgroundColor: Color = .blue) -> some View{
        self.modifier(DefaultButtonStyle(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootCamp: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .themeButtonStyle()
            Text("Hello EveryOne")
                .themeButtonStyle(backgroundColor: .orange)
            Text("Hello Mahesh")
                .themeButtonStyle(backgroundColor: .green)
          
        }
        
    }
}

#Preview {
    ViewModifierBootCamp()
}
