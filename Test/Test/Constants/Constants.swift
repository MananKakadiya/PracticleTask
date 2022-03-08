//
//  Constants.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import Foundation


    
    struct DEVICE {
        static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
        static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
        
        static let SCREEN_WIDTH        = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT       = UIScreen.main.bounds.size.height
        static let SCREEN_BOUNDS       = UIScreen.main.bounds
        static let SCREEN_SCALE        = UIScreen.main.scale
    }


