//
//	WeatherData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WeatherData : NSObject, NSCoding, Mappable{

	var current : Current?
	var daily : [Daily]?
	var hourly : [Hourly]?
	var lat : Float?
	var lon : Float?
	var timezone : String?
	var timezoneOffset : Int?


	class func newInstance(map: Map) -> Mappable?{
		return WeatherData()
	}
	private override init(){}
    required init?(map: Map){}

    func mapping(map: Map)
	{
		current <- map["current"]
		daily <- map["daily"]
		hourly <- map["hourly"]
		lat <- map["lat"]
		lon <- map["lon"]
		timezone <- map["timezone"]
		timezoneOffset <- map["timezone_offset"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        current = aDecoder.decodeObject(forKey: "current") as? Current
        daily = aDecoder.decodeObject(forKey: "daily") as? [Daily]
        hourly = aDecoder.decodeObject(forKey: "hourly") as? [Hourly]
         lat = aDecoder.decodeObject(forKey: "lat") as? Float
         lon = aDecoder.decodeObject(forKey: "lon") as? Float
         timezone = aDecoder.decodeObject(forKey: "timezone") as? String
         timezoneOffset = aDecoder.decodeObject(forKey: "timezone_offset") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if current != nil{
            aCoder.encode(current, forKey: "current")
		}
		if daily != nil{
            aCoder.encode(daily, forKey: "daily")
		}
		if hourly != nil{
            aCoder.encode(hourly, forKey: "hourly")
		}
		if lat != nil{
			aCoder.encodeConditionalObject(lat, forKey: "lat")
		}
		if lon != nil{
			aCoder.encodeConditionalObject(lon, forKey: "lon")
		}
		if timezone != nil{
			aCoder.encodeConditionalObject(timezone, forKey: "timezone")
		}
		if timezoneOffset != nil{
			aCoder.encodeConditionalObject(timezoneOffset, forKey: "timezone_offset")
		}

	}

}
