//
//  CustomPageControl.swift
//  AIG Verification Officer
//
//  Created by Yash Jain on 23/02/23.
//

import UIKit

class CustomPageControl: UIView {
    var numberOfPage: Int = 0, currentOfPage: Int = 0
    var startPoint: CGFloat = 0.0, start: CGFloat = 0.0

    var screenWidth: CGFloat = UIScreen.main.bounds.size.width

    var controlWidth: CGFloat!
    var selectedControlWidth: CGFloat!
    var controlHeight: CGFloat!
    var controlSpacing: CGFloat!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // ## view init method ##
    func setupView(_ page: Int, current: Int, controlWidth: CGFloat = 10.0, selectedControlWidth: CGFloat = 30.0, controlHeight: CGFloat = 10.0, controlSpacing: CGFloat = 10.0) {
        screenWidth = frame.width
        self.controlWidth = controlWidth
        self.selectedControlWidth = selectedControlWidth
        self.controlHeight = controlHeight
        self.controlSpacing = controlSpacing

        DispatchQueue.main.async { [self] in
            for v in self.subviews {
                v.hideView()
                v.removeFromSuperview()
            }

            numberOfPage = page
            currentOfPage = current

            let controlWidthWithSapcing = (controlSpacing + controlWidth)
            let combinedWidth: CGFloat = CGFloat((CGFloat(numberOfPage - 1) * controlWidthWithSapcing) + selectedControlWidth)

            var circleWidth: CGFloat = controlWidth, circleHeight: CGFloat = controlHeight

            var xPos: CGFloat = (screenWidth - combinedWidth) / 2.0, yPos: CGFloat = (frame.size.height - circleHeight) / 2.0

            startPoint = xPos

            for i in 0 ..< numberOfPage {
                let circle = UIImageView()

                if i == currentOfPage {
                    circleWidth = selectedControlWidth
                    circle.alpha = 1.0
                } else {
                    circleWidth = controlWidth
                    circle.alpha = 0.4
                }

                circle.frame = CGRect(x: xPos, y: yPos, width: circleWidth, height: circleHeight)
                circle.layer.cornerRadius = circle.frame.size.height / 2.0
                circle.backgroundColor = ColorConstants.shared.Theme
                circle.tag = i + 10
                addSubview(circle)

                xPos += circleWidth + controlSpacing
            }
        }
    }

    // ## Call the move page in scrollView ##
    func scroll_did(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        let tag = getTagForContentOffset(page) + 10
        let startPosForNextItem: CGFloat = (CGFloat(tag - 10) * scrollView.frame.size.width)

        let offset: CGFloat = ((selectedControlWidth - controlWidth) * (start - scrollView.contentOffset.x) / scrollView.frame.size.width)
        let alpha: CGFloat = (0.6 * (scrollView.contentOffset.x - startPosForNextItem) / scrollView.frame.size.width)

        if let circle: UIImageView = viewWithTag(tag) as? UIImageView,
           tag >= 10 && tag + 1 < 10 + numberOfPage {
            circle.frame = CGRect(x: startPoint + ((CGFloat(tag) - 10) * (controlSpacing + controlWidth)),
                                  y: circle.frame.origin.y,
                                  width: selectedControlWidth + (offset + ((CGFloat(tag) - 10) * (selectedControlWidth - controlWidth))),
                                  height: circle.frame.size.height)
            circle.alpha = 1 - alpha

            if let nextCircle: UIImageView = viewWithTag(tag + 1) as? UIImageView {
                let f_page_next_x: CGFloat = ((startPoint + (selectedControlWidth + controlWidth)) + ((CGFloat(tag) - 10) * (controlSpacing + controlWidth)))
                nextCircle.frame = CGRect(x: f_page_next_x + (offset + ((CGFloat(tag) - 10) * (selectedControlWidth - controlWidth))),
                                          y: nextCircle.frame.origin.y,
                                          width: controlWidth - (offset + ((CGFloat(tag) - 10) * (selectedControlWidth - controlWidth))),
                                          height: nextCircle.frame.size.height)
                nextCircle.alpha = 0.4 + alpha
            }
        }
    }

    // ## return ImageView tag number ##
    func getTagForContentOffset(_ page: CGFloat) -> Int {
        return Int(page - 0.02)
    }
}
