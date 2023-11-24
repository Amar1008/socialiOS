//
//  CustomizableLabel.swift
//  AIG Verification Officer
//
//  Created by Yash Jain on 09/05/22.
//

import UIKit

@IBDesignable class ErrorLabel: UILabel {
    
    @IBInspectable var padding : UIEdgeInsets = UIEdgeInsets(top: 24, left: 12, bottom: 8, right: 12)
    
    // Create a new SSPaddingLabel instance from Storyboard with default insets
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        padding = UIEdgeInsets(top: 24, left: 12, bottom: 8, right: 12)
        layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        layer.zPosition = -1
//        layer.backgroundColor = ColorConstants.shared.ErrorLabelText.cgColor
        layer.cornerRadius = cornerRadius
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    // Override `intrinsicContentSize` property for Auto layout code
    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
    // Override `sizeThatFits(_:)` method for Springs & Struts code
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        let width = superSizeThatFits.width + padding.left + padding.right
        let heigth = superSizeThatFits.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
    @IBInspectable var cornerRadius: CGFloat = 14 {
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

    @IBInspectable var RoundedCorners: Bool = false {
        didSet {
            if RoundedCorners == true {
                layer.cornerRadius = bounds.height / 2
            }
        }
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = borderColor?.cgColor
        layer.shadowColor = shadowColor?.cgColor
    }
}
