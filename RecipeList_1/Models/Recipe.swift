//
//  Recipe.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/15.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var ingredients:[String]
    var totalTime:String
    var prepTime:String
    var cookTime:String
    var servings:Int
    var directions:[String]
    
}
