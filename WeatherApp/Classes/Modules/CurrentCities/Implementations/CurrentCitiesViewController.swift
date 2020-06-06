//
//  CurrentCitiesView.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation


class CurrentCitiesViewController: UIViewController, CurrentCitiesView {
    
    
    
    
    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    
    var presenter: CurrentCitiesPresenterImp?
    
    var delegate : SavedCitiesProtocol?
    
    // MARK: - IBOutlets
    
    
    
    @IBOutlet weak var tableView : UITableView!
    
    
    // MARK: - Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        viewConfiguration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.fetchCurrentCitiesFromLocalStorage()
        
        tableView.reloadData()
        
    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
    
    
    // MARK: - Functions
    
    
    
    func viewConfiguration() {
        
        
        
        
    }
    
    func didGetData(with placeData : PlaceEntity) {
        self.dismissMe()
        delegate?.didSelectPlace(with: placeData)
    }
    
    
    // MARK: - IBActions
    
    
    
    @IBAction func dismissAction(_ sender : UIButton) {
        
        
        presenter?.goBackToHomeScreen()
        
    }
    
    
    @IBAction func addNewCity(_ sender : UIButton) {
        
        if let controller = presenter?.displayGooglePlacesController() {
            present(controller, animated: true, completion: nil)
        }
        
    }

    
}




extension CurrentCitiesViewController : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) else { return UITableViewCell() }
        
        guard let data : PlaceEntity = presenter?.getTableData(row: indexPath.row, section: indexPath.section) else { return UITableViewCell() }
        
        cell.textLabel?.text = data.placeName
        
        return cell
    }
    
}



extension CurrentCitiesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(row: indexPath.row, section: indexPath.section)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Cities"
    }
}




extension CurrentCitiesViewController : GooglePlacesProtocol{
    
    
    func didFinishDisplaying(with place: GMSPlace) {
        
        print("Place is \(place)")
        
    }
    
    func didFinishWithError(with error: Error) {
        
        Utility.showAlert(error)
        
    }
    
    
}
