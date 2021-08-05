//
//  UserGameResults.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/03.
//

import UIKit
import Foundation
import Firebase

struct UserGameResults: Codable { // 현재 미사용
    var uID : String { // 유저아이디
        guard let user = Auth.auth().currentUser?.uid else { return "" }
        return "\(user)"
    }
    
    var today : String { // 게임 시작날짜
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"

        let current_date_string = formatter.string(from: Date())
        return current_date_string
    }
    
    var tryNum = 0 // 시도회차
    var startTime = Date() // 게임시작 시간
    var endTime: Date // 정답 맞추는 시점 시간
    
    var totalTime: Int { // 소요시간 계산
        let sTimeToDouble = startTime.timeIntervalSince1970
        let eTimeToDouble = endTime.timeIntervalSince1970
        return Int(eTimeToDouble - sTimeToDouble)
    }
    
    var correctPercentage: Double {
        return Double((1/tryNum * 100) / 100)
    }
    /*
     있어야할 것
     - [ㅇ] 날짜별
     
     - 유저 uid
     - [ㅇ] 전체시도 수(그날 게임했던 수)
     - [ㅇ] 버튼이 새로 생성~맞출때까지 시도회수 -> [] 평균
     - [ㅇ] 걸린시간 -> [] 평균
     - [ㅇ] 정답확률 -> [] 평균
     */
}
