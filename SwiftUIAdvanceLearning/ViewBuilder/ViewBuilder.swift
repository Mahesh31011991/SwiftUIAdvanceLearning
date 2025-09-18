//
//  ViewBuilder.swift
//  SwiftUIAdvanceLearning
//
//  Created by Mahesh Behere on 18/09/25.
//

import SwiftUI

struct regularHeder:View {
    let title:String
    let description:String?
    let icon:String?
        var body: some View {
        
            VStack(alignment: .leading,spacing: 10){
                Text("Title")
                    .font(.title)
                if let description{
                    Text("Description")
                        .font(.callout)
                }
                if let icon{
                    Image(systemName: icon)
                }
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 2)
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
        
    }
}

struct GenericHeader<Content:View>:View {
    let title:String
    let content:Content
    init(title:String, @ViewBuilder content:() -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text(title)
                .font(.title)
            content
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}
struct ViewBuilder1: View {
    var body: some View {
        VStack(alignment: .leading){
            regularHeder(title: "Hello", description: "DEscription", icon: "heart.fill")
            regularHeder(title: "Hello", description: nil, icon: nil)
            
            GenericHeader(title: "Generic1") {
                Text("Hi")
                Image(systemName: "heart.fill")
                Text("Mahesh")
            }
            
            Spacer()
        }
    }
}

#Preview {
    ViewBuilder1()
    
}
