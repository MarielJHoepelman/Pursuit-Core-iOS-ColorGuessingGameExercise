//
//  RGBValues.swift
//  MVC Lab
//
//  Created by Mariel Hoepelman on 7/30/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation
import UIKit

struct RGBGenerator {
    var randRed:CGFloat = 0.0
    var randGreen:CGFloat = 0.0
    var randBlue:CGFloat = 0.0
    let alpha = 1.0
    
    mutating func colorGenerator() -> UIColor {
        randRed = CGFloat.random(in: 0...1)
        randGreen = CGFloat.random(in: 0...1)
        randBlue = CGFloat.random(in: 0...1)
        
        return UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1.0)
    }
    
    func greatestValue() -> CGFloat {
        var greatest: CGFloat = 0.0
        
        if randRed > greatest{
            greatest = randRed
        }
        if randGreen > greatest {
            greatest = randGreen
        }
        if randBlue > greatest {
            greatest = randBlue
        }
        
        return greatest
    }
    
}

