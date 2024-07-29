//
//  HeroesListTableViewController.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 3/7/24.
//

import UIKit

class HeroesListTableViewController: UITableViewController {
    
    // MARK: - Properties
    private let model = NetworkModel()
    private var heroes: [Hero] = []
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Heroes"
        navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        navigationController?.navigationBar.standardAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .heavy)
        ]
        
        tableView.register(
            UINib(nibName: HeroTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HeroTableViewCell.identifier
        )
        
        model.getHeroes() { [weak self] result in
            switch result {
            case let .success(heroes):
                self?.heroes = heroes
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case let .failure(error):
                print("Error \(error)")
            }
        }

        self.navigationController?.navigationBar.tintColor = .white
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count - 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeroTableViewCell.identifier,
            for: indexPath
        ) as? HeroTableViewCell else {
            return UITableViewCell()
        }
        let hero = heroes[indexPath.row]
        cell.configure(with: hero)
        let disclosureIndicatorImage = UIImage(systemName: "chevron.right")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        cell.accessoryView = UIImageView(image: disclosureIndicatorImage)
        let selectedView = UIView()
        selectedView.backgroundColor = .systemCyan
        cell.selectedBackgroundView = selectedView
        return cell
    }
    
    // MARK: - Row Config
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let hero = heroes[indexPath.row]
        let heroDetailViewController = HeroDetailViewController(hero: hero)
        navigationController?.show(heroDetailViewController, sender: nil)
    }
    
}
