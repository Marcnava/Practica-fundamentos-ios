//
//  HeroTableViewCell.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 2/7/24.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "HeroTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    
    // MARK: - Cell Config
    func configure(with hero: any HeroTableViewRepresentable) {
        heroNameLabel.text = hero.name
        heroNameLabel.textColor = UIColor(.white)
        heroDescriptionLabel.text = hero.description
        heroDescriptionLabel.textColor = UIColor(.white)
        heroDescriptionLabel.numberOfLines = 0
        heroImage.kf.setImage(with: hero.photo)
    }
}

// MARK: - Protocol
protocol HeroTableViewRepresentable {
    var photo: URL { get }
    var name: String { get }
    var description: String { get }
}
