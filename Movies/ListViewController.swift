//
//  ListViewController.swift
//  Movies
//
//  Created by Xenia Sidorova on 26.11.2020.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listTV = UITableView()
    let identifier = "listCell"
    
    let movies = ["first movie", "second movie", "third movie", "fourth movie", "avatar", "Harry Potter", "Czech arthouse"] // data model

    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listTV.dequeueReusableCell(withIdentifier: identifier)!
        cell.textLabel?.text = self.movies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func createTable() {
        self.listTV = UITableView.init(frame: view.bounds, style: .plain)
        listTV.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        self.listTV.delegate = self
        self.listTV.dataSource = self
        
        listTV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(listTV)
    }
}
