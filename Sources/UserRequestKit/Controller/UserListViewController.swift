//
//  UserListViewController.swift
//  
//
//  Created by Vishal Kamble on 08/06/24.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    private var users: [User] = []
    var onDismiss: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User List"
        userTableView.delegate = self
        userTableView.dataSource = self
        self.fetchUsers()
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        }
    
    
    // MARK: - API - fetch user data
    private func fetchUsers() {
        APIManager.shared.getUsers(page: 1) { [weak self] result in
                switch result {
                case .success(let users):
                    self?.users = users
                    DispatchQueue.main.async {
                        self?.userTableView.reloadData()
                    }
                case .failure(let error):
                    print("Error fetching users: \(error)")
                }
            }
        }
    
    // MARK: - Tap to Return app button
    @IBAction func returnToApp(_ sender: UIButton) {
        guard let firstUser = users.first else {
                    presentingViewController?.dismiss(animated: true, completion: nil)
                    return
                }
                let userEmail = firstUser.email
                presentingViewController?.dismiss(animated: true) {
                    self.onDismiss?(userEmail)
                }
    }
}

// MARK: - TableView Extension
extension UserListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.titleLbl.text = "\(user.firstName) \(user.lastName)"
        cell.emailLbl.text = user.email
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }

}
