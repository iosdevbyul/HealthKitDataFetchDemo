//
//  HealthKitManager.swift
//  HKTest
//
//  Created by PNT001 on 2023/10/13.
//

import Foundation
import HealthKit

class HealthKitManager {
    var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            print("unavailable to use HealthKit")
        }
    }
    
    func requestPermission() {
        //general
        if let healthStore = healthStore {
            var allTypes = Set<HKObjectType>()
            for element in HKQuantityTypeIdentifierTitles {
                allTypes.insert(HKObjectType.quantityType(forIdentifier: element)!)
            }
            
            for element in HKCategoryTypeIdentifierTitles {
                allTypes.insert(HKObjectType.categoryType(forIdentifier: element)!)
            }
            
            for element in HKCharacteristicTypeIdentifierTitles {
                allTypes.insert(HKObjectType.characteristicType(forIdentifier: element)!)
            }
            
            healthStore.requestAuthorization(toShare: nil, read: allTypes) { (success, error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                } else {
                    print("success getting permit")
                }
            }
        }
    }
        
    func fetchData(_ input: HKQuantityTypeIdentifier, completion: @escaping ([String]) -> Void) {
        var returnStr: [String] = []

        guard let healthStore = healthStore else {
            return
        }
        
        guard let sampleType = HKSampleType.quantityType(forIdentifier: input) else {
            fatalError("*** This method should never fail ***")
        }
        //Int(HKObjectQueryNoLimit)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: nil) {
            query, results, error in
            guard let samples = results as? [HKQuantitySample] else {
                // Handle any errors here.
                debugPrint(error?.localizedDescription as Any)
                return
            }
            print("number of samples : ", samples.count)
            for sample in samples {
                returnStr.append("\(sample.quantity)")
            }

            DispatchQueue.main.async {
                completion(returnStr)
            }
            
        }
        healthStore.execute(query)
    }
    
    func fetchData(_ input: HKCategoryTypeIdentifier, completion: @escaping ([String]) -> Void) {
        var returnStr: [String] = []
        
        guard let healthStore = healthStore else {
            return
        }

        guard let sampleType = HKSampleType.categoryType(forIdentifier: input) else {
            fatalError("*** This method should never fail ***")
        }
        //Int(HKObjectQueryNoLimit)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: nil) {
            query, results, error in
            
            guard let samples = results as? [HKQuantitySample] else {
                debugPrint(error?.localizedDescription as Any)
                return
            }
            print("number of samples : ", samples.count)
            for sample in samples {
                returnStr.append("\(sample.quantity)")
            }

            DispatchQueue.main.async {
                completion(returnStr)
            }
        }
        
        healthStore.execute(query)
    }
    
    func fetchData(_ input: HKCharacteristicTypeIdentifier, completion: @escaping (String) -> Void) {
        var returnStr: String = "데이터가 없습니다."
        
        guard let healthStore = healthStore else {
            return
        }
        
        
        do {
            switch input {
            case .activityMoveMode:
                let amm = try healthStore.activityMoveMode().activityMoveMode
                switch amm {
                case .activeEnergy:
                    returnStr = "activeEnergy"
                case .appleMoveTime:
                    returnStr = "appleMoveTime"
                @unknown default:
                    returnStr = "unknown default"
                }
            case .biologicalSex:
                let gender = try healthStore.biologicalSex().biologicalSex
                switch gender {
                case .female:
                    returnStr = "female"
                case .male:
                    returnStr = "male"
                case .notSet:
                    returnStr = "세팅된 gender가 없습니다"
                case .other:
                    returnStr = "제3의 성"
                @unknown default:
                    returnStr = "unknown default"
                }
            case .bloodType:
                let bType = try healthStore.bloodType().bloodType //as HKBloodType
                switch bType {
                case .notSet:
                    returnStr = "세팅된 bloodType이 없습니다"
                case .aPositive:
                    returnStr = "aPositive"
                case .aNegative:
                    returnStr = "aNegative"
                case .bPositive:
                    returnStr = "bPositive"
                case .bNegative:
                    returnStr = "bNegative"
                case .abPositive:
                    returnStr = "abPositive"
                case .abNegative:
                    returnStr = "abNegative"
                case .oPositive:
                    returnStr = "oPositive"
                case .oNegative:
                    returnStr = "oNegative"
                @unknown default:
                    returnStr = "unknown default"
                }
            case .dateOfBirth:
                let dob = try healthStore.dateOfBirthComponents()
                returnStr = "\(dob)"
            case .fitzpatrickSkinType:
                let sType = try healthStore.fitzpatrickSkinType().skinType
                switch sType {
                case .I:
                    returnStr = "I"
                case .II:
                    returnStr = "II"
                case .III:
                    returnStr = "III"
                case .IV:
                    returnStr = "IV"
                case .V:
                    returnStr = "V"
                case .VI:
                    returnStr = "VI"
                case .notSet:
                    returnStr = "세팅된 skinType이 없습니다"
                @unknown default:
                    returnStr = "unknown default"
                }
            case .wheelchairUse:
                let wc = try healthStore.wheelchairUse().wheelchairUse
                switch wc {
                case .no:
                    returnStr = "휠체어를 사용하지 않습니다"
                case .notSet:
                    returnStr = "휠체어를 사용여부가 입력되지 않았습니다"
                case .yes:
                    returnStr = "휠체어를 사용하고 있습니다"
                @unknown default:
                    returnStr = "unknown default"
                }
            default:
                print("")
            }
            completion(returnStr)
        } catch {
            print("error: ", error.localizedDescription)
        }
    }
}
