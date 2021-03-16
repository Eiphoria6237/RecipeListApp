//
//  RecipeDetailView.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/15.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment:.leading) {
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment:.leading) {
                   
                    Text("Choose your serving size")
                        .font(.footnote)
                        .foregroundColor(Color(.sRGB, red:0, green:0, blue:0, opacity: 0.5))
                        .lineLimit(1)
                        .padding(.top)
                    
                    Picker("", selection:$selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 145,  alignment: .center)
                    
                }
                .padding(.trailing, 150)
                .padding(.leading, 15)
                
                
                VStack(alignment:.leading) {
                    Text("Ingredients").font(.headline).padding([.bottom, .top],5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("😋" + RecipeModel.getPortion(ingredient:item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
                    }
                }.padding([.leading,.trailing],10)
                
                VStack(alignment:.leading) {
                    Text("Directions").font(.headline).padding([.bottom, .top],5)
                    
                    ForEach (0..<recipe.directions.count,id:\.self) { index in
                        Text(String(index+1)+"."+recipe.directions[index])
                    }
                }.padding([.leading,.trailing],10)
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        //create a dummy recipe
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
