//
//  NewUpdates.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import SwiftUI

struct NewUpdates: View {
    
    @EnvironmentObject var update: updateModelAPI
    
    var body: some View {
        ScrollView{
            List {
                
                HStack{
                    //View Discription and Title Header
                    Text("What's New?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .listRowSeparator(.hidden)
                    
                    
                    Spacer()
                    
                    Text("Think of it")
                        .listRowBackground(Color.black)
                    
                    
                    
                    //List of Recipes
                    ForEach(update.updates) { update in
                        HStack{
                            ZStack{
                            Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 130, height: 81)
                            Image(systemName: "\(update.image)")
                                    .resizable()
                                    .cornerRadius(8)
                                    .frame(width: 130, height: 81)
                                    .clipped()
                            
                            }
                            
                            VStack(alignment: .leading) {
                                Text(update.updateTitle)
                                    .font(.headline)
                                Text(update.updateText)
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
                await update.loadData()
            }
            .listRowBackground(Color.black)
            
        }
    }
}






struct NewUpdates_Previews: PreviewProvider {
    static var previews: some View {
        NewUpdates()
            .environmentObject(updateModelAPI())
    }
}
