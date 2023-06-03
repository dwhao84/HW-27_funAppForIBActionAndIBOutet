//
//  shapeImageView.swift
//  HW#27_funAppForIBActionAndIBOutet
//
//  Created by Dawei Hao on 2023/5/26.
//

import UIKit

class SharpImageView: UIImageView {

    override func layoutSubviews() {
super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height * 0.8))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    
}
