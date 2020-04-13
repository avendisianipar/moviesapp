//
//  BaseViewController.swift
//  GLI
//
//  Created by Avendi Sianipar on 10/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loadingOverlayView: LoadingOverlayView?
    
    func showLoading(_ isLoading: Bool){
        if isLoading {
            addOverlayLoadingView()
        }else{
            removeOverlayLoadingView()
        }
    }
    
    func addOverlayLoadingView() {
        if loadingOverlayView == nil {
            loadingOverlayView = LoadingOverlayView(frame: UIScreen.main.bounds)
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(loadingOverlayView!)
        }
    }
    
    func removeOverlayLoadingView() {
        loadingOverlayView?.removeFromSuperview()
        loadingOverlayView = nil
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Warning", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }   
}
