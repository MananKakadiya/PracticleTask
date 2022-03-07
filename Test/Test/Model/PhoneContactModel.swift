//
//  PhoneContactModel.swift
//  Test
//
//  Created by Manan Kakadiya on 08/03/22.
//

import Foundation
import ContactsUI

class PhoneContactModel: NSObject {

    var name: String?
    var phoneNumber: [String] = [String]()

    init(contact: CNContact) {
        name = contact.givenName + " " + contact.familyName
        for phone in contact.phoneNumbers {
            phoneNumber.append(phone.value.stringValue)
        }
        
    }

    override init() {
        super.init()
    }
}
