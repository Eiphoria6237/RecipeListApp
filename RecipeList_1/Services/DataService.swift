//
//  DataService.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/15.
//

import Foundation

class DataService {
    
    static func getLocalData() ->[Recipe] {
        //parse local json file
        
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if is nil
        guard pathString != nil else {
            return [Recipe]()
        }
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
              
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            catch {
                print(error)
            }
           
        }
        catch {
            print(error)
        }
        //create the data with a JSON decoder
        //add the unique IDs
        //return the recipes
        return [Recipe]()
    }
}
