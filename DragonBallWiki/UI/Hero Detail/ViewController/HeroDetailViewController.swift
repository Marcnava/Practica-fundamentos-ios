//
//  HeroDetailViewController.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 4/7/24.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var heroNameDetail: UILabel!
    @IBOutlet weak var heroDescriptionDetail: UILabel!
    @IBOutlet weak var imageHeroDetail: UIImageView!
    @IBOutlet weak var transformationButton: UIButton!
    
    // MARK: - Properties
    private let hero: Hero
    private let model = NetworkModel()
    private var transformations: [Transformation] = []
    
    init(hero: Hero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI config
        transformationButton.isHidden = true
        title = hero.name
        heroNameDetail.text = hero.name
        heroNameDetail.textColor = .white
        heroDescriptionDetail.text = hero.description
        heroDescriptionDetail.textColor = .white
        heroDescriptionDetail.numberOfLines = 0
        imageHeroDetail.kf.setImage(with: hero.photo)
        
        model.getTransformations(for: hero) { [weak self] result in
            switch result {
            case let .success(transformations):
                // Cleaning and sorting API results
                var transformationsSet = Set<String>()
                var uniqueTransformations: [Transformation] = []
                
                for transformation in transformations {
                    if !transformationsSet.contains(transformation.name) {
                        transformationsSet.insert(transformation.name)
                        uniqueTransformations.append(transformation)
                    }
                }
                
                self?.transformations = uniqueTransformations
                self?.transformations.sort {
                    let transformation1 = Int($0.name.split(separator: ".").first ?? "") ?? 0
                    let transformation2 = Int($1.name.split(separator: ".").first ?? "") ?? 0
                    return transformation1 < transformation2
                }
                // Show transformations button if there are transformations
                DispatchQueue.main.async {
                    if transformations != [] {
                        self?.transformationButton.layer.borderWidth = 1.0
                        self?.transformationButton.layer.borderColor = UIColor.white.cgColor
                        self?.transformationButton.layer.cornerRadius = 10
                        self?.transformationButton.clipsToBounds = true
                        self?.transformationButton.isHidden = false
                    }
                }
            case let .failure(error):
                print("Error \(error)")
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func transformationButtonTapped(_ sender: Any) {
        let transformationsListTableViewController = TransformationsListTableViewController()
        transformationsListTableViewController.transformations = self.transformations
        navigationController?.show(transformationsListTableViewController, sender: nil)
    }
    
}
