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

    let listLB: UILabel = {
        let v = UILabel()
        v.backgroundColor = .systemTeal
        v.textColor = .white
        v.textAlignment = .center
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createCell() {
        self.addSubview(listLB)
        listLB.snp.makeConstraints { (make) in
            make.top.left.equalTo(2)
            make.right.bottom.equalTo(-2)
        }
    }
}
