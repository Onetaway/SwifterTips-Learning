// Playground - noun: a place where people can play

//import UIKit

// 1. Selector
/*func callMe() {
    
}

func callMeWithParam(obj: AnyObject!) {
    
}

let someMethod = Selector("callMe")
let anotherMethod = Selector("callMeWithParam:")

func turnByAngle(theAngle: Int, speed: Float) {
    
}
// 注意加上冒号(:)才是完整的方法名
let method = Selector("turnByAngle:speed:")

func aMethod(externalName internalName: String) {
    
}

let aMethod = Selector("aMethodWithExternalName")


// 2. 柯里化(Currying)
func addTwoNumbers(a: Int)(num: Int) -> Int {
    return a + num
}

let addToFour = addTwoNumbers(4)
let result = addToFour(num: 6)

func greaterThan(comparor: Int)(input: Int) -> Bool {
    return input > comparor
}

let greaterThan10 = greaterThan(10)
greaterThan10(input: 13)
greaterThan10(input: 7)

// 柯里化对 Target - Action 的封装
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}

class Control {
    
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T, action: (T) -> () -> (), controlEvent: ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        
        actions[controlEvent]?.performAction()
    }
}

// 3. 将 protocol 的方法声明为 mutating
protocol Vehicle {
    
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar: Vehicle {
    
    let numberOfWheels = 4
    var color = UIColor.blueColor()
    
    mutating func changeColor() {
        color = UIColor.redColor()
    }
}*/

// 4. Sequence
class ReverseGenerator: GeneratorType {
    
    typealias Element = Int
    
    var counter: Element
    init<T>(array: [T]) {
        self.counter = array.count - 1
    }
    
    init(start: Int) {
        self.counter = start
    }
    
    func next() -> Element? {
        return self.counter < 0 ? nil : counter--
    }
}

/*struct ReverseSequence<T>: SequenceType {
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Generrator = ReverseGenerator
    
    func generate() -> Generator {
        return ReverseGenerator(array: array)
    }
}*/

// 多元组(Tuple)
var num = 42
println(num)
println(num.0.0.0.0.0.0.0.0.0.0.0)

// @autoclosure 和 ??
func logIfTrue(predict: @autoclosure () -> Bool) {
    if predict() {
        println("true")
    }
}

logIfTrue(2 > 1)

var level: Int?
var startLevel = 1
var currentLevel = level ?? startLevel


// 操作符
struct Vector2D {
    var x = 0.0
    var y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

var v1 = Vector2D(x: 1.0, y: 2.0)
var v2 = Vector2D(x: 3.0, y: 4.0)
var v3 = v1 + v2

func -(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x - right.x, y: left.y - right.y)
}
var v4 = v2 - v1

prefix func -(pre: Vector2D) -> Vector2D {
    return Vector2D(x: -pre.x, y: -pre.y)
}
var v5 = -v2


infix operator +* {
    associativity none
    precedence 160
}

func +* (left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}

var v6 = v1 +* v2

// func 的参数修饰, func 参数的默认修饰符是 let
func incrementor(inout variable: Int) {
    ++variable
}

var luckyNumber = 7
incrementor(&luckyNumber)

println(luckyNumber)


// 方法参数名称省略
/*extension NSURL: StringLiteralConvertible {
    
    public class func convertFromStringLiteral(value: String) -> Self {
        
        if let url = self(string: value) {
            return url
        }
        
        fatalError("Bad URL")
    }
    
    public class func convertFromExtendedGraphemeClusterLiteral(value: String) -> Self {
        
        if let url = self(string: value) {
            return url
        }
        
        fatalError("Bad URL")
    }
}

let url: NSURL = "http://swifter.tips"

// 下标
extension Array {
    
    subscript(intput: [Int]) -> Slice<T> {
        get {
            
        }
    }
}*/



// 方法嵌套，可以在方法中定义方法

// 传统做法
/*func appendQuery(var url: String,
                     key: String,
                   value: AnyObject) -> String {
    
    if let dictionary = value as? [String: AnyObject] {
        
        return appendQueryDictionary(url, key, dictionary)
    } else if let array = value as? [AnyObject] {
        return appendQueryArray(url, key, array)
    } else {
        appendQuerySingle(url, key, value)
    }
    
}*/

func methodA(number: Int?) -> Int {
    
    if let n = number {
        return n
    } else if let p = number {
        return p
    } else {
        return 3
    }
}

func appendQueryDictionary(var url: String, key: String, value: [String: AnyObject]) -> String {
    
    var result: String = "a"
    // do something...
    return result
}

func appendQueryArray(var url: String, key: String, value: [AnyObject]) -> String {
    
    var result: String = "bbb"
    // do something
    return result
}

func appendQuerySingle(var url: String, key: String, value: AnyObject) -> String {
    
    var result: String = "ccc"
    // do something
    return result
}

// 方法嵌套做法
/*
func appendQueryNew(var url: String, key: String,value: AnyObject) -> String {
    
    func appendQueryDictionaryNew(var url: String, key: String, value: [String: AnyObject]) -> String {
        
        var result: String?
        // do something
        return result!
    }
    
    func appendQueryArrayNew(var url: String, key: String, value: [AnyObject]) -> String {
        
        var result: String?
        // do something
        return result!
    }
    
    func appendQuerySingleNew(var url: String, key: String, value: AnyObject) -> String {
        
        var result: String?
        // do something
        return result!
    }
    
    if let dictionary = value as? [String: AnyObject] {
        
        return appendQueryDictionaryNew(url, key, dictionary)
    } else if let array = value as? [AnyObject] {
        return appendQueryArrayNew(url, key, array)
    } else {
        appendQuerySingleNew(url, key, value)
    }

}*/

// 实例方法的动态调用
class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
}

let f = MyClass.method
let object = MyClass()
let result = f(object)(1)
println(result)


// 单例

class MyManager {
    
    class var sharedManager: MyManager {
        return sharedInstance
    }
}

private let sharedInstance = MyManager()


// Any 和 AnyObject
let swiftInt = 1
let swiftString = "miao"

var array: [Any] = []
array.append(swiftInt)
array.append(swiftString)
println(array)

// 初始化返回nil
extension Int {
    init?(string: String) {
    if let i = string.toInt() {
        self = i
    } else {
        return nil
    }
    }
}

class AAA {
    class var a: Int?
}























