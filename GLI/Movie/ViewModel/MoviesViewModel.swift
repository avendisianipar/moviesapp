//
//  MoviesViewModel.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import Moya
import RxSwift

class MoviesViewModel: BaseViewModel {
    
    let disposeBag = DisposeBag()
    let provider = MoyaProvider<MovieService>()
    let movies = ObservableData<MoviesModel>()
    
    func getConfiguration() {
        isLoading.value = true
        provider.rx.request(.getConfiguration)
            .subscribe { [weak self] (event) in
                self?.isLoading.value = false
                switch event {
                case .success(let response):
                    self?.handleConfigResponse(response: response)
                case .error(let error):
                    self?.handleError(error)
                }
        }.disposed(by: disposeBag)
    }
    
    func getPopularMovies(page: Int) {
        provider.rx.request(.getPopularMovies(page))
            .subscribe { [weak self] (event) in
                switch event {
                case .success(let response):
                    self?.handleMovieResponse(response: response)
                case .error(let error):
                    self?.handleError(error)
                }
        }.disposed(by: disposeBag)
    }
}

private extension MoviesViewModel {
    func handleConfigResponse(response: Response) {
        debugPrintResponse(response)
        if let model: MoviesConfigModel = ResponseHandler.getResponse(data: response.data) {
            let imageManager = ImageManager(moviesApiConfig: model)
            UIImageView.imageManager = imageManager
            getPopularMovies(page: 1)
            return
        }
        handleError(ErrorType.parserError)
    }
    
    func handleMovieResponse(response: Response) {
        debugPrintResponse(response)
        if let model: MoviesModel = ResponseHandler.getResponse(data: response.data) {
            movies.value = model
            return
        }
        handleError(ErrorType.parserError)
    }
}
