//
//  RecipeContentView.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//

import SwiftUI

struct RecipeContentView: View {
    
    @StateObject var veganItems = VeganAPI()
    @StateObject var breakfastItems = BreakfastAPI()
    @StateObject var lunchItems = LunchAPI()
    @StateObject var healthyItems = HealthyAPI()
    @StateObject var dinnerItems = DinnerAPI()
    
    var body: some View {

        NavigationView {
            //Selection Menu
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(RecipeSelection.allCases) { menu in
                            NavigationLink {
                                RecipeList(menu: menu)
                            } label: {
                                VStack(alignment: .leading) {
                                    Image("navigation/\(menu.name)")
                                        .frame(width: 100)
                                        .cornerRadius(10)
                                        .foregroundColor(.gray)
                                    
                                    
                                    
                                    Text(menu.name)
                                        .fontWeight(.bold)
                                    
                                }
                                .padding(8)
                            }
                           
                        }
                        
                    }
                   .buttonStyle(PlainButtonStyle())
                }
                
                //Try Something Vegan
                VStack(alignment: .leading){
                    Text("Try something Vegan 🌱")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top, spacing: 0){
                            ForEach(veganItems.recipes) { recipe in
                                NavigationLink(destination: RecipesLanding(recipe: recipe)){
                                    VStack(alignment: .leading){
                                        AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                            
                                        } placeholder: {
                                            Rectangle()
                                                .fill(Color.gray)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                               
                                        }
                                        Group{
                                        Text(recipe.name)
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                        Text(recipe.creator)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    }
                                    .frame(width: 155)
                                    .padding(.leading, 15)
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                            
                        }
                        
                        .task {
                            await veganItems.fetchRecipes()
                        }
                        
                    }
                }
                
                //Explore Great Breakfasts
                VStack(alignment: .leading){
                    Text("Explore Great Breakfasts")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top, spacing: 0){
                            ForEach(breakfastItems.recipes) { recipe in
                                NavigationLink(destination: RecipesLanding(recipe: recipe)){
                                    VStack(alignment: .leading){
                                        AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                            
                                        } placeholder: {
                                            Rectangle()
                                                .fill(Color.gray)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                               
                                        }
                                        Group{
                                        Text(recipe.name)
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                        Text(recipe.creator)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    }
                                    .frame(width: 155)
                                    .padding(.leading, 15)
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                        }
                        
                        .task {
                            await breakfastItems.fetchRecipes()
                        }
                        
                    }
                }
                
                //Explore Lunch & Dinners
                VStack(alignment: .leading){
                    Text("Explore Lunch & Dinners")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top, spacing: 0){
                            ForEach(lunchItems.recipes) { recipe in
                                NavigationLink(destination: RecipesLanding(recipe: recipe)){
                                    VStack(alignment: .leading){
                                        AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                            
                                        } placeholder: {
                                            Rectangle()
                                                .fill(Color.gray)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                               
                                        }
                                        
                                        Group{
                                        Text(recipe.name)
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                        Text(recipe.creator)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    }
                                    .frame(width: 155)
                                    .padding(.leading, 15)
                                    
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                        }
                        
                        .task {
                            await lunchItems.fetchRecipes()
                        }
                        
                    }
                }
                
                //Healthy and Simple
                VStack(alignment: .leading){
                    Text("Healthy and Simple")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top, spacing: 0){
                            ForEach(healthyItems.recipes) { recipe in
                                NavigationLink(destination: RecipesLanding(recipe: recipe)){
                                    VStack(alignment: .leading){
                                        AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                            
                                        } placeholder: {
                                            Rectangle()
                                                .fill(Color.gray)
                                                .frame(width: 155, height: 155)
                                                .cornerRadius(8)
                                               
                                        }
                                        Group{
                                        Text(recipe.name)
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                        Text(recipe.creator)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    }
                                    .frame(width: 155)
                                    .padding(.leading, 15)
                                    
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                        }
                        
                        .task {
                            await healthyItems.fetchRecipes()
                        }
                        
                    }
                }
            }
            .background(Color("backColor"))
            .navigationTitle("WeCooked")
          
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.black)
    }

    
}

struct RecipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeContentView()
    }
}
