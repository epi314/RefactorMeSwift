//
//  UIColor+Convenience.swift
//  ZaPiEs
//
//  Created by Pierre Enriquez on 16/9/18.
//  Copyright © 2018 ZaPiEs. All rights reserved.
//

import UIKit

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
  }
}
