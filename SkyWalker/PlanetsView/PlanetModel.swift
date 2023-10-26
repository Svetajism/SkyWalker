//
//  PlanetModel.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 26/10/23.
//

import Foundation

struct PlanetModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageName: String
    var currentProgres: Int
}
