//
//  Healthy.swift
//  WeCooked
//
//  Created by Imran razak on 14/05/2022.
//

import SwiftUI

struct Healthy: View {
    @EnvironmentObject var healthyItems: HealthyAPI
    var body: some View {
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
}

struct Healthy_Previews: PreviewProvider {
    static var previews: some View {
        Healthy()
            .environmentObject(HealthyAPI())
    }
}
