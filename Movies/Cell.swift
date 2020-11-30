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
    let mainImageView : Image = {
        var image = Image(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    let label = UILabel()

    var model: Movie? = nil

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createCell() {
        if let model = self.model {
            mainImageView.load(filePathName: model.posterPath)
            label.text = model.originalTitle
            label.frame = CGRect(x: 100, y: 0, width: 100, height: 30)
            label.textColor = .white

            self.addSubview(listCell)
            self.addSubview(mainImageView)
            self.addSubview(label)

            mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

            listCell.snp.makeConstraints { (make) in
                make.top.left.equalTo(2)
                make.right.bottom.equalTo(-2)
            }
        }
    }
}
