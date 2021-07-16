//
//  Food.swift
//  simpleTimerFor_AirFryer
//
//  Created by inooph on 2021/07/15.
//
import Foundation
import UIKit

struct Food: Codable, Equatable {
    let foodId: Int
    var ondo: Int
    var hour: Int
    var min: Int
    
    var turningFood: Int
    var foodType: String
    var isTimerOn: Bool = false // 생성시에는 타이머 꺼진게 기본값
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        // [] 동등조건 추가
        return lhs.foodId == rhs.foodId
    }
    
//    init(ondo: Int, hour: Int, min: Int, turn: Int, foodType: String, isTimerOn: Bool) {
//        self.foodId = FoodManager.lastId // ?
//        self.ondo = ondo
//        self.hour = hour
//        self.min = min
//        turningFood = turn
//        self.foodType = foodType
//        self.isTimerOn = isTimerOn
//    }
    
    init(foodId: Int, ondo: Int, hour: Int, min: Int, turn: Int, foodType: String, isTimerOn: Bool) {
        self.foodId = foodId
        self.ondo = ondo
        self.hour = hour
        self.min = min
        turningFood = turn
        self.foodType = foodType
        self.isTimerOn = isTimerOn
    }
    
    mutating func update(ondo: Int, hour: Int, min: Int, turn: Int, foodType: String, isTimerOn: Bool) {
        self.ondo = ondo
        self.hour = hour
        self.min = min
        turningFood = turn
        self.foodType = foodType
        self.isTimerOn = isTimerOn
    }
}

class FoodManager {
    static let shared = FoodManager()
    static var lastId: Int = 0
    
    var foods: [Food] = []
    
    func createFood(ondo: Int, hour: Int, min: Int, turn: Int, foodType: String, isTimerOn: Bool) -> Food {
        let nextId = FoodManager.lastId + 1
        FoodManager.lastId = nextId
        return Food(foodId: nextId, ondo: ondo, hour: hour, min: min,
                    turn: turn, foodType: foodType, isTimerOn: isTimerOn)
    }
    
    func addFood(_ food: Food) {
        foods.append(food)
        // saveFood()
    }
    
    func deleteFood(_ food: Food) {
        if let index = foods.firstIndex(of: food) {
            foods.remove(at: index)
        }
        // saveFood()
    }
    
    func updateFood(_ food: Food) {
        guard let index = foods.firstIndex(of: food) else { return }
        
        foods[index].update(ondo: food.ondo, hour: food.hour, min: food.min, turn: food.turningFood, foodType: food.foodType, isTimerOn: food.isTimerOn)
        // saveFood()
    }
    
    func saveFood() {
        Storage.store(foods, to: .documents, as: "foods.json")
    }
    
    func retrieveFood() {
        foods = Storage.retrive("foods.json", from: .documents, as: [Food].self) ?? []
        
        let lastId = foods.last?.foodId ?? 0
        FoodManager.lastId = lastId
    }
}

class FoodViewModel {
    private let manager = FoodManager.shared
    
    var foods: [Food] {
        return manager.foods
    }
    
    func addFood(_ food: Food) {
        manager.addFood(food)
    }
    
    func deleteFood(_ food: Food) {
        manager.deleteFood(food)
    }
    
    func updateFood(_ food: Food) {
        manager.updateFood(food)
    }
    
    func loadFoods() {
        manager.retrieveFood()
    }
}
