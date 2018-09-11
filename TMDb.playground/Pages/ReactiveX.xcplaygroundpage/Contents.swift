//: [Previous](@previous)

@testable import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

enum APIError: Error {
    case invalidKey
    case notAnImage
}

// Secuencias de eventos presentes que acaban
let some = Observable.from(["😀", "😅"])
//let empty: Observable<Int> = Observable.from()
let empty = Observable<Int>.empty() // este observable vacío emite un COMPLETED.

let error = Observable<Int>.error(APIError.invalidKey)  // Secuencia que emite un error
let single = Observable.just("Jorl e norl")    // Secuencia que emite un solo valor y se completa

let helloWorld = Observable<String>.create { observer in
    observer.onNext("Hello,")
    observer.onNext("world!")
    observer.onCompleted()
    
    return Disposables.create()
}


let promise = Observable<String>.create { observer in
    observer.onNext("One, two, three, four and...")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        observer.onNext("Five seconds later")
        observer.onCompleted()
    }
    
    return Disposables.create()
}

// Subscribing to observable. Sustituir some por cualquiera de las otras variables de tipo Observable y ver qué imprime:
promise.subscribe { event in
    switch event {
    case .next(let value):
        print("next(\(value))")
    case .error(let error):
        print("error(\(error))")
    case .completed:
        print("completed")
    }
}
