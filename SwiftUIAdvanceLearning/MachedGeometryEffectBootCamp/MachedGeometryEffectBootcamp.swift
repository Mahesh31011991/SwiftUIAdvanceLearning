//
//  MachedGeometryEffectBootcamp.swift
//  SwiftUIAdvanceLearning
//
//  Created by Mahesh Behere on 18/09/25.
//

import SwiftUI

struct MachedGeometryEffectBootcamp: View {
    @State private var isClicked:Bool = false
    @Namespace var namespace
    
    var body: some View {
        VStack{
            
            if !isClicked{
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 100,height: 100)
                
            }
            
            Spacer()
            
            if isClicked{
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rect", in: namespace)
                    .frame(width: 300,height: 200)
                
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut, {
                isClicked.toggle()
            })
        }
    }
}

struct GeoMetryEffetctExample: View{
    @State private var categories:[String] = ["Popular", "Home","Trending"]
    @State private var selected : String = "Popular"
    @Namespace private var namespace2
    var body: some View{
        HStack(spacing:12){
            
            ForEach(categories,id:\.self) { category in
                
                ZStack(alignment: .bottom){
                    
                    if selected == category{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.red)
                            .frame(width:100,height:2)
                            .background(selected == category ?  Color.orange.opacity(0.4) : Color.clear)
                            .matchedGeometryEffect(id: "category", in: namespace2)
                            .offset(y:10)
                    }
                    
                    Text(category)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring) {
                        selected = category
                    }
                }
            }
            
        }
        
        
        
    }
}

#Preview {
    //    MachedGeometryEffectBootcamp()
    GeoMetryEffetctExample()
}
