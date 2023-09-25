//
//  MapView.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//
import SwiftUI

struct MapView: View {
    
    @State var text: String = ""
    @State var isShowModal: Bool = false
    @State var selectedBusking: Busking? = nil
    
    var body: some View {
        MapViewController(isShowModal: $isShowModal, selectedBusking: $selectedBusking)
            .overlay(alignment: .top) {
                SearchBar(text: $text, placeholder: "Search")
                    .padding(.top, 35)
            }
            .ignoresSafeArea()
            .sheet(isPresented: $isShowModal) {
                if let busking = selectedBusking {
                    MapBuskerInfo(busking: busking)
                }
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
