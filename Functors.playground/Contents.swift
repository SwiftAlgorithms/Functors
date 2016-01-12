import Foundation

enum _Optional<Wrapped> {
    case Some(Wrapped)
    case None
}

let optionalGreeting = Optional<String>.Some("Hello World!")
let nothing = Optional<String>.None

func _map<T, U>(a: Optional<T>, _ f: T -> U) -> Optional<U> {
    switch a {
    case .Some(let x): return .Some(f(x))
    case .None: return .None
    }
}

func increment(a: Int) -> Int {
    return a + 1
}

func incrementOptionally(a: Int?) -> Int? {
    if let a = a {
        return a + 1
    }
    else {
        return nil
    }
}

let optionalValue: Int? = 1
let incrementedValue = optionalValue.map(increment)

let anotherIncrementedValue = optionalValue.map(increment) ?? 0

func _map<T, U>(array: Array<T>, _ f: T -> U) -> Array<U> {
    var newArray: [U] = []
    for element in array {
        let newElement = f(element)
        newArray.append(newElement)
    }
    return newArray
}

let mappedArray = _map([1, 3, 7], increment)

let anotherMappedArray = [1, 3, 7].map(increment)


// Operator Overload

infix operator <^> { associativity left }

func <^><T, U>(f: T -> U, a: T?) -> U? {
    return a.map(f)
}

let yetAnotherIncrementedValue = increment <^> optionalValue
