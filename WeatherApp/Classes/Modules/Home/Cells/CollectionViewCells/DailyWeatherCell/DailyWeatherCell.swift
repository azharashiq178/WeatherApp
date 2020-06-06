//
//  DailyWeatherCell.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit
import AlamofireImage

class DailyWeatherCell: UICollectionViewCell {

    
    
    
    // MARK:- IBOutlets
    
    
    
    @IBOutlet weak var dayLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var weatherImageView : UIImageView!
    @IBOutlet weak var maxTemperatureLabel : UILabel!
    @IBOutlet weak var minTemperatureLabel : UILabel!
    
    
    
    // MARK:- Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
    
    
    
    // MARK:- Functions
    
    
    
    

}





extension DailyWeatherCell : DefaultCellProtocol {
    
    
    
    func setData(data: DefaultCellData?, at indexPath: IndexPath) {
        
        
        guard let cellData = data as? Daily else { return }
        
        if let temperature = cellData.temp {
            maxTemperatureLabel.text = convertKelvinToCelcius(with: temperature.max) + "°"
            minTemperatureLabel.text = convertKelvinToCelcius(with: temperature.min) + "°"
        }
        
        if let unixDate = cellData.dt {
            
            let date = Date.init(timeIntervalSince1970: TimeInterval(unixDate))
            
            if indexPath.row == 0 {
                dayLabel.text = "Today"
            }
            else {
                dayLabel.text = date.dayOfWeek()
            }
            
            dateLabel.text = date.stringFromDate("dd/MM")
            
        }
        
        
        if let weatherList = cellData.weather, weatherList.count != 0 {
            let urlStr = "http://openweathermap.org/img/wn/\(weatherList[0].icon!)@4x.png"
            if let url = URL(string: urlStr) {
                weatherImageView.af.setImage(withURL: url, cacheKey: urlStr, placeholderImage: nil, serializer: .none, filter: .none, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0), runImageTransitionIfCached: true) { (imageData) in
                    
                }
            }
        }
        
    }
    
    
}

func convertKelvinToCelcius(with temperature : Float?) -> String {
    
    
    if let kelvinTemperature = temperature {
        let celciusTemp = kelvinTemperature - 273.15
        return String.init(format: "%.0f", celciusTemp)
    }
    return "0"
    
    
}

