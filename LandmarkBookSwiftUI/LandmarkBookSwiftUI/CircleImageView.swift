//
//  CircleImageView.swift
//  LandmarkBookSwiftUI
//
//  Created by yunus olgun on 20.02.2021.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 5))
            .shadow(radius: 15)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("londonbridge"))
    }
}
