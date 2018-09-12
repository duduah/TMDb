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

func getUserRandomResponse(completion: @escaping (RandomUserResponse?, Error?) -> Void) {
    // Peticiones a esa sesión
    let task = session.dataTask(with: randomUserApiUrl) { (data, response, error) in
        if let data = data,
            let results = try? decoder.decode(RandomUserResponse.self, from: data) {
            completion(results, nil)
        } else {
            completion(nil, error)
        }
    }
    
    task.resume()
}

func getImage(for url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
    let task = session.dataTask(with: randomUserApiUrl) { (data, response, error) in
        if let data = data, let image = UIImage(data: data) {
            completion(image, nil)
        } else {
            completion(nil, error)
        }
    }
}

func getRandomUserImage(completion: @escaping (UIImage?, Error?) -> Void) {
    getUserRandomResponse { (response, error) in
        guard let response = response else {
            completion(nil, error)
            return
        }
        
        getImage(for: response.results[0].picture.imageURL, completion: completion)
    }
}

getRandomUserImage { (image, error) in
    if let image = image {
        let caca = image
        print(caca)
    } else if let error = error {
        print(error)
    }
}




