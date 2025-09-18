//
//  AnyTransitionBootCamp.swift
//  SwiftUIAdvanceLearning
//
//  Created by Mahesh Behere on 17/09/25.
//

import SwiftUI

struct RotateViewModifier:ViewModifier{
    let angle:Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: angle))
            .offset(x: angle != 0 ? UIScreen.main.bounds.width : 0)
            .offset(y: angle != 0 ? UIScreen.main.bounds.width : 0)
    }
    
}

extension AnyTransition{
    
    static var rotating:AnyTransition{
        return AnyTransition
            .modifier(
                active: RotateViewModifier(angle:180),
                identity: RotateViewModifier(angle: 0)
            )
    }
    
    static func rotating(angle:Double)-> AnyTransition{
        .modifier(
            active: RotateViewModifier(angle:angle),
            identity: RotateViewModifier(angle: 0)
        )
    }
    
    static var rotatingOn:AnyTransition{
        .asymmetric(insertion: AnyTransition.rotating, removal: .move(edge: .leading))
    }
}


struct AnyTransitionBootCamp: View {
    
    @State private var showRect:Bool = false
    var body: some View {
        VStack{
            Spacer()
            if showRect{
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 250,height: 350)
//                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .transition(AnyTransition.rotatingOn.animation(.easeInOut))
                  
            }
            Spacer()
            Spacer()
            Text("Click Me")
                .themeButtonStyle()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRect.toggle()
                    }
                }
        }
//        .padding(20)
    }
}

#Preview {
    AnyTransitionBootCamp()
}
