//
//  MoviesDetailViewModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Moya
import RxSwift

class MoviesDetailViewModel: BaseViewModel {
    
    let disposeBag = DisposeBag()
    let provider = MoyaProvider<MovieService>()
    let casting = ObservableData<MoviesCreditModel>()
    let reviews = ObservableData<MoviesReviewsModel>()
    let moviesDetail = ObservableData<MoviesDetailModel>()
    
    func getMovieDetail(id: Int) {
        isLoading.value = true
        provider.rx.request(.getMovieDetail(id))
            .subscribe { [weak self] (event) in
                self?.isLoading.value = false
                switch event {
                case .success(let response):
                    self?.handleDetailResponse(response: response, movieId: id)
                case .error(let error):
                    self?.handleError(error)
                }
        }.disposed(by: disposeBag)
    }
    
    func getMovieCredits(id: Int) {
        provider.rx.request(.getMovieCredits(id))
            .subscribe { [weak self] (event) in
                switch event {
                case .success(let response):
                    self?.handleCreditsResponse(response: response)
                case .error(let error):
                    self?.handleError(error)
                }
        }.disposed(by: disposeBag)
    }
    
    func getMovieReviews(id: Int) {
        provider.rx.request(.getMovieReviews(id))
            .subscribe { [weak self] (event) in
                switch event {
                case .success(let response):
                    self?.handleReviewsResponse(response: response)
                case .error(let error):
                    self?.handleError(error)
                }
        }.disposed(by: disposeBag)
    }
    
}

private extension MoviesDetailViewModel {
    func handleDetailResponse(response: Response, movieId: Int) {
        debugPrintResponse(response)
        if let model: MoviesDetailModel = ResponseHandler.getResponse(data: response.data) {
            getMovieCredits(id: movieId)
            getMovieReviews(id: movieId)
            moviesDetail.value = model
            return
        }
        handleError(ErrorType.parserError)
    }
    
    func handleCreditsResponse(response: Response) {
        debugPrintResponse(response)
        if let model: MoviesCreditModel = ResponseHandler.getResponse(data: response.data) {
            casting.value = model
            return
        }
    }
    
    func handleReviewsResponse(response: Response) {
        debugPrintResponse(response)
        if let model: MoviesReviewsModel = ResponseHandler.getResponse(data: response.data) {
            reviews.value = model
            return
        }
    }
}
