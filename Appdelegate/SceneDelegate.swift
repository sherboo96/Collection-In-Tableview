//
//  SceneDelegate.swift
//  Collection-In-Tableview
//
//  Created by Mahmoud Sherbeny on 11/22/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setRoot()
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func setRoot() {
        
        let VC = MainVC()
        let navBar = UINavigationController(rootViewController: VC)
        window?.rootViewController = navBar
    }
}
