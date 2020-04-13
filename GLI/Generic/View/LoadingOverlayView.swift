//
//  LoadingOverlayView.swift
//  GLI
//
//  Created by Avendi Sianipar on 10/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class LoadingOverlayView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView() {
        let indicator = UIActivityIndicatorView()
        indicator.transform = CGAffineTransform(scaleX: 1, y: 1)
        indicator.tintColor = UIColor.white
        indicator.style = .whiteLarge
        addSubviewCenterConstraint(item: indicator)
        indicator.startAnimating()
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        bringSubviewToFront(indicator)
    }
}
