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
}
