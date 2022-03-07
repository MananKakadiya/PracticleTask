//
//  ServiceResponse.swift
//  Service
//
//  Created by Manan Kakadiya on 07/03/22.
//

import UIKit

class BaseServiceResponse: Decodable {
    var success : Int? = 0
    var alert : Alert?
}
class BaseServiceAcceptRejectResponse: Decodable {
    var success : Int? = 0
    var alert : Alert?
}


/*
 Model class is use to dislay alert message.
 Alert action is to trigger different action on alert message. Ex: redirect to url, close alert messgae etc.
 */
class Alert: NSObject, Decodable {
    var message : String?
    var action: String?
}

enum StatusCode: Int, Decodable {
    case Success = 200
    case PartialResponse = 203
    case NoResponse = 204
    case BadRequest = 400
    case Unauthorized = 401
    case Forbidden = 403
    case NotFound = 404
    case InternalError = 500
    case common
}

/*enum UserType: Int {
    case model
    case photographer
    case client
    case none
}*/


class ServiceError : NSObject, Decodable{
    var statusCode : StatusCode?
    var errorDescription : String?
    var canRetry : Bool?
    
    init(statusCode: StatusCode?, errorDescription : String?, canRetry  :Bool?) {
        self.statusCode = statusCode
        self.errorDescription = errorDescription
        self.canRetry = canRetry
    }
   
    static func createErrorWithDefaultMessage() -> ServiceError{
        return ServiceError.init(statusCode: .common, errorDescription: "Default Error", canRetry: false)
    }
    
    static func createError(statusCode : StatusCode? ,description : String) -> ServiceError{
        return ServiceError.init(statusCode: statusCode, errorDescription: description, canRetry: false)
    }
}


