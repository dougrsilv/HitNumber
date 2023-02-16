//
//  HitNumberViewModel.swift
//  HitNumber
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import Foundation

class HitNumberViewModel {
    
    func numberDaSorte() -> String {
        return String(Int.random(in: 0...10))
    }
    
    func numberAcert(num: String, numberSorte: String) -> Bool {
        return num == numberSorte
    }
}
