//
//  StatusCodes.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation



struct StatusCodes {
    
    
    static let responseParamMissingFromServer = -789
    static let authTokenExpired = 401
    static let cancelTask = -999
    
    
    
    static let deliveryAssignedToDriver = 500
    static let bagCollectionAssignedToDriver = 502
    
    
    static let deliveryStarted = 600
    static let deliveryCompleted = 601
    static let bagsCollectedByDriver = 602
}
