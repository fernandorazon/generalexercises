//
//  LineView.swift
//  Lines
//
//  Created by d182_fernando_r on 16/06/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class LineView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        /*
        
        let context = UIGraphicsGetCurrentContext()
        
        UIColor.black.setStroke()
        
        context?.setLineWidth(5)
        
        //Movemos coordenadas hacia 00
        context?.move(to: CGPoint(x: 0, y: 0))
        
        //Agregamos una linea hasta 100 100
        context?.addLine(to: CGPoint(x: 100, y: 100))
        
        context?.addLine(to: CGPoint(x: 100, y: 200))
        
        context?.strokePath()
 
        */
        
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: 0, y: 0))
        aPath.addLine(to: CGPoint(x: 50, y: 50))
        aPath.close()
        UIColor.red.set()
        aPath.stroke()

    }
    
    

}
