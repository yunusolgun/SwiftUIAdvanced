//
//  ContentView.swift
//  LandmarkBookSwiftUI
//
//  Created by yunus olgun on 20.02.2021.
//

import SwiftUI

struct DetailsView: View {
    
    
    var chosenLandmark: Landmark
    
    var body: some View {
        
        VStack {
            MapView(coordinate: chosenLandmark.locationCoordinate)
                .frame(height:UIScreen.main.bounds.height * 0.3)
                .edgesIgnoringSafeArea(.top)
            
            CircleImageView(image: Image(chosenLandmark.imageName))
                .frame(width:UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.5)
                .offset(y: UIScreen.main.bounds.height * -0.23)
                .padding(.bottom, UIScreen.main.bounds.height * -0.15)
            
            
            VStack(alignment: .leading) {
                Text(chosenLandmark.name)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                
                HStack {
                    Text(chosenLandmark.country)
                        .font(.subheadline)
                    Spacer()
                    Text(chosenLandmark.category).font(.subheadline)
                }.padding()
            }.padding()
            
            
            Spacer()
            
        }.navigationBarTitle(Text(chosenLandmark.name))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(chosenLandmark: londonBridgeLandmark)
    }
}
