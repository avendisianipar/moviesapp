//
//  ObservableData.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import RxSwift

class ObservableData<DATA> {
    var value: DATA? = nil {
        didSet {
            observers.onNext(value)
        }
    }
    
    private let observers = PublishSubject<DATA?>()
    
    init(_ data: DATA? = nil) {
        self.value = data
    }
    
    func observe(_ disposeBag: DisposeBag, observer:  @escaping (DATA?) -> Void) {
        observers
            .subscribe(onNext: observer, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}
