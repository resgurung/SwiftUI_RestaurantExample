//
//  MainView.swift
//  SwiftUIExample
//
//  Created by Resham gurung on 03/10/2020.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView {
            
            ContentView()
                
                .tabItem {
                    
                    Image(systemName: "list.dash")
                    
                    Text("Menu")
                }
            
            OrderView()
                
                .tabItem {
                    
                    Image(systemName: "square.and.pencil")
                    
                    Text("Order")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static let order: Order = Order()
    
    static var previews: some View {
        
        MainView().environmentObject(order)
    }
}
