//
//  CurrentCitiesPresenter.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

class CurrentCitiesPresenterImp : NSObject, CurrentCitiesPresenter {
    
    var view: CurrentCitiesViewController?
    
    var interactor: CurrentCitiesInteractorImp?
    
    var router: CurrentCitiesRouterImp?
    
    
    var savedCities = [PlaceEntity]()
    
    func goBackToHomeScreen() {
        router?.goBackToHomeScreen()
    }
    
    
    
    
    
    func displayGooglePlacesController() -> GMSAutocompleteViewController? {
        return interactor?.displayGooglePlacesController()
    }
    
    
    func fetchCurrentCitiesFromLocalStorage() {
     savedCities = LocalStorageManager.shared.getStoredCities()
    }
    
    
}


extension CurrentCitiesPresenterImp : TablePresenter {
    
    func getTableData<T>(row: Int, section: Int) -> T? {
        return savedCities[row] as? T
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return savedCities.count
    }
    
    
    func didSelectRow(row: Int, section: Int) {
        view?.didGetData(with: savedCities[row])
    }
    
}



extension CurrentCitiesPresenterImp : GooglePlacesProtocol {
    
    
    func didFinishDisplaying(with place: GMSPlace) {
        view?.didFinishDisplaying(with: place)
    }
    
    
    func didFinishWithError(with error: Error) {
        view?.didFinishWithError(with: error)
    }
    
}
