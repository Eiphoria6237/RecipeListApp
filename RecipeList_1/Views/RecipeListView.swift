//
//  ContentView.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/15.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink (destination:RecipeDetailView(recipe:r), label:{
                    
                
                HStack(spacing:20) {
                    Image(r.image).resizable().scaledToFill().frame(width:50,height:50,alignment:.center).clipped()
                    Text(r.name)
                }
            })
        }
            
        .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
