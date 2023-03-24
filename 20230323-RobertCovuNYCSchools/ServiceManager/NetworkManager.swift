//
//  NetworkManager.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/22/23.
//

import Foundation

protocol DataFetcher {
    func fetchHighSchoolList(url: URL?, completion: @escaping (Result<School, Error>) -> Void)
   
}

class NetworkManager {
    
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.ephemeral
        let result = URLSession(configuration: configuration)
        return result
    }()
    
    init() {
        
    }
}

extension NetworkManager: DataFetcher {
    func fetchHighSchoolList(url: URL?, completion: @escaping (Result<School, Error>) -> Void){
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        let request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        self.session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }

            do {
                let model = try JSONDecoder().decode(School.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
        
    }
}

enum NetworkError: Error {
    case badURL
    case badData
    case badServerResponse(Int)
    case decodeError(String)
    case generalError(Error)
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Bad URL, couldn't be converted to String", comment: "Bad URL")
        case .badData:
            return NSLocalizedString("Bad Data, the data is corrupted or missing", comment: "Bad Data")
        case .badServerResponse(let statusCode):
            return NSLocalizedString("The network was unsuccessful, error code received:  \(statusCode)", comment: "Bad Server Response")
        case .decodeError(let message):
            return NSLocalizedString("Decoding failed. In the model object something is missing or incorrect. Message: \(message)", comment: "Decode Error")
        case .generalError(let err):
            return NSLocalizedString("Unknone error. Logged info: \(err)", comment: "General Error")
        }
    }
    
}
