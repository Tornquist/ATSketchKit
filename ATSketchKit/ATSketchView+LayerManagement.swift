//
//  LayerDeletion.swift
//  ATSketchKit
//
//  Created by Arnaud Thiercelin on 11/26/15.
//  Copyright © 2015 Arnaud Thiercelin. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial
//  portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
//  NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

extension ATSketchView {
	
	func addShapeLayer(shape: UIBezierPath, lineWidth: CGFloat, color: UIColor) {
		let newShapeLayer = ATShapeLayer()
		
		newShapeLayer.path = shape.CGPath
		newShapeLayer.lineWidth = lineWidth
		newShapeLayer.strokeColor = color.CGColor
		newShapeLayer.fillColor = nil
		newShapeLayer.contentsScale = UIScreen.mainScreen().scale
		self.layer.insertSublayer(newShapeLayer, below: self.topLayer)
		newShapeLayer.setNeedsDisplay()
	}
	
	/** 
	This method returns the most recently create layer produced by drawing/erasing
	*/
	func mostRecentLayer() -> ATShapeLayer? {
		
		for index in (0..<self.layer.sublayers!.count).reverse() {
			let layer = self.layer.sublayers![index]
			if layer is ATShapeLayer {
				return layer as? ATShapeLayer
			}
		}
		
		return nil
	}
	
	/** 
	Returns the number of shape layers within the layer stack
	*/
	public func shapeLayerCount() -> Int {
		var count = 0
		
		for layer in self.layer.sublayers! {
			if layer is ATShapeLayer {
				count++
			}
		}
		return count
	}
	
	func updateTopLayer() {
		let smartPath = ATSmartBezierPath(withPoints: self.pointsBuffer)
		let smoothPath = smartPath.smoothPath(20)
		self.topLayer.lineWidth = self.currentLineWidth
		
		let strokeColor = (self.currentTool == .Eraser ? self.eraserColor : self.currentColor)
		self.topLayer.strokeColor = strokeColor.CGColor
		self.topLayer.fillColor = nil
		self.topLayer.contentsScale = UIScreen.mainScreen().scale
		
		self.topLayer.path = smoothPath.CGPath
	}
	
	func clearTopLayer() {
		self.topLayer.path = nil
	}
}
