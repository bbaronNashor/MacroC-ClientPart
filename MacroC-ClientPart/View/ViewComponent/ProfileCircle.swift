//
//  ProfileCircle.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import SwiftUI

struct ProfileCircle: View {
    //MARK: -1.PROPERTY
    var image: String = ""
    
    //MARK: -2.BODY

    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .padding(5)
            .shadow(color: .white,radius: 2)
        
    }
}

    //MARK: -3.PREVIEW
struct BuskerProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircle()
    }
}
