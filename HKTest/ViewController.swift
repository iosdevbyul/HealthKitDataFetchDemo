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
        return HKQuantityTypeIdentifierTitles.count + HKCategoryTypeIdentifierTitles.count + HKCharacteristicTypeIdentifierTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row < HKQuantityTypeIdentifierTitles.count {
            let text = HKQuantityTypeIdentifierTitles[indexPath.row].rawValue
            let new = text.replacingOccurrences(of: "HKQuantityTypeIdentifier", with: "")
            cell.textLabel?.text = new
        } else if indexPath.row < HKQuantityTypeIdentifierTitles.count + HKCategoryTypeIdentifierTitles.count {
            let text = HKCategoryTypeIdentifierTitles[indexPath.row - HKQuantityTypeIdentifierTitles.count].rawValue
            let new = text.replacingOccurrences(of: "HKCategoryTypeIdentifier", with: "")
            cell.textLabel?.text = new
        } else {
            let text = HKCharacteristicTypeIdentifierTitles[indexPath.row - HKQuantityTypeIdentifierTitles.count - HKCategoryTypeIdentifierTitles.count].rawValue
            let new = text.replacingOccurrences(of: "HKCharacteristicTypeIdentifier", with: "")
            cell.textLabel?.text = new
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultVC = ResultViewController()
        if indexPath.row < HKQuantityTypeIdentifierTitles.count {
            hkManager.fetchData(HKQuantityTypeIdentifierTitles[indexPath.row]) { res in
                resultVC.received = res
            }
        } else if indexPath.row < HKQuantityTypeIdentifierTitles.count + HKCategoryTypeIdentifierTitles.count {
            hkManager.fetchData(HKCategoryTypeIdentifierTitles[indexPath.row - HKQuantityTypeIdentifierTitles.count]) { res in
                resultVC.received = res
            }
        } else {
            hkManager.fetchData(HKCharacteristicTypeIdentifierTitles[indexPath.row - HKQuantityTypeIdentifierTitles.count - HKCategoryTypeIdentifierTitles.count]) { res in
                print(res)
                resultVC.received = [res]
            }
        }
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
}
