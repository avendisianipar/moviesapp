//
//  GLITests.swift
//  GLITests
//
//  Created by Avendi Sianipar on 9/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import XCTest
@testable import GLI

class GLITests: XCTestCase {
    
    var sutMovies: MoviesViewModel!
    var sutMoviesDetail: MoviesDetailViewModel!

    override func setUp() {
        super.setUp()
        sutMovies = MoviesViewModel()
        sutMoviesDetail = MoviesDetailViewModel()
    }

    override func tearDown() {
        sutMovies = nil
        sutMoviesDetail = nil
        super.tearDown()
    }

    func testValidGetMoviesConfig() {
        var statusCode: Int?
        let promise = expectation(description: "200")
        sutMovies.provider.rx.request(.getConfiguration)
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    statusCode = response.statusCode
                    promise.fulfill()
                case .error(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
        }.disposed(by: sutMovies.disposeBag)
        
        wait(for: [promise], timeout: 5)
        
        XCTAssertEqual(statusCode, 200)
    }
    
    func testValidGetMoviesPopular() {
        var statusCode: Int?
        let promise = expectation(description: "200")
        sutMovies.provider.rx.request(.getPopularMovies(1))
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    statusCode = response.statusCode
                    promise.fulfill()
                case .error(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
        }.disposed(by: sutMovies.disposeBag)
        
        wait(for: [promise], timeout: 5)
        
        XCTAssertEqual(statusCode, 200)
    }
    
    func testValidGetMoviesDetail() {
        var statusCode: Int?
        let promise = expectation(description: "200")
        sutMoviesDetail.provider.rx.request(.getMovieDetail(419704))
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    statusCode = response.statusCode
                    promise.fulfill()
                case .error(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
        }.disposed(by: sutMoviesDetail.disposeBag)
        
        wait(for: [promise], timeout: 5)
        
        XCTAssertEqual(statusCode, 200)
    }
    
    func testValidGetMoviesDetailCredits() {
        var statusCode: Int?
        let promise = expectation(description: "200")
        sutMoviesDetail.provider.rx.request(.getMovieCredits(419704))
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    statusCode = response.statusCode
                    promise.fulfill()
                case .error(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
        }.disposed(by: sutMoviesDetail.disposeBag)
        
        wait(for: [promise], timeout: 5)
        
        XCTAssertEqual(statusCode, 200)
    }
    
    func testValidGetMoviesDetailReviews() {
        var statusCode: Int?
        let promise = expectation(description: "200")
        sutMoviesDetail.provider.rx.request(.getMovieReviews(419704))
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    statusCode = response.statusCode
                    promise.fulfill()
                case .error(let error):
                    XCTFail("Error: \(error.localizedDescription)")
                }
        }.disposed(by: sutMoviesDetail.disposeBag)
        
        wait(for: [promise], timeout: 5)
        
        XCTAssertEqual(statusCode, 200)
    }

}
