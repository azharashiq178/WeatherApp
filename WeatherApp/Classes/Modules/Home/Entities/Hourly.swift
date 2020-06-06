//
//	Hourly.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Hourly : NSObject, NSCoding, Mappable{

	var clouds : Int?
	var dewPoint : Float?
	var dt : Int?
	var feelsLike : Float?
	var humidity : Int?
	var pressure : Int?
	var rain : Rain?
	var temp : Float?
	var weather : [Weather]?
	var windDeg : Int?
	var windSpeed : Float?


	class func newInstance(map: Map) -> Mappable?{
		return Hourly()
	}
	private override init(){}
    required init?(map: Map){}

    func mapping(map: Map)
	{
		clouds <- map["clouds"]
		dewPoint <- map["dew_point"]
		dt <- map["dt"]
		feelsLike <- map["feels_like"]
		humidity <- map["humidity"]
		pressure <- map["pressure"]
		rain <- map["rain"]
		temp <- map["temp"]
		weather <- map["weather"]
		windDeg <- map["wind_deg"]
		windSpeed <- map["wind_speed"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         clouds = aDecoder.decodeObject(forKey: "clouds") as? Int
         dewPoint = aDecoder.decodeObject(forKey: "dew_point") as? Float
         dt = aDecoder.decodeObject(forKey: "dt") as? Int
         feelsLike = aDecoder.decodeObject(forKey: "feels_like") as? Float
         humidity = aDecoder.decodeObject(forKey: "humidity") as? Int
         pressure = aDecoder.decodeObject(forKey: "pressure") as? Int
        rain = aDecoder.decodeObject(forKey: "rain") as? Rain
         temp = aDecoder.decodeObject(forKey: "temp") as? Float
        weather = aDecoder.decodeObject(forKey: "weather") as? [Weather]
         windDeg = aDecoder.decodeObject(forKey: "wind_deg") as? Int
         windSpeed = aDecoder.decodeObject(forKey: "wind_speed") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if clouds != nil{
			aCoder.encodeConditionalObject(clouds, forKey: "clouds")
		}
		if dewPoint != nil{
			aCoder.encodeConditionalObject(dewPoint, forKey: "dew_point")
		}
		if dt != nil{
			aCoder.encodeConditionalObject(dt, forKey: "dt")
		}
		if feelsLike != nil{
			aCoder.encodeConditionalObject(feelsLike, forKey: "feels_like")
		}
		if humidity != nil{
			aCoder.encodeConditionalObject(humidity, forKey: "humidity")
		}
		if pressure != nil{
			aCoder.encodeConditionalObject(pressure, forKey: "pressure")
		}
		if rain != nil{
            aCoder.encode(rain, forKey: "rain")
		}
		if temp != nil{
			aCoder.encodeConditionalObject(temp, forKey: "temp")
		}
		if weather != nil{
            aCoder.encode(weather, forKey: "weather")
		}
		if windDeg != nil{
			aCoder.encodeConditionalObject(windDeg, forKey: "wind_deg")
		}
		if windSpeed != nil{
			aCoder.encodeConditionalObject(windSpeed, forKey: "wind_speed")
		}

	}

}
