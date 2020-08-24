//
//  Networking.swift
//  TestCoreFramework
//
//  Created by Leo Font on 24/08/2020.
//

import Foundation

extension TestCoreFramework {

    public class Networking {
        
        public enum NetworkingResult<Value> {
            case success(Value)
            case failure(Error?)
        }
        
        /// Responsible for handling all networking class
        /// -Warning: Must create before any public APIs
        public class Manager {
            
            private let session = URLSession.shared
            
            public init() {}
            
            public func loadData(from url: URL, completion: @escaping (NetworkingResult<Data>) -> Void)  {
                
                let task = session.dataTask(with: url) { data, response, error in
                    let result = data.map(NetworkingResult<Data>.success) ?? .failure(error)
                    completion(result)
                }
                task.resume()
                
                
            }
        }
        
    }
}
