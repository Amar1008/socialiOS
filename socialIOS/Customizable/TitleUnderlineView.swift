//
//  TitleUnderlineView.swift
//  AIG Verification Officer
//
//  Created by anil on 11/09/23.
//

import Foundation

import Foundation
import UIKit

@IBDesignable class TitleUnderlineView: UIView{

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = frame.height / 2
        layer.maskedCorners = [.lbbsTopRight,.lbbsBottomRight]
        backgroundColor = ColorConstants.shared.Theme
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.height / 2
        layer.maskedCorners = [.lbbsTopRight,.lbbsBottomRight]
        backgroundColor = ColorConstants.shared.Theme
    }
}
