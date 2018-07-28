//
//  CounterView.swift
//  Lines
//
//  Created by d182_fernando_r on 16/06/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

@IBDesignable

class CounterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
    }
    
    @IBInspectable var counterColor: UIColor = UIColor.orange
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - 130/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = 76
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLength = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outLineEndAngle = arcLength * CGFloat(counter) + startAngle
        
        //Otra curva de Bezier
        let outLinePath = UIBezierPath(arcCenter: center, radius: bounds.width, startAngle: startAngle, endAngle: outLineEndAngle, clockwise: true)
        
        outLinePath.addArc(withCenter: center, radius: bounds.width/2 - 76 + 4, startAngle: startAngle, endAngle: outLineEndAngle, clockwise: false)
        
        UIColor.black.setStroke()
        outLinePath.lineWidth = 8
        outLinePath.stroke()
        outLinePath.close()
        
        
    }
    
    
    
}
