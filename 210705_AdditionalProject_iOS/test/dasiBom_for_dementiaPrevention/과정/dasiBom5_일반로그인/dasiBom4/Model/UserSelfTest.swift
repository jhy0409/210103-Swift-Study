//
//  UserSelfTest.swift
//  dasiBom4
//
//  Created by inooph on 2021/08/03.
//

import UIKit
import Firebase
/*
 필요한 것
 - [ㅇ] UID
 - [ㅇ] 검사일자
 - [ㅇ] 검사결과
 - [ㅇ] 위험군 여부
 */
let viewModel = QuestionViewModel.shared
let queArr = viewModel.getQueArr()

struct UserSelfTest: Codable { // 현재 미사용
    var uID : String { // 유저아이디
        guard let user = Auth.auth().currentUser?.uid else { return "" }
        return "\(user)"
    }
    
    var today : String { // 검사 일자
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        
        let current_date_string = formatter.string(from: Date())
        return current_date_string
    }
    
    var resultScore : Int { // 검사결과
        var tmpSum = 0
        
        for i in queArr {
            guard let score = i.score
            else { print("\n---> 위치 : UserSelfTest struct \\ 문제 : queArr[i].score값에 nil이 있습니다."); return 0 }
            tmpSum += score
        }
        return tmpSum
    }
    
    var riskType : String { // 위험군
        if resultScore <= 5 {
            return "정상"
        } else {
            return "위험군"
        }
        
    }
}

