//
//  CustomShapes.swift
//  SwiftUIAdvanceLearning
//
//  Created by Mahesh Behere on 18/09/25.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
         return Path{  path in
             path.move(to: CGPoint(x:rect.midX,y:rect.minY))
             path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
             path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
             path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
    
}

struct CustomShapes: View {
    var body: some View {
        
        VStack{
            Image(systemName: "circle.fill")
                .frame(width: 300,height: 300)
                .foregroundStyle(.pink.opacity(0.5))
                .background(.pink.opacity(0.5))
                .cornerRadius(150)
                .clipShape(
                    Triangle()
                )
            Triangle()
                .frame(width: 300,height: 300)
                .rotationEffect(Angle(degrees: 180))
        }
    }
}

#Preview {
    CustomShapes()
}
