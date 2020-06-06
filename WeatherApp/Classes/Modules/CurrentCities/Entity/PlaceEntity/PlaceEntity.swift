//
//  PlaceEntity.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 07/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit


class PlaceEntity: NSObject, NSCoding, DefaultCellData{
    
    var identifier: String = ""
    
    var didSelectCellHandler: (() -> Void)?
    

    var placeName : String?
    var latitude : Float?
    var longitude : Float?


    override init() {
        super.init()
    }

    
    static func getIdentifier() -> String {
        return ""
    }
    
    
    @objc required init(coder aDecoder: NSCoder)
    {
        placeName = aDecoder.decodeObject(forKey: "placeName") as? String
         latitude = aDecoder.decodeObject(forKey: "lat") as? Float
         longitude = aDecoder.decodeObject(forKey: "lon") as? Float
         

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if placeName != nil{
            aCoder.encode(placeName, forKey: "placeName")
        }
        if latitude != nil{
            aCoder.encodeConditionalObject(latitude, forKey: "lat")
        }
        if longitude != nil{
            aCoder.encodeConditionalObject(longitude, forKey: "lon")
        }
        

    }

}
