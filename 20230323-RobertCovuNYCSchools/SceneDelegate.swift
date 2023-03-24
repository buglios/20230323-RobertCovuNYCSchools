//
//  SceneDelegate.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/23/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        let viewController = ViewController()
        let navViewController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navViewController
        window?.makeKeyAndVisible()
    }
    
}
