//
//  ImageManager.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//


import UIKit

public enum ImageSize {
    case small
    case medium
    case big
    case original
    
    static var posterRatio: CGFloat = (2.0 / 3.0)
    static var backdropRatio: CGFloat = (300.0 / 169.0)
}

public enum ImagePath {
    case backdrop(path: String)
    case logo(path: String)
    case poster(path: String)
    case profile(path: String)
    case still(path: String)
    
    var path: String {
        switch self {
        case .backdrop(let path): return path
        case .logo(let path): return path
        case .poster(let path): return path
        case .profile(let path): return path
        case .still(let path): return path
        }
    }
}

public final class ImageManager: NSObject {
    
    fileprivate let moviesApiConfig: MoviesConfigModel
    
    public init(moviesApiConfig: MoviesConfigModel) {
        self.moviesApiConfig = moviesApiConfig
    }
    
    private func pathComponent(forSize size: ImageSize, andPath imagePath: ImagePath) -> String {
        let array: [String] = {
            switch imagePath {
                case .backdrop: return self.moviesApiConfig.backdropSizes
                case .logo: return self.moviesApiConfig.logoSizes
                case .poster: return self.moviesApiConfig.posterSizes
                case .profile: return self.moviesApiConfig.profileSizes
                case .still: return self.moviesApiConfig.stillSizes
            }
        }()
        let sizeComponentIndex: Int = {
            switch size {
                case .small: return 0
                case .medium: return array.count / 2
                case .big: return array.count - 2
                case .original: return array.count - 1
            }
        }()
        let sizeComponent: String = array[sizeComponentIndex]
        return "\(sizeComponent)/\(imagePath.path)"
    }
    
    func url(fromTMDbPath imagePath: ImagePath, withSize size: ImageSize) -> URL? {
        let pathComponent = self.pathComponent(forSize: size, andPath: imagePath)
        let url = URL(string: self.moviesApiConfig.imagesSecureBaseURLString)?.appendingPathComponent(pathComponent)
        return url
    }
}
