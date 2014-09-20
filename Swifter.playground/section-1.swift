// Playground - noun: a place where people can play

import UIKit

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
class ReverseGenerator: GeneratorSequence {
    
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































