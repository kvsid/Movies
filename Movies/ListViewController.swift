//
//  ListViewController.swift
//  Movies
//
//  Created by Xenia Sidorova on 26.11.2020.
//

import UIKit
import SnapKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var movies: [Movie] = []

    lazy var listTB: UITableView = {
        let view = UITableView()
        view.rowHeight = 50
        view.separatorStyle = .none
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        MovieAPIService.shared.fetchMovies(from: .nowPlaying) { (result: Result<Movies, MovieAPIService.APIServiceError>) in
            switch result {
                case .success(let movieResponse):
                    print(movieResponse.results)
                    self.movies = movieResponse.results
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }

        createTable()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellId, for: indexPath) as! Cell
        cell.listCell.textLabel?.text = movies[indexPath.row].originalTitle
        return cell
    }

    func createTable() {
        self.listTB.delegate = self
        self.listTB.dataSource = self
        
        listTB.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        listTB.register(Cell.self, forCellReuseIdentifier: Cell.cellId)
        
        self.view.addSubview(listTB)
        listTB.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
