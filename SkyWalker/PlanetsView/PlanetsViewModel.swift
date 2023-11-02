//
//  PlanetsViewModel.swift
//  SkyWalker
//
//  Created by Svetlana Zakharova on 26/10/23.
//

import Foundation

class PlanetsViewModel {
    let planets: [PlanetModel] = [.init(name: "Mercury", imageName: "01_Mercury", currentProgres: 12, maxProgress: 25),
                                  .init(name: "Venus", imageName: "02_Venus", currentProgres: 12, maxProgress: 75),
                                  .init(name: "Earth", imageName: "03_Earth", currentProgres: 12, maxProgress: 125),
                                  .init(name: "Mars", imageName: "04_Mars", currentProgres: 12,maxProgress: 200),
                                  .init(name: "Jupiter", imageName: "05_Jupiter", currentProgres: 12,maxProgress: 300),
                                  .init(name: "Saturn", imageName: "06_Saturn", currentProgres: 12,maxProgress: 425),
                                  .init(name: "Uranus", imageName: "07_Uranus", currentProgres: 12,maxProgress: 550),
                                  .init(name: "Neptune", imageName: "08_Neptune", currentProgres: 12,maxProgress: 700)]
}


