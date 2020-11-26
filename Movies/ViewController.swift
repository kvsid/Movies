//
//  ViewController.swift
//  Movies
//
//  Created by Xenia Sidorova on 26.11.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var tbl: UITableView = {
        let v = UITableView()
        v.rowHeight = 270
        v.separatorStyle = .none
        return v
    }()

    var items: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        items.append(contentsOf: (1...2).map { index in "Item \(index)"})
//        setupUI()
    }

    func setupUI() {
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        self.view.addSubview(tbl)
        tbl.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        cell.lblTitle.text = items[indexPath.row]
        return cell
    }
}

class CustomCell: UITableViewCell {
    static var cellId = "cell"

    let lblTitle: UILabel = {
        let v = UILabel()
        v.backgroundColor = .systemGreen
        v.textColor = .white
        v.textAlignment = .center
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.right.bottom.equalTo(-20)
        }
    }
}
