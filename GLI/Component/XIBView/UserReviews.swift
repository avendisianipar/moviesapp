//
//  UserReviews.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class UserReviews: XIBView {
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    
    func setData(author: String?, content: String) {
        authorLabel.text = author
        contentLabel.text = content
    }
}
