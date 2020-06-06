//
//	Rain.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Rain : NSObject, NSCoding, Mappable{

	var oneH : Float?


	class func newInstance(map: Map) -> Mappable?{
		return Rain()
	}
	private override init(){}
    required init?(map: Map){}

    func mapping(map: Map)
	{
		oneH <- map["1h"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         oneH = aDecoder.decodeObject(forKey: "1h") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if oneH != nil{
			aCoder.encodeConditionalObject(oneH, forKey: "1h")
		}

	}

}
