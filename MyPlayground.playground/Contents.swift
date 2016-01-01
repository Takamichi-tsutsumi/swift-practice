//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " Rob"


//for character in newString.characters {
//    print(character)
//}


var newTypeString = NSString(string: newString)

newTypeString.substringToIndex(5)

newTypeString.substringFromIndex(6)

newTypeString.substringWithRange(NSRange(location: 3, length: 5))


if newTypeString.containsString("Rob") {
    
    print("Rob is here")
    
}

newTypeString.componentsSeparatedByString(" ")

newTypeString.lowercaseString
newTypeString.uppercaseString
