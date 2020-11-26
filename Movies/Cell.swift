//
//  Cell.swift
//  Movies
//
//  Created by Xenia Sidorova on 26.11.2020.
//

import UIKit
import SnapKit

class Cell: UITableViewCell {
    static var cellId = "listCell"
    
    let listCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemTeal
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        cell.textLabel?.textAlignment = .center
        return cell
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createCell() {
        self.addSubview(listCell)
        listCell.snp.makeConstraints { (make) in
            make.top.left.equalTo(2)
            make.right.bottom.equalTo(-2)
        }
    }
}
