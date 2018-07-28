//
//  CounterButton.swift
//  Lines
//
//  Created by d182_fernando_r on 16/06/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

//Permite que todo lo que esta en las vistas se pueda ver en el interface builder
@IBDesignable

class CounterButton: UIButton {
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        
        //Pintamos el boton de verde
        UIColor.green.setFill()
        path.fill()
        
        //Pintamos la cruz
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        let halfPlusWidth = plusWidth/2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = 3.0
        
        //La linea horizontal de la cruz
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        //El color de la linea
        UIColor.white.setStroke()
        plusPath.stroke()
        
        //La linea vertical de la cruz
        
        plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfPlusWidth))
        plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight + halfPlusWidth))
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }


}
