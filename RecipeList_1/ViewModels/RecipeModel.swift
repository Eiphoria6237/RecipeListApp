//
//  RecipeModel.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/15.
//

import Foundation

class RecipeModel:ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            //get a single serving size by * denominator by the recipe servings
            denominator *= recipeServings
            
            //get tardet portion by * numerator by target servings
            numerator *= targetServings
            
            //reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //get the whole portion if numerator > denominator
            if numerator >= denominator {
                //calculated the whole portions
                wholePortions = numerator / denominator
                //calculated the remainder
                numerator = numerator % denominator
                //assign to portion string
                portion += String(wholePortions)
            }
            //express the  remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }

        }
        if var unit = ingredient.unit {
            
            
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil  && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
                return portion
    }
}
