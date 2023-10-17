//
//  ViewController.swift
//  HKTest
//
//  Created by PNT001 on 2023/10/13.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let hkManager = HealthKitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(HKQuantityTypeIdentifier.basalBodyTemperature.rawValue)
        setTableView()
        hkManager.requestPermission()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HKQuantityTypeIdentifierTitles.count + HKCategoryTypeIdentifierTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row < HKQuantityTypeIdentifierTitles.count {
            let text = HKQuantityTypeIdentifierTitles[indexPath.row].rawValue
            let new = text.replacingOccurrences(of: "HKQuantityTypeIdentifier", with: "")
            cell.textLabel?.text = new
        } else {
            let text = HKCategoryTypeIdentifierTitles[indexPath.row - HKQuantityTypeIdentifierTitles.count].rawValue
            let new = text.replacingOccurrences(of: "HKCategoryTypeIdentifier", with: "")
            cell.textLabel?.text = new
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultVC = ResultViewController()
        if indexPath.row < HKQuantityTypeIdentifierTitles.count {
            hkManager.fetchData(HKQuantityTypeIdentifierTitles[indexPath.row])
        } else {
            hkManager.fetchData(HKCategoryTypeIdentifierTitles[indexPath.row - HKQuantityTypeIdentifierTitles.count])
        }
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
}
