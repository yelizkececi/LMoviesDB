//
//  UIView+Extensions.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 30.06.2022.
//

import UIKit

extension UIView {
    // MARK: - Method Slider Animations
    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

class GradientView: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if let gradientLayer = self.layer as? CAGradientLayer {
            gradientLayer.colors = [
                UIColor.darkGray.cgColor,
                UIColor(white: 1, alpha: 0.1).cgColor
            ]
            backgroundColor = UIColor.clear
        }
    }
}
