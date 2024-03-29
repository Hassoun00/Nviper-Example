//
//  File.swift
//  Example
//
//  Created by hassoun on 24/04/2022.
//

import Foundation
import UIKit



protocol AnyView {
    
    var presenter: AnyPresenter? {get set }
func update (with users: [User])
func update (with error: String)
}

class UserViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
var presenter: AnyPresenter?
     
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
     
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func update (with users: [User]){
        print("DONE")
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update (with error: String){
        print(error)
    }
    //The table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
}

