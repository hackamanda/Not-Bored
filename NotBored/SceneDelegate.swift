//
//  SceneDelegate.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        window?.windowScene = scene
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = ActivitiesViewController()
        window?.rootViewController = UINavigationController(rootViewController: InitialViewController())
         
    }
}

   

