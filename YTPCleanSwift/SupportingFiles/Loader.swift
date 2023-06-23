//
//  Loader.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 14.03.2023.
//

import UIKit
import NVActivityIndicatorView

public class Loader: NSObject {
    
    public static let shared = Loader()
    
    lazy var animationView: NVActivityIndicatorView = {
        let activityIndicator = NVActivityIndicatorView(
            frame: .init(origin: .zero, size: .init(width: 50, height: 50)),
            type: NVActivityIndicatorType.circleStrokeSpin,
            color: UIColor.black
        )
        return activityIndicator
    }()
    
    var animation = NVActivityIndicatorView(frame: CGRect(origin: .zero, size: .init(width: 50, height: 50)))
    
    var backgroundView = UIView()
    
    var isShowing = false
    
    public func show(view: UIView? = UIApplication.shared.keyWindow) {
        guard !isShowing else { return }
        isShowing = true
        
//        backgroundView.frame = UIScreen.main.bounds
//        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.45)
//
//        animationView.frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
//        animationView.center = backgroundView.center
//        backgroundView.addSubview(animationView)
//
//        view?.addSubview(backgroundView)
        animationView.startAnimating()
    }
    
    public func hide() {
        DispatchQueue.main.async { [weak self] in
            self?.animationView.stopAnimating()
            self?.backgroundView.removeFromSuperview()
            self?.isShowing = false
        }
    }
}
