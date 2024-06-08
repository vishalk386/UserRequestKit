//
//  FrameworkUtility.swift
//
//
//  Created by Vishal Kamble on 08/06/24.
//

import Foundation
import UIKit

class FrameworkUtility {
    
    static func instantiateUserListViewController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.module)
        guard let navController = storyboard.instantiateViewController(withIdentifier: "UserListNavigationController") as? UINavigationController else {
            return UINavigationController()
        }
    
        if let userListVC = navController.viewControllers.first as? UserListViewController {
            userListVC.modalPresentationStyle = .fullScreen
        }
            UINavigationBar.appearance().barTintColor = UIColor.systemIndigo
            UINavigationBar.appearance().tintColor = UIColor.white
            navController.modalPresentationStyle = .fullScreen
        let indigoColor = UIColor.systemIndigo
            navController.navigationBar.barTintColor = indigoColor
            navController.navigationBar.tintColor = UIColor.white
            navController.view.backgroundColor = indigoColor
        return navController
    }

    static func presentAsTopViewController(_ viewController: UIViewController) {
        guard let topViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("not access top View Controller.")
            return
        }
        
        var currentViewController = topViewController
        while let presentedViewController = currentViewController.presentedViewController {
            currentViewController = presentedViewController
        }
        
        currentViewController.present(viewController, animated: true, completion: nil)
    }

}
