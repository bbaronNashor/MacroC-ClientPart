//
//  User.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import Foundation
import MapKit

struct User: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let following: [Busker]
}
