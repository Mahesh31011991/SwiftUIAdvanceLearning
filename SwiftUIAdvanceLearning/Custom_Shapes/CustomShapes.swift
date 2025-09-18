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
    PacmanView()
}

import SwiftUI

struct PacmanShape: Shape {
    var mouthAngle: Double
    
    var animatableData: Double {
        get { mouthAngle }
        set { mouthAngle = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let startAngle = Angle(degrees: mouthAngle)
        let endAngle = Angle(degrees: 360 - mouthAngle)
        
        var path = Path()
        path.move(to: center)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        path.closeSubpath()
        
        return path
    }
}

struct PacmanView: View {
    @State private var mouthOpen = true
    
    var body: some View {
        PacmanShape(mouthAngle: mouthOpen ? 40 : 5)
            .fill(Color.yellow)
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)) {
                    mouthOpen.toggle()
                }
            }
    }
}



