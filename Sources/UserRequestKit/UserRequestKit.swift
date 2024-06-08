// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit

public class UserRequestKit: NSObject {
    public static let shared = UserRequestKit()
    
    private override init() {

        super.init()
    }
    public static func presentAsTopViewController(completion: @escaping (String?) -> Void) {
            let userListVC = FrameworkUtility.instantiateUserListViewController()
            if let userListViewController = userListVC.viewControllers.first as? UserListViewController {
                userListViewController.onDismiss = { userEmail in
                    completion(userEmail)
                }
            }
            
            FrameworkUtility.presentAsTopViewController(userListVC)
        }
}
