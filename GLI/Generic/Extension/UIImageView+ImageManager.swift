//
//  UIImageView+ImageManager.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//


import UIKit
import SDWebImage

var imageViewImageManagerAssociatedObjectHandle: UInt8 = 0

extension UIImageView {
    static var imageManager: ImageManager? {
        get {
            return objc_getAssociatedObject(self, &imageViewImageManagerAssociatedObjectHandle) as? ImageManager
        }
        set {
            objc_setAssociatedObject(self, &imageViewImageManagerAssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setImage(withPath path: ImagePath, size: ImageSize, completion: ((_ value: Bool) -> Void)?) {
        guard let imageURL = UIImageView.imageManager?.url(fromTMDbPath: path, withSize: size) else { return }
        setImage(withURL: imageURL, completion: completion)
    }
    
    func setImage(withURL url: URL, completion: ((_ value: Bool) -> Void)?) {
        let hasImage: Bool = (self.image != nil)
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url, placeholderImage: nil, options: .avoidAutoSetImage) { [weak self] (image, error, cacheType, url) in
            if !hasImage && cacheType == .none {
                self?.alpha = 0.0
                UIView.animate(withDuration: 0.5) { self?.alpha = 1.0 }
            }
            self?.image = image
            completion?(true)
        }
    }
}
