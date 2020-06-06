//
//  CurrentCitiesInteractor.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

class CurrentCitiesInteractorImp : NSObject,CurrentCitiesInteractor{
    
    var presenter: CurrentCitiesPresenterImp?
    
    
    
    
    func displayGooglePlacesController() -> GMSAutocompleteViewController {
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
            UInt(GMSPlaceField.placeID.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))!
        autocompleteController.placeFields = fields
        
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.type = .city
        autocompleteController.autocompleteFilter = filter
        autocompleteController.modalPresentationStyle = .fullScreen
        return autocompleteController
        
        
    }
    
    
}






extension CurrentCitiesInteractorImp : GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        
        let placeToStore = PlaceEntity()
        placeToStore.placeName = place.name
        placeToStore.latitude = Float(place.coordinate.latitude)
        placeToStore.longitude = Float(place.coordinate.longitude)
        
        LocalStorageManager.shared.insertCityInDefaults(with: placeToStore)
        
        viewController.dismissMe()
        presenter?.didFinishDisplaying(with: place)
        
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        presenter?.didFinishWithError(with: error)
    }
    
    func wasCancelled(_ viewController:
        GMSAutocompleteViewController) {
        viewController.dismissMe()
        
    }
//    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//
//    }
//    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//
//    }
}
