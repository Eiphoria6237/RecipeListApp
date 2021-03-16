//
//  Rational.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/16.
//

import Foundation

struct Rational {
    
    static func greatestCommonDivisor(_ a:Int, _ b:Int) -> Int {
        
        if a == 0 { return b }
        
        if b == 0 { return a }
        
        return greatestCommonDivisor(b, a % b)
    }
}


