//: [Previous](@previous)

@testable import TMDbCore
import RxSwift

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

// Subscribing to observable. Sustituir some por cualquiera de las otras variables de tipo Observable y ver qué imprime:
some.subscribe { event in
    switch event {
    case .next(let value):
        print("next(\(value))")
    case .error(let error):
        print("error(\(error))")
    case .completed:
        print("completed")
    }
}
