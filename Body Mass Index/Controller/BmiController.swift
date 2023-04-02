//
//  BmiController.swift
//  Body Mass Index
//
//  Created by Ivan on 02/04/23.
//

import Foundation
import SwiftUI
import CoreData

class BmiController: ObservableObject {
    let container = NSPersistentContainer(name: "BmiModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load date: \(error.localizedDescription)")
            }
        }
    }
    
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
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("We could not save the data")
        }
    }
    
    func addBmi(weight: Double, height: Double, context: NSManagedObjectContext) {
        let bmi = BodyMassIndex(context: context)
        bmi.id = UUID()
        bmi.result = BmiController.calculateScore(
            weight: weight,
            height: height
        )
        bmi.date = Date()
        
        save(context: context)
    }
}
