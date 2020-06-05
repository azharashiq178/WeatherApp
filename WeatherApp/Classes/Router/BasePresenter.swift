//
//  BasePresenter.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 17/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterBase: class {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    func viewDidLayoutSubviews(_ animated: Bool)
}

extension PresenterBase {
    func viewDidLoad() {
        fatalError("Implmentation pending...")
    }
    
    func viewWillAppear(_ animated: Bool) {
        fatalError("Implmentation pending...")
    }
    
    func viewDidAppear(_ animated: Bool) {
        fatalError("Implmentation pending...")
    }
    
    func viewWillDisappear(_ animated: Bool) {
        fatalError("Implmentation pending...")
    }
    
    func viewDidDisappear(_ animated: Bool) {
        fatalError("Implmentation pending...")
    }
    
    func viewDidLayoutSubviews(_ animated: Bool) {
        fatalError("Implmentation pending...")
    }
}
protocol TablePresenter: PresenterBase {
    func didSelectRow(row: Int, section: Int)
    func getTableData<T>(row: Int, section: Int) -> T?
    func numberOfRowsInSection(section: Int) -> Int
    func numberOfSections() -> Int
}
extension TablePresenter {
    func numberOfSections() -> Int {
        return 1
    }
    
    func didSelectRow(row: Int, section: Int) {
        fatalError("Implmentation pending...")
    }
}




protocol DefaultCellProtocol {
//    func setData(data: DefaultCellData?)
    func setData(data: DefaultCellData?, at indexPath : IndexPath)
}

protocol DefaultCellData {
    static func getIdentifier() -> String
    var didSelectCellHandler: (() -> Void)? { get }
    var identifier: String { get }
}
