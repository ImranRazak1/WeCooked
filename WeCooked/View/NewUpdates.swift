//
//  NewUpdates.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import SwiftUI

struct NewUpdates: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var updateList = updateAPI()
    @StateObject var showingUpdate = updateStatus()
    
    var body: some View {
        
        NavigationView {
        
            ScrollView{
                VStack(alignment: .leading){
            Text("Hello 👋! Welcome to a new version of WeCooked. Our mission is to deliver the best expreince possible so you can discover, create and share recipes with friends and family.")
                    .font(.headline)
                    .padding(.bottom)
                
            ForEach(updateList.updates) { update in
                
                    HStack{
                    Image(systemName: update.image)
                            .frame(width: 45, height: 45)
    
                    Text(update.updateTitle)
                            .font(.title2)
                            .bold()
                    
                }
                Divider()
                Text(update.updateText)
            }
                    
                   
                    
            }
            .padding()
        
                Group{
                    
                    Button(action: {
                        dismiss()
                        showingUpdate.toggleSheet()
                            
                    }, label: {
                        Text("Continue")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .bottom)
                            .cornerRadius(15)
                            .padding()
                    })
                 .buttonStyle(.borderedProminent)
                 .padding()
                 
                }

        }
        .navigationTitle("What's new? 👀")
        .task {
            await updateList.loadData()
        }
           
    
    }
        .interactiveDismissDisabled()
    }
}






struct NewUpdates_Previews: PreviewProvider {
    static var previews: some View {
        NewUpdates()
            .environmentObject(updateStatus())
    }
}
