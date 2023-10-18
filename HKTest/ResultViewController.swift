//
//  ResultViewController.swift
//  HKTest
//
//  Created by PNT001 on 2023/10/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultLabel = UILabel()
    var received: [String] = [] {
        didSet {
            if received.count == 0 {
                resultLabel.text = "데이터가 없습니다"
            } else {
                var str = ""
                for receive in received {
                    str = str + "\n" + receive
                }
                resultLabel.text = str
            }
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
        resultLabel.textAlignment = .center
    }

    deinit {
        print("ResultVC deinit")
    }

}
