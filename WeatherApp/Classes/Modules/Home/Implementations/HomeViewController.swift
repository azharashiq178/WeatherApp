//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeView {
    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    var presenter: HomePresenterImp?
    
    
    
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    @IBOutlet weak var cityNameLabel : UILabel!
    @IBOutlet weak var currentTemperatureLabel : UILabel!
    @IBOutlet weak var maxTemperatureLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    
    
    
    @IBOutlet weak var weatherImageView : UIImageView!
    
    
    // MARK: - Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        viewConfiguration()
    }
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
    
    
    // MARK: - Functions
    
    
    
    func viewConfiguration() {
        
        collectionView.registerNibFrom(cellClass: DailyWeatherCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        
    }
    
    func reloadData() {
        
        collectionView.reloadData()
        
    }
    
    func updateCityName(with name : String) {
        
        cityNameLabel.text = name
    }
    
    func updateHomeScreenContent(with currentTemperature : String, currentDate : String, temperatureRange : String) {
        
        currentTemperatureLabel.text = currentTemperature
        dateLabel.text = currentDate
        maxTemperatureLabel.text = temperatureRange
    }
    
    func updateWeatherImage(with image : UIImage) {
        weatherImageView.image = image
    }
    
    // MARK: - IBActions
    
    
    
}



extension HomeViewController : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let data : DefaultCellData = presenter?.getTableData(row: indexPath.item, section: indexPath.section) else { return UICollectionViewCell() }
        
        guard let cell : DailyWeatherCell = collectionView.dequeue(cell: DailyWeatherCell.self, indexPath: indexPath) else { return UICollectionViewCell() }
        
        cell.setData(data: data, at: indexPath)
        
        
        
        
        return cell
    }
    
}




extension HomeViewController : UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        presenter?.didSelectRow(row: indexPath.item, section: indexPath.section)
        
    }
    
    
}


extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 50, height: 180)
    }
}
