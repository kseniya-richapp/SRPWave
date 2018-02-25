//
//  ProductViewShadow.swift
//  WaveExam
//
//  Created by Ksyunia on 24/02/2018.
//  Copyright © 2018 Ksyunia Efimova. All rights reserved.
//

import UIKit

@IBDesignable

class ProductViewShadow: UIView {

    @IBInspectable var shadowOffset:CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowOpacity: Float = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
   
    func setup() {
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
    }

}
