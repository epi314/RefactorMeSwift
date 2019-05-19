//
//  UIView+Alignments.swift
//  ZaPiEs
//
//  Created by Pierre Enriquez on 5/9/18.
//  Copyright © 2018 ZaPiEs. All rights reserved.
//

import UIKit

extension UIView {
  public func alignToSuperview() {
    guard let superview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false
    leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
    rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
    topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
  }
  
  public func alignCenterToSuperview() {
    guard let superview = superview else { return }
    alignCenter(x: superview.centerXAnchor, y: superview.centerYAnchor)
  }
  
  public func alignCenter(x: NSLayoutXAxisAnchor? = nil, y:NSLayoutYAxisAnchor? = nil, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    if let x = x {
      centerXAnchor.constraint(equalTo: x, constant: xOffset).isActive = true
    }
    if let y = y {
      centerYAnchor.constraint(equalTo: y, constant: yOffset).isActive = true
    }
  }
  
  public func align(top: NSLayoutYAxisAnchor? = nil, lead: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trail: NSLayoutXAxisAnchor? = nil, topPadding: CGFloat = 0, leadPadding: CGFloat = 0, bottomPadding: CGFloat = 0, trailPadding: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
    }
    if let lead = lead {
      leadingAnchor.constraint(equalTo: lead, constant: leadPadding).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
    }
    if let trail = trail {
      trailingAnchor.constraint(equalTo: trail, constant: -trailPadding).isActive = true
    }
    if width > 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    if height > 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
  
  public func align(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
    }
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
    }
    if width > 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    if height > 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
  
  public func widthEqualToSuperview(multiplier: CGFloat) {
    guard let superview = superview else { return }
    widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: multiplier).isActive = true
  }
  
  public func width(equalTo w: NSLayoutDimension, multiplier: CGFloat) {
    widthAnchor.constraint(equalTo: w, multiplier: multiplier).isActive = true
  }
  
  public func width(equalToConstant c: CGFloat) {
    widthAnchor.constraint(equalToConstant: c).isActive = true
  }
  
  public func heightEqualToSuperview(_ multiplier: CGFloat) {
    guard let superview = superview else { return }
    heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: multiplier).isActive = true
  }
  
  public func height(equalTo h: NSLayoutDimension, multiplier: CGFloat) {
    heightAnchor.constraint(equalTo: h, multiplier: multiplier).isActive = true
  }
  
  public func height(equalToConstant c: CGFloat) {
    heightAnchor.constraint(equalToConstant: c).isActive = true
  }
}
