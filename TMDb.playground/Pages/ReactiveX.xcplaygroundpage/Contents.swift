//: [Previous](@previous)

@testable import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let randomUserApiUrl = URL(string: "https://randomuser.me/api")!
let session = URLSession(configuration: .default)
let decoder = JSONDecoder()

// Peticiones a esa sesión
let task = session.dataTask(with: randomUserApiUrl) { (data, response, error) in
    let result = String(data: data!, encoding: .utf8)
    print(result)
}

task.resume()

