//
//  CustomizableButton.swift
//
//  Created by Yash Jain.
//  Copyright © 2020 YASH JAIN. All rights reserved.
//

import UIKit

@IBDesignable class CustomizableView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var shadowHeight: CGFloat = 0 {
        didSet {
            layer.shadowOffset = CGSize(width: 0.0, height: shadowHeight)
            layer.shadowOpacity = 1
            layer.shadowRadius = 5
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor ?? #colorLiteral(red: 0.2745098039, green: 0.4078431373, blue: 0.5019607843, alpha: 0.1)
        }
    }

    @IBInspectable var RoundedCorners: Bool = false {
        didSet {
            if RoundedCorners == true {
                layer.cornerRadius = bounds.height / 2
            }
        }
    }

    @IBInspectable var gradient: Bool = false { didSet { updateColors() }}
    @IBInspectable var startColor: UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor: UIColor = .white { didSet { updateColors() }}
    var startLocation: Double = 0.0
    var endLocation: Double = 1.0
    @IBInspectable var horizontalMode: Bool = false { didSet { updatePoints() }}
    @IBInspectable var diagonalTTB: Bool = false { didSet { updatePoints() }}
    @IBInspectable var diagonalBTT: Bool = false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if gradient {
            if horizontalMode {
                gradientLayer.startPoint = .init(x: 0, y: 0.5)
                gradientLayer.endPoint = .init(x: 1, y: 0.5)
            } else if diagonalTTB {
                gradientLayer.startPoint = .init(x: 0, y: 0)
                gradientLayer.endPoint = .init(x: 1, y: 1)
            } else if diagonalBTT {
                gradientLayer.endPoint = .init(x: 1, y: 0)
                gradientLayer.startPoint = .init(x: 0, y: 1)
            } else {
                gradientLayer.startPoint = .init(x: 0.5, y: 0)
                gradientLayer.endPoint = .init(x: 0.5, y: 1)
            }
        }
    }

    func updateColors() {
        if gradient {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if gradient {
            updatePoints()
            updateColors()
        }
        layer.borderColor = borderColor?.cgColor
        layer.shadowColor = shadowColor?.cgColor
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        DispatchQueue.main.async {
//            self.alpha = 1.0
//            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
//                self.alpha = 0.5
//            }, completion: nil)
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        DispatchQueue.main.async {
//            self.alpha = 0.5
//            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
//                self.alpha = 1.0
//            }, completion: nil)
//        }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        DispatchQueue.main.async {
//            self.alpha = 0.5
//            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
//                self.alpha = 1.0
//            }, completion: nil)
//        }
//    }
}
