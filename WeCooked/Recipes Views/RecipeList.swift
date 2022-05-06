//
//  RecipeList.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//

import SwiftUI
import UIKit

struct RecipeList: View {
    let menu: RecipeSelection
    
    @StateObject var api = RecipeAPI()
    
    
    var body: some View {
        
        
        List {
            //HeaderImage
            Image("HeaderImages/\(menu.name)")
                .resizable()
                .frame(height: 250)
                .aspectRatio(contentMode: .fill)
                .listRowInsets(EdgeInsets(.zero))
                .padding(.bottom, 10)
                .listRowBackground(Color("backColor"))

            //View Discription and Title Header
            Text(menu.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .listRowBackground(Color("backColor"))
                .listRowSeparator(.hidden)
            
            Text("Explore \(menu.name) recipes from creators you love.")
                .listRowBackground(Color("backColor"))
            
            //List of Recipes
            ForEach(api.recipes) { recipe in
                NavigationLink(destination: RecipesLanding(recipe: recipe)){
                    HStack{
                        AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                            image
                                .resizable()
                                .cornerRadius(8)
                                .frame(width: 130, height: 81)
                                .clipped()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 130, height: 81)
                                .cornerRadius(8)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text(recipe.name)
                                .font(.headline)
                            Text(recipe.creator)
                        }
                    }
                }
                
            }
            .listRowBackground(Color("backColor"))
            .padding(5)
            
        }
        .listRowBackground(Color("backColor"))
        .frame( maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .listStyle(GroupedListStyle())
        
        .task {
            await api.fetchRecipes(for: menu)
        }
        
        
    }
}
