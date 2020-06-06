//
//  HomeRouterImp.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation


class HomeRouterImp: HomeRouter,RouterInterface {
    
    var baseView: BaseView?
    var delegate : SavedCitiesProtocol?
    
    func showCurrentCitiesScreen() {
        
        if let controller = CurrentCitiesModule().buildDefault() as? CurrentCitiesViewController {
            
            controller.modalPresentationStyle = .fullScreen
            controller.delegate = self
            show(controller, with: .present, animated: true)
        }
        
    }
    
}




extension HomeRouterImp : SavedCitiesProtocol {
    
    func didSelectPlace(with placeData: PlaceEntity) {
//        print("I am here with data \(placeData)")
        delegate?.didSelectPlace(with: placeData)
    }
    
}



