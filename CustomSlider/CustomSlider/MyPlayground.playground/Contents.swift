//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




//// Color Declarations
let color = UIColor(red: 0.740, green: 0.706, blue: 0.284, alpha: 1.000)
let color2 = UIColor(red: 0.391, green: 0.813, blue: 0.859, alpha: 1.000)
let color3 = UIColor(red: 0.853, green: 0.290, blue: 0.290, alpha: 1.000)
let color4 = UIColor(red: 0.898, green: 0.273, blue: 0.656, alpha: 1.000)

//// Color Picker Drawing
let colorPickerPath = UIBezierPath(roundedRect: CGRectMake(64, 49, 370, 71), cornerRadius: 11)
UIColor.grayColor().setFill()
colorPickerPath.fill()


//// Rectangle Drawing
var rectanglePath = UIBezierPath(roundedRect: CGRectMake(64, 49, 74, 71), byRoundingCorners: [UIRectCorner.TopLeft, UIRectCorner.BottomLeft], cornerRadii: CGSizeMake(7, 7))
rectanglePath.closePath()
color2.setFill()
rectanglePath.fill()


//// Rectangle 2 Drawing
let rectangle2Path = UIBezierPath(rect: CGRectMake(138, 49, 74, 71))
color.setFill()
rectangle2Path.fill()


//// Rectangle 3 Drawing
let rectangle3Path = UIBezierPath(roundedRect: CGRectMake(212, 49, 74, 71), cornerRadius: 7)
color3.setFill()
rectangle3Path.fill()


//// Rectangle 4 Drawing
let rectangle4Path = UIBezierPath(roundedRect: CGRectMake(286, 49, 74, 71), cornerRadius: 7)
color4.setFill()
rectangle4Path.fill()





