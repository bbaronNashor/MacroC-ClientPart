//
//  ContentView.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import SwiftUI

struct ContentsView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                        Text("Main Page")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                        Text("Map")
                }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentsView()
    }
}
