//
//  WaterIntake.swift
//  water-tracker
//
//  Created by Anika Morris on 11/29/20.
//

import Foundation

struct WaterIntake {
    var weight: Double
    var minutesOfExercise: Double
    
    // calculates ounces of water needed based on weight and how much exercise is planned
    func calculate() -> Double {
        return weight * 0.67 + minutesOfExercise * 2.5
    }
}
