//
//  TransformationsListTableViewController.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 5/7/24.
//

import UIKit

class TransformationsListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var transformations: [Transformation] = []
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transformations"
        
        tableView.register(
            UINib(nibName: HeroTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HeroTableViewCell.identifier
        )

        self.navigationController?.navigationBar.tintColor = .white
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeroTableViewCell.identifier,
            for: indexPath
        ) as? HeroTableViewCell else {
            return UITableViewCell()
        }
        let transformation = transformations[indexPath.row]
        cell.configure(with: transformation)
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
        let transformation = transformations[indexPath.row]
        let transformationDetailViewController = TransformationDetailViewController(transformation: transformation)
        navigationController?.show(transformationDetailViewController, sender: nil)
    }
    
}
