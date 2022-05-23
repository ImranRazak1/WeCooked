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
    @StateObject var api: RecipeAPI

    init(menu: RecipeSelection) {
        self._api = StateObject(wrappedValue: RecipeAPI())
        self.menu = menu
    }
    var body: some View {
        

        List {
            //HeaderImage
            Image("HeaderImages/\(menu.name)")
                .resizable()
                .frame(height: 250)
                .aspectRatio(contentMode: .fit)
                .listRowBackground(Color.black)
                .listRowInsets(EdgeInsets(.zero))
                .padding(.bottom, 10)

            
            HStack{
            //View Discription and Title Header
            Text(menu.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .listRowSeparator(.hidden)
                
                
                Spacer()
            
                Menu{
                    Button("Creator", action: api.sortByCreator)
                    Button("Difficulty", action: api.sortByDifficulty)
                    Button("Servings", action: api.sortByServing)
                } label: {
                    Label("Sort", systemImage: "line.3.horizontal.decrease.circle.fill")
                }
            }
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
                            Text(recipe.difficulty)
                                .font(.caption)
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
        .toolbar{
            Button(action: shareButton) {
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(Color.gray)
                    )
                    .foregroundColor(.white)
                    .font(.headline)
                    .shadow(radius: 10)
            }
        }
    }
}
