//
//  LandmarkListRow.swift
//  LandmarkBookSwiftUI
//
//  Created by yunus olgun on 20.02.2021.
//

import SwiftUI

struct LandmarkListRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .leading)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 5))
                .shadow(radius: 15)
            
            Text(landmark.name)
        }
    }
}

struct LandmarkListRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListRow(landmark: londonBridgeLandmark)
    }
}
