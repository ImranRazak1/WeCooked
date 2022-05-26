//
//  RecipeContentView.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import SwiftUI

struct HomeContentView: View {
    @StateObject var showSheet = updateAPI()
    
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
                
                
                Group{
                //Try Something Vegan Section
                
                //Section Title
                VStack(alignment: .leading){
                    Text("Try something Vegan 🌱")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                //View
                    TrySomethingVegan()
                        .environmentObject(VeganAPI())
                }
                
                Group{
                //Explore Great Breakfasts
                VStack(alignment: .leading){
                    Text("Explore Great Breakfasts")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            // View
                Breakfast()
                        .environmentObject(BreakfastAPI())
                }
                
                Group{
                //Explore Lunch Recipes
                VStack(alignment: .leading){
                    Text("Explore Lunch Recipes")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                //Lunch Recipes Collection View
                Lunch()
                        .environmentObject(LunchAPI())
                }
                
                //Healthy and Simple
                Group{
                VStack(alignment: .leading){
                    Text("Healthy and Simple")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
               
                //View
                Healthy()
                        .environmentObject(HealthyAPI())
                }
                
                
                //Enjoy a nice Dinner
                Group{
                VStack(alignment: .leading){
                    Text("Enjoy a nice Dinner")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
               
                //View
                Dinner()
                        .environmentObject(DinnerAPI())
                }
               
            
            
            .navigationTitle("WeCooked")

        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showSheet.showSheet) {
            NewUpdates()
        }
    }

    
}
    

struct RecipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
            .environmentObject(BreakfastAPI())
            .environmentObject(VeganAPI())
            .environmentObject(HealthyAPI())
            .environmentObject(DinnerAPI())
            .environmentObject(LunchAPI())
            .environmentObject(updateAPI())
    }
}
}
