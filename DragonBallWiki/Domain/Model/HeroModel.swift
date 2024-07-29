//
//  HeroModel.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 2/7/24.
//

import Foundation

struct Hero: Decodable, HeroTableViewRepresentable, Equatable {
    let id: String
    let favorite: Bool
    let name: String
    let photo: URL
    let description: String
}
