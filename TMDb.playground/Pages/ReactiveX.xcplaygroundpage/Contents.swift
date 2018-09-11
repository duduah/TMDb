//: [Previous](@previous)

import TMDbCore
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
