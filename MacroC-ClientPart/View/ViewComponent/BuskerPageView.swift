//
//  BuskerPageView.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import SwiftUI

struct BuskerPageView: View {
    var busker: Busker
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(busker.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                Text(busker.name)
                    .font(.title)
                    .fontWeight(.black)
                Spacer()
            }
        }
    }
}

struct BuskerPageView_Previews: PreviewProvider {
    static var previews: some View {
        BuskerPageView(busker: dummyBusker5)
    }
}
