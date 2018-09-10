//: [Previous](@previous)

import TMDbCore
import RxSwift

let some = Observable.from(["😀", "😅"])
//let empty: Observable<Int> = Observable.from()
let empty = Observable<Int>.empty() // este observable vacío emite un COMPLETED.
