//
//  Networking.swift
//  TestCoreFramework
//
//  Created by Leo Font on 24/08/2020.
//

import Foundation

protocol NetworkSession {

    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void)
    
}

extension URLSession: NetworkSession {
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: request) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
}

extension TestCoreFramework {

    public class Networking {
        
        public enum NetworkingResult<Value> {
            case success(Value)
            case failure(Error?)
        }
        
        /// Responsible for handling all networking class
        /// -Warning: Must create before any public APIs
        public class Manager {
            
            internal var session: NetworkSession = URLSession.shared
            
            public init() {}
            
            
            /// Call to the live Internet to retrieve data from a specific location
            /// - Parameters:
            ///   - url: The location you want to fetch data from
            ///   - completion: Returns a result object which signifies the status of the reuqest
            public func loadData(from url: URL, completion: @escaping (NetworkingResult<Data>) -> Void)  {
                
                session.get(from: url) { data, error in
                    let result = data.map(NetworkingResult<Data>.success) ?? .failure(error)
                    completion(result)
                }
            }
            
            
            /// Calls to the internet to send data to a specific location
            /// - Warning: Make sure that the URL in question can accept a POST route
            /// - Parameters:
            ///   - url: The location you wish to send data to
            ///   - body: The object you wish to send over the network
            ///   - completionHandler: Returns a result object which signifies the status of the request
            public func sendData<I: Codable>(to url: URL, body: I, completionHandler: @escaping (NetworkingResult<Data>) -> Void) {
                var request = URLRequest(url: url)
                
                do {
                    let httpBody = try JSONEncoder().encode(body)
                    request.httpBody = httpBody
                    request.httpMethod = "POST"
                    session.post(with: request) { data, error in
                        let result = data.map(NetworkingResult<Data>.success) ?? .failure(error)
                        completionHandler(result)
                    }
                    
                } catch let error {
                    return completionHandler(.failure(error))
                }
            }
        }
        
    }
}
