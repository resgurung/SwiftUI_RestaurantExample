//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Resham gurung on 02/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
        // navigation
        NavigationView {
            
            // tableview
            List {
                
                ForEach(menu) { section in
                    
                    Section(header: Text(section.name)) {
                        
                        ForEach(section.items) { item in
                            
                            ItemRow(item: item)
                        }
                    }
                }
                
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            ContentView()
        }
    }
}
