//
//  SceneDelegate.swift
//  DragonBallWiki
//
//  Created by Marc Navarro on 1/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let viewController = LaunchScreen()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.window?.rootViewController = LogInViewController()
        }
    }
}

