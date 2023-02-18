//
//  HitNumberViewModel.swift
//  HitNumber
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import Foundation

class HitNumberViewModel {
    
    func luckyNumber() -> String {
        return String(Int.random(in: 1...10))
    }
    
    func checkValue(num: String, numberSorte: String, cout: Int) -> String {
        if num == "" || Int(num) ?? 0 <= 0 || Int(num) ?? 0 > 10 {
            return "Invalido"
        } else if num == numberSorte {
            return "Acertou"
        } else if num != numberSorte && cout < 2 {
            return "Errou"
        } else if cout == 2 {
            return "Passou"
        }
        return ""
    }
}
