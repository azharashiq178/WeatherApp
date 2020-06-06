//
//  CurrentCitiesModule.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
class CurrentCitiesModule {
    
    func buildDefault() -> UIViewController? {
        
        guard let view = R.storyboard.main.currentCitiesViewController() else { return nil }
        
        let interactor = CurrentCitiesInteractorImp()
        let presenter = CurrentCitiesPresenterImp()
        let router = CurrentCitiesRouterImp()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.baseView = view
        interactor.presenter = presenter
        
        
        return view
    }
}
