//
//  Bmi.swift
//  Body Mass Index
//
//  Created by Ivan on 02/04/23.
//

import Foundation
import SwiftUI

struct Bmi: Identifiable {
    let id = UUID()
    let date: Date
    let result: Double
    
    static func calculateScore(weight: Double, height: Double) -> Double {
        return weight * 10_000 / (height * height)
    }
    
    static func getScale(score: Double) -> String {
        switch score {
        case 0 ..< 18.4:
            return "Underweight"
        case 18.5 ..< 24.9:
            return "Normal"
        case 25 ..< 39.9:
            return "Overweight"
        default:
            return "Obese"
        }
    }
    
    static func getScaleColor(score: Double) -> Color {
        switch score {
        case 0 ..< 18.4:
            return .blue
        case 18.5 ..< 24.9:
            return .green
        case 25 ..< 39.9:
            return .orange
        default:
            return .red
        }
    }
}
