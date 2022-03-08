//
//  Extensions.swift
//  Test
//
//  Created by Manan Kakadiya on 08/03/22.
//

import Foundation


extension String {
    var isBlank : Bool {
        return (self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
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

