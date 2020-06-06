//
//  CurrentCitiesRouter.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
class CurrentCitiesRouterImp : CurrentCitiesRouter, RouterInterface {
    
    var baseView: BaseView?
    
    
    var delegate : SavedCitiesProtocol?
    
    func goBackToHomeScreen(){
        UIViewController.topViewController()?.dismissMe()
        
    }
    
}







extension CurrentCitiesRouterImp : SavedCitiesProtocol {
    
    func didSelectPlace(with placeData: PlaceEntity) {
        
        delegate?.didSelectPlace(with: placeData)
        
    }
    
}



protocol SavedCitiesProtocol {
    func didSelectPlace(with placeData : PlaceEntity)
}
