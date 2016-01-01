////: Playground - noun: a place where people can play
//
//import UIKit
//
//var str = "Hello, world! from Playground"
//var swiftTeam = 13
//let iOSTeam = 54
//let otherTeams = 48
//let totalTeam = swiftTeam + iOSTeam + otherTeams
//iOSTeam - 3
//
//print(otherTeams)
//
//var score = 100
//score = 200
//score * 2
//swiftTeam = 21
//var sum = 0
//
//for _ in 0...5 {
//    sum += 1
//}
//
//sum
//
//let priceInferred = 10.22
//let priceExplicit: Double = 19.99
//
//var name = "takamichi"
//
//var myName = "my name is \(name)"
//
//let num:Int = 33
//
//Double(num) + priceExplicit
//
//2 == 3
//
//var intArray:[Int] = [1,2,3]
//
//intArray
//var intArray2:[Int] = Array(count: 3, repeatedValue: 9)
//var emptyArray:[String] = []
//var emptyArray1 = [String]()
//
//emptyArray.append("takamichi")
//var array = [1,2,3,"333"]
//
//array.count
//array[2]
//
//
//print(array)
//array.append(emptyArray)
//
//
//array.insert(name, atIndex: 0)
//array.removeAtIndex(1)
//array
//array.removeAll()
//array
//
//
//var numArray:[Int] = [3,1,5,7,4,3,88,]
//var sortedArray = numArray.sort({ $0 < $1 })
//numArray
//var intDictionary = ["a":1, "b":2,"c":3]
//intDictionary["a"]
//
//var emptyDictionary:[String:Int] = [:]
//
//var tuple = (1,3,"takamichi")
//
//tuple.2
//
//func helloWorld(name:String, name2:String, name3:String) -> (String, String) {
//    print("Hello, world!! \(name)")
//    print("come on \(name2)")
//    print("take it easy \(name3)")
//    return (name,name2)
//}
//
//let (name3, name2) = helloWorld("takamichi", name2:"risako", name3:"hohoho")
//
//name3
//name2
//var testInt: Int? = nil
//var testIntNil: Int? = 5
//var intTest: Int!
//intTest = testIntNil
//intTest - 1
//
//testIntNil! - 2
//
//if let tmp = testInt {
//    tmp - 2
//}
//
//
//func nilCheck(testInt: Int?) {
//    guard let tmp = testInt else {
//        print("nil called")
//        return
//    }
//    print(tmp)
//}
//
//
//nilCheck(testInt)
//
//
//var testString = "111"
//var testInt3: Int? = Int(testString)
//if let tmp = testInt3 {
//    print(tmp)
//}
//
//class animal {
//    var name: String = ""
//    var age: Int = 0
//    
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    
//    func greet() {
//        print("Hello, I'm \(name)")
//    }
//}
//
//
//
//
//var human = animal(name: "takamichi", age: 20)
//
//human.name
//human.age
//human.greet()
//
//let switch1 = UISwitch()
//switch1.on = true
//switch1
//
//
//var jsonString = "[100, 399]"
//var jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
//
//do {
//    var array = try NSJSONSerialization.JSONObjectWithData(jsonData,
//        options: NSJSONReadingOptions.MutableContainers ) as! NSArray
//    print(array)
//} catch {
//    print("error")
//}
//
//




