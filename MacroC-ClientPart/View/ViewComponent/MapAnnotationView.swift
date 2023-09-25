//
//  MapAnnotationView.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    
    @State private var animation: Double = 0.0
    var busking: Busking
    
    // MARK: - BODY
    
    var body: some View {
        
            ZStack {
                Circle()
                    .fill(Color.teal)
                    .frame(width: 90, height: 90, alignment: .center)
                
//                Circle()
//                    .stroke(Color.teal, lineWidth: 2)
//                    .frame(width: 100, height: 100, alignment: .center)
//                    .scaleEffect(1 + CGFloat(animation))
//                    .opacity(1 - animation)
//                    .shadow(color: .cyan,radius: 5)

                Image(busking.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 88, height: 88, alignment: .center)
                    .clipShape(Circle())
            } //: ZSTACK
            .background(.clear)
//            .onAppear {
//                withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
//                    animation = 1
//                }
//            }
            .onTapGesture {
                print("dfadfasf")
            }
            .shadow(color: .white.opacity(0.5) ,radius: 5)
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(busking: dummyBusking3)
    }
}
