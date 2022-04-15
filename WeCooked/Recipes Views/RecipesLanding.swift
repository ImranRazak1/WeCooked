//
//  RecipesLanding.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//

import SwiftUI

//View that the recipes will be displayed in.

struct RecipesLanding: View {
    var recipe: Recipe
    
    var body: some View {
        
            
        ScrollView{
            //Recipe Details
            VStack(alignment: .leading){
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack{
                    Text(recipe.creator)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            //Recipe Image
                AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                    image
                        .resizable()
                        .frame(height: 280)
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
            
            
            //Recipe Instructions and Ingredients
            VStack(alignment: .leading){
                HStack{
                    Text("Things you need 👇")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding([.leading, .bottom])
                
                
                ForEach(recipe.ingredients, id: \.name){ ingredient in
                    VStack {
                        HStack{
                            Text("\(Int(ingredient.quantity)) \(ingredient.measurement) \(ingredient.name) ")
                        }
                        
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(alignment: .leading) {
                HStack{
                Text("Steps to make it happen!")
                    .font(.title)
                    .fontWeight(.bold)
                }
                .padding([.leading, .bottom])
                
                Spacer()
                
                ForEach(recipe.methods, id: \.step){method in
                    Divider()
                    
                    Text("Step \(method.step)")
                        .font(.headline)
                    
                    
                    
                    Text(method.text)
                }
                .padding([.leading, .bottom, .trailing])
            }
            
            Spacer()

        }
        .navigationBarTitle("", displayMode: .inline)
            
    }
}
