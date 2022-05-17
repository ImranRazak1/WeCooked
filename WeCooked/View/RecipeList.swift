//
//  RecipeList.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import SwiftUI
import UIKit

struct RecipeList: View {
    let menu: RecipeSelection
    /// takes the passeed in value from the recipe selction on the home page and passes it to the list page to fetch the correct repecies.
@StateObject var api = RecipeAPI()
    
    
    var body: some View {
        

        List {
            //HeaderImage
            Image("HeaderImages/\(menu.name)")
                .resizable()
                .frame(height: 250)
                .aspectRatio(contentMode: .fill)
                .listRowBackground(Color.black)
                .listRowInsets(EdgeInsets(.zero))
                .padding(.bottom, 10)

            //View Discription and Title Header
            Text(menu.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.black)
            
            Text("Explore \(menu.name) recipes from creators you love.")
                .listRowBackground(Color.black)
            
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
            .listRowBackground(Color.black)
            .padding(5)

            
        }
        .frame( maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .listStyle(GroupedListStyle())
        
        .task {
            await api.fetchRecipes(for: menu)
        }
        .listRowBackground(Color.black)
        
    }
}
