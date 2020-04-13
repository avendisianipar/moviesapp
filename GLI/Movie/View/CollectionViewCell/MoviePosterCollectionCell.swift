//
//  MoviePosterCollectionCell.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Foundation

class MoviePosterCollectionCell: BaseCollectionCell {
    override func initView() {
        let view = PosterView()
        view.tag = 1
        addSubviewWithConstraint(item: view, spacing: 0)
    }
}
