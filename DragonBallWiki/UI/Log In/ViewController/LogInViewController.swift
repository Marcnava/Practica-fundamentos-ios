//
//  LogInViewController.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 1/7/24.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let model = NetworkModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        model.login(
            user: mailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    let heroesTableView = HeroesListTableViewController()
                    let navigationController = UINavigationController(rootViewController: heroesTableView)
                    navigationController.modalPresentationStyle = .fullScreen
                    self?.show(navigationController, sender: self)

                case let .failure(error):
                    print("Error \(error)")
                }
            }
        }
    }
    
}
