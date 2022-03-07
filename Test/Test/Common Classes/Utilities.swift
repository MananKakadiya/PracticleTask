//
//  Utilities.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import Foundation

class Utilities : NSObject {
    class func showAlertWithMessage(title : String, message : String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil));
            UIViewController.current().present(alert, animated: true, completion: nil)
        }
    }
}
