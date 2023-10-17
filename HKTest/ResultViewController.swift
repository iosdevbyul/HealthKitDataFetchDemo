//
//  ResultViewController.swift
//  HKTest
//
//  Created by PNT001 on 2023/10/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultLabel = UILabel()
    var received: String = "" {
        didSet {
            resultLabel.text = received
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        setLabel()
    }
    
    private func setLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(resultLabel)
        resultLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        resultLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        resultLabel.numberOfLines = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        print("ResultVC deinit")
    }

}
