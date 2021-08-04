//
//  CurrentUserInfo.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/04.
//

import UIKit

// MARK: - for game 
struct userGameResult: Codable {
    let correctPercentage: Double
    let timestamp: TimeInterval
    let today: String
    let totalTime: Int
    let tryNum: Int
    
    
}

// MARK: - for test
struct userTestResult: Codable {
    let resultScore: Int
    let riskType: String
    let timestamp: TimeInterval
    let today: String
}
