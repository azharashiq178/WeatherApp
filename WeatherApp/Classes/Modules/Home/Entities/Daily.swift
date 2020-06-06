//
//	Daily.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Daily : NSObject, NSCoding, Mappable, DefaultCellData{
    var identifier: String = ""
    

	var clouds : Int?
	var dewPoint : Float?
	var dt : Int?
	var feelsLike : FeelsLike?
	var humidity : Int?
	var pressure : Int?
	var rain : Float?
	var sunrise : Int?
	var sunset : Int?
	var temp : Temp?
	var uvi : Float?
	var weather : [Weather]?
	var windDeg : Int?
	var windSpeed : Float?


	class func newInstance(map: Map) -> Mappable?{
		return Daily()
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
		sunrise <- map["sunrise"]
		sunset <- map["sunset"]
		temp <- map["temp"]
		uvi <- map["uvi"]
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
        feelsLike = aDecoder.decodeObject(forKey: "feels_like") as? FeelsLike
         humidity = aDecoder.decodeObject(forKey: "humidity") as? Int
         pressure = aDecoder.decodeObject(forKey: "pressure") as? Int
         rain = aDecoder.decodeObject(forKey: "rain") as? Float
         sunrise = aDecoder.decodeObject(forKey: "sunrise") as? Int
         sunset = aDecoder.decodeObject(forKey: "sunset") as? Int
        temp = aDecoder.decodeObject(forKey: "temp") as? Temp
         uvi = aDecoder.decodeObject(forKey: "uvi") as? Float
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
            aCoder.encode(feelsLike, forKey: "feels_like")
		}
		if humidity != nil{
			aCoder.encodeConditionalObject(humidity, forKey: "humidity")
		}
		if pressure != nil{
			aCoder.encodeConditionalObject(pressure, forKey: "pressure")
		}
		if rain != nil{
			aCoder.encodeConditionalObject(rain, forKey: "rain")
		}
		if sunrise != nil{
			aCoder.encodeConditionalObject(sunrise, forKey: "sunrise")
		}
		if sunset != nil{
			aCoder.encodeConditionalObject(sunset, forKey: "sunset")
		}
		if temp != nil{
            aCoder.encode(temp, forKey: "temp")
		}
		if uvi != nil{
			aCoder.encodeConditionalObject(uvi, forKey: "uvi")
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
    
    
    static func getIdentifier() -> String {
        return ""
    }
    
    var didSelectCellHandler: (() -> Void)? = nil

}


