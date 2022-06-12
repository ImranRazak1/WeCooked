//
//  EditorsPicks.swift
//  WeCooked
//
//  Created by Imran razak on 31/05/2022.
//

import SwiftUI

struct EditorsPicks: View {
    @EnvironmentObject var editorItems: EditorsAPI
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(editorItems.recipes) { recipe in
                        NavigationLink(destination: RecipesLanding(recipe: recipe)){
                            VStack(alignment: .leading){
                                AsyncImage(url: URL(string: "\(recipe.imageURL)")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(8)
                                    
                                } placeholder: {
                                    ZStack{
                                    ProgressView()
                                    Rectangle()
                                        .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.22))
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(8)
                                       
                                    }

                                       
                                }
                                Group{
                                Text(recipe.name)
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(recipe.creator)
                                        .foregroundColor(.secondary)
                                        .font(.subheadline)
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
                    await editorItems.fetchRecipes()
                }
                
            }
        }

    }
}

struct EditorsPicks_Previews: PreviewProvider {
    static var previews: some View {
        EditorsPicks()
            .environmentObject(EditorsAPI())
    }
}
