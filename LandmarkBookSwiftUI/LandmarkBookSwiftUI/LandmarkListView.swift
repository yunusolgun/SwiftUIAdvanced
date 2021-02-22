//
//  LandmarkListView.swift
//  LandmarkBookSwiftUI
//
//  Created by yunus olgun on 20.02.2021.
//

import SwiftUI

struct LandmarkListView: View {
    var body: some View {
        
        NavigationView {
            List(landmarkArray) { landmark in
                
                NavigationLink(
                    destination: DetailsView(chosenLandmark: landmark),
                    label: {
                        LandmarkListRow(landmark: landmark)
                    })
                
              
                
            }.navigationBarTitle(Text("Landmark Book"))
        }
        

        
        
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
