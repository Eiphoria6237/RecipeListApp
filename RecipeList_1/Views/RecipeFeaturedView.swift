//
//  RecipeFeaturedView.swift
//  RecipeList_1
//
//  Created by LIU SHURUI on 2021/03/16.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    var body: some View {
        
        VStack(alignment:.leading, spacing:0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView (selection:$tabSelectionIndex) {
                    ForEach (0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            Button (action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    
                                    VStack(spacing:0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .foregroundColor(.black)
                                            .padding(.vertical,5)
                                    }
                                }
                                .tag(index)
                                .sheet(isPresented: $isDetailViewShowing){
                                    //show the recipeDtailView
                                    RecipeDetailView(recipe: model.recipes[index])
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color:Color(hue: 0, saturation: 0, brightness: 0, opacity: 0.5), radius: 10, x:-5,y:5)
                            })
                            
                            
                            
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment:.leading, spacing:10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights:model.recipes[tabSelectionIndex].highlights )
            }
            .padding(.leading)
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    func setFeaturedIndex() {
        //find 1st recipe that is featured
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
            
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
