//
//	FeelsLike.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class FeelsLike : NSObject, NSCoding, Mappable{

	var day : Float?
	var eve : Float?
	var morn : Float?
	var night : Float?


	class func newInstance(map: Map) -> Mappable?{
		return FeelsLike()
	}
	private override init(){}
    required init?(map: Map){}

    func mapping(map: Map)
	{
		day <- map["day"]
		eve <- map["eve"]
		morn <- map["morn"]
		night <- map["night"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         day = aDecoder.decodeObject(forKey: "day") as? Float
         eve = aDecoder.decodeObject(forKey: "eve") as? Float
         morn = aDecoder.decodeObject(forKey: "morn") as? Float
         night = aDecoder.decodeObject(forKey: "night") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if day != nil{
			aCoder.encodeConditionalObject(day, forKey: "day")
		}
		if eve != nil{
			aCoder.encodeConditionalObject(eve, forKey: "eve")
		}
		if morn != nil{
			aCoder.encodeConditionalObject(morn, forKey: "morn")
		}
		if night != nil{
			aCoder.encodeConditionalObject(night, forKey: "night")
		}

	}

}
