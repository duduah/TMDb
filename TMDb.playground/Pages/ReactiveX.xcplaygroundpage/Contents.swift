//: [Previous](@previous)

@testable import TMDbCore
import RxSwift
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

func data(with url: URL) -> Observable<Data> {
    return Observable.create { observer in
        let task = session.dataTask(with: randomUserApiUrl) { data, response, error in
            if let error = error {
                observer.onError(error)
            } else {
                observer.onNext(data ?? Data())
                observer.onCompleted()
            }
        }
        
        task.resume()
        return Disposables.create {
            task.cancel()
        }
    }
}

let randomUserImage = data(with: randomUserApiUrl)
    .map { data -> RandomUserResponse in
        try decoder.decode(RandomUserResponse.self, from: data)
    }
    .flatMap { response -> Observable<Data> in
        data(with: response.results[0].picture.imageURL)
    }
    .map { data -> UIImage in
        UIImage(data: data) ?? UIImage()
    }

let disposable = randomUserImage.subscribe(onNext: { image in
    let pleaseWork = image
}, onError: { error in
    let caca = error
    print("error: \(caca)")
})

// disposable.dispose() // al ejecutar esto se ejecuta lo indicado en data(with url), en return Disposables.create{...}






