//
//  CustomizableButton.swift
//
//  Created by Yash Jain.
//  Copyright © 2020 YASH JAIN. All rights reserved.
//

import UIKit

@IBDesignable class CustomizableImageView: UIImageView {
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

    @IBInspectable var RoundedCorners: Bool = false {
        didSet {
            if RoundedCorners == true {
                layer.cornerRadius = bounds.height / 2
            }
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

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = borderColor?.cgColor
        layer.shadowColor = shadowColor?.cgColor
        image = image
    }
}
