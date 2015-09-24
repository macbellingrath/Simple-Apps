//: Playground - noun: a place where people can play

import UIKit


//Structs

var name = "Jo"
unsafeAddressOf(name)
var name2 = name
unsafeAddressOf(name2)

//Classes
var name3: NSMutableString = "Jo"
unsafeAddressOf(name3)
var name4 = name3
unsafeAddressOf(name4)






let image = [#Image(imageLiteral: "Swift_logo.svg.png")#]
let color = [#Color(colorLiteralRed: 1, green: 0.1908875781, blue: 0.2489406842, alpha: 1)#]
let text = [#FileReference(fileReferenceLiteral: "hello")#]
let colorArray = [[#Color(colorLiteralRed: 0.7411800027, green: 0.9921600223, blue: 0.2117599994, alpha: 1)#],[#Color(colorLiteralRed: 1, green: 0.2941200137, blue: 0.3137300014, alpha: 1)#]]

let hi = [#FileReference(fileReferenceLiteral: "hi")#]

