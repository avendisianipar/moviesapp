//
//  CreditsCollectionViewCell.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class CreditsCollectionViewCell: BaseCollectionCell {
    override func initView() {
        let view = ProfileRoundedView()
        view.tag = 1
        addSubviewWithConstraint(item: view, spacing: 0)
    }
}

