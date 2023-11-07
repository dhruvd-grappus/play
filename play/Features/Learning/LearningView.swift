//
//  LearningView.swift
//  play
//
//  Created by Jai Nijhawan on 06/11/23.
//

import SwiftUI

struct LearningView: View {
    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300.0)
            
            CircleImageView()
                .offset(x: 0, y: -130)
                .padding(.bottom, -130.0)
            
            VStack(alignment: .leading) {
                Text("Jai")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }.padding(.all)
            
            Spacer()
        }
    }
}

#Preview {
    LearningView()
}
