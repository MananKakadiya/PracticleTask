//
//  NetworkClient.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import Foundation

class NetworkClient : NSObject {
    static let shared = NetworkClient()
    
    
    func callGETApi(url: String, complitation : @escaping (Data)->()){
        var request = URLRequest(url: URL(string: "\(url)")!)
           request.httpMethod = "GET"
           let session = URLSession.shared

           session.dataTask(with: request) {data, response, err in
               if err == nil{
                   guard let data = data else {
                       return
                   }
                   complitation(data)
               }
           }.resume()
    }
    
    

}


extension NSObject {
    func Decode<T: Decodable>(modelClass: T.Type, from inputData: Data) -> T?{
        do {
            let resultData = try JSONDecoder().decode(modelClass.self, from: inputData)
            return resultData
        } catch let message {
            print("JSON serialization error:" + "\(message)")
            return nil
        }
    }
}
