//: [Previous](@previous)

@testable import TMDbCore
import RxSwift
import RxCocoa

import PlaygroundSupport


PlaygroundPage.current.needsIndefiniteExecution = true

struct RandomUserResponse: Decodable {
    struct User: Decodable {
        struct Name: Decodable {
            let title: String
            let first: String
            let last: String
        }
        
        struct Picture: Decodable {
            let imageURL: URL
            
            private enum CodingKeys: String, CodingKey {
                case imageURL = "large"
            }
        }
        
        let name: Name
        let picture: Picture
    }
    let results: [User]
}

let randomUserApiUrl = URL(string: "https://randomuser.me/api")!
let session = URLSession(configuration: .default)
let decoder = JSONDecoder()

let randomUserImage = session.rx.data(request: URLRequest(url: randomUserApiUrl))
    .map { try decoder.decode(RandomUserResponse.self, from: $0) }
    .flatMap { response -> Observable<Data> in
        let request = URLRequest(url: response.results[0].picture.imageURL)
        return session.rx.data(request: request)
    }
    .map { UIImage(data: $0) ?? UIImage() }

let disposable = randomUserImage.subscribe(onNext: { image in
    let jorl = image
}, onError: { error in
    let caca = error
    print("error: \(caca)")
})

// disposable.dispose() // al ejecutar esto se ejecuta lo indicado en data(with url), en return Disposables.create{...}






