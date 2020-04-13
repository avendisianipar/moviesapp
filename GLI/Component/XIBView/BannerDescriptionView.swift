//
//  BannerDescriptionView.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class BannerDescriptionView: XIBView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    func setData(title: String?, overview: String?, imgPath: ImagePath?) {
        titleLabel.text = title
        overviewLabel.text = overview
        guard let imgPath = imgPath else { return }
        posterImageView.setImage(withPath: imgPath, size: .big, completion: nil)
    }
}

