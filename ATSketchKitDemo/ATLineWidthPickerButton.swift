//
//  ATLineWidthPickerButton.swift
//  ATSketchKit
//
//  Created by Arnaud Thiercelin on 1/26/16.
//  Copyright © 2016 Arnaud Thiercelin. All rights reserved.
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

import UIKit

@IBDesignable
class ATLineWidthPickerButton: UIButton {

	var _selectedWidth = CGFloat(1.0)
	@IBInspectable var selectedWidth: CGFloat {
		get {
			return _selectedWidth
		}
		set {
			_selectedWidth = newValue
			self.setNeedsDisplay()
		}
	}

	@IBInspectable var selectedColor = UIColor.blueColor()
	
	override func drawRect(rect: CGRect) {
		
		let colorPath = UIBezierPath(ovalInRect: rect.insetBy(dx: rect.width/2 - self.selectedWidth, dy: rect.height/2 - self.selectedWidth))
		self.selectedColor.setFill()
		colorPath.fill()
		
		let borderPath = UIBezierPath(ovalInRect: rect.insetBy(dx: 1.0, dy: 1.0))
		borderPath.lineWidth = 2.0
		UIColor.whiteColor().setStroke()
		
		borderPath.stroke()
	}
}