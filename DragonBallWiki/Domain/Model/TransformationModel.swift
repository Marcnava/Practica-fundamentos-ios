//
//  TransformationsModel.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 5/7/24.
//

import Foundation

struct Transformation: Decodable ,Equatable, Hashable ,HeroTableViewRepresentable {
    let id: String
    let name: String
    let description: String
    let photo: URL
}
