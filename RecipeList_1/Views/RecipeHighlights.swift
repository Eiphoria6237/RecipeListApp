//
//  RecipeHighlights.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/19.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(highlights:[String]){
 
    //loop through the highlights and build the string
        for index in 0..<highlights.count {
            //if this is the last item don't and a coma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ","
            }
        }
    }
    var body: some View {
        Text(allHighlights)
        
    }
    
    
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test","test2","test3"])
    }
}
