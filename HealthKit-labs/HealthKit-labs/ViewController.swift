//
//  ViewController.swift
//  HealthKit-labs
//
//  Created by 송영모 on 2023/04/16.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    let healthStore = HKHealthStore()
    
    let read = Set([
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .stepCount)!,
        HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!,
        HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!,
        HKSampleType.workoutType(),
        HKSampleType.audiogramSampleType(),
        HKObjectType.quantityType(forIdentifier: .appleMoveTime)!,
        HKCharacteristicType(.bloodType)
    ])
    let share = Set([
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .stepCount)!,
        HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!,
        HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!,
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        requestAuth()
    }
    
    func requestAuth() {
        self.healthStore.requestAuthorization(toShare: share, read: read) { (success, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                if success {
                    print("권한 허락 성공")
                } else {
                    print("권한 허락 실패")
                }
            }
        }
    }
}

