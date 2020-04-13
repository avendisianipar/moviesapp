//
//  ProfileRoundedView.swift
//  GLI
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class ProfileRoundedView: XIBView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    
    override func layoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    func setData(name: String?, character: String?, imgPath: ImagePath?) {
        nameLabel.text = name
        characterLabel.text = character
        guard let imgPath = imgPath else { return }
        profileImageView.setImage(withPath: imgPath, size: .small, completion: nil)
    }
}
