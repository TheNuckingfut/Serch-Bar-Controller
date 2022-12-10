//
//  ViewController.swift
//  serchBarController
//
//  Created by Felix IT on 24/11/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    let users = ["Pratik", "Yash", "Ranjit", "Deepali", "Shrutika", "Snehal", "Sagar"]
    var filteredData: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = users
        
        searchBar()
        
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = filteredData[indexPath.row]
        return cell!
    }
    
}
extension ViewController: UISearchBarDelegate {

    func searchBar() {
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        self.userTableView.tableHeaderView = searchBar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = users
        }
        for word in users {
            if word.lowercased().contains(searchText.lowercased()) {
                filteredData.append(word)
            }
        }
        self.userTableView.reloadData()
    }
}
