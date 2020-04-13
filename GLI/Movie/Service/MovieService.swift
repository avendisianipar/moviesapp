//
//  MovieService.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Moya
import Foundation

enum MovieService {
    case getConfiguration
    case getPopularMovies(_ page: Int)
    case getMovieDetail(_ id: Int)
    case getMovieCredits(_ id: Int)
    case getMovieReviews(_ id: Int)
}

extension MovieService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org")!
    }
    
    var path: String {
        switch self {
        case .getConfiguration:
            return "/3/configuration"
        case .getPopularMovies(_):
            return "/3/movie/popular"
        case .getMovieDetail(let id):
            return "3/movie/\(id)"
        case .getMovieCredits(let id):
            return "/3/movie/\(id)/credits"
        case .getMovieReviews(let id):
            return "/3/movie/\(id)/reviews"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getConfiguration,
             .getPopularMovies(_),
             .getMovieDetail(_),
             .getMovieCredits(_),
             .getMovieReviews(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        params["api_key"] = "4d702e20e6419af4a011c5a84b04d0e3"
        
        switch self {
        case .getConfiguration,
             .getMovieCredits(_),
             .getMovieReviews(_):
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .getMovieDetail(_):
            params["append_to_response"] = "videos"
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .getPopularMovies(let page):
            params["page"] = page
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }    
}
