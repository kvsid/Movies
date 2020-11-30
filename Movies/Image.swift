//
//  Image.swift
//  Movies
//
//  Created by Xenia Sidorova on 29.11.2020.
//

import UIKit

class Image: UIImageView {
    private let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getCropRatio() -> CGFloat { // use further
        return CGFloat((self.image?.size.width)! / (self.image?.size.height)!)
    }

    func load(filePathName: String) {
        let url = self.baseURL.appendingPathComponent(filePathName)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
