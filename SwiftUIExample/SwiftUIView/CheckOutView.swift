//
//  CheckOutView.swift
//  SwiftUIExample
//
//  Created by Resham gurung on 03/10/2020.
//

import SwiftUI

struct CheckOutView: View {
    
    // global value
    @EnvironmentObject var order: Order
    
    // local value, used only by this view @State
    @State private var paymentType = 0
    @State private var addLoyalityDetail = false
    @State private var loyalityNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    static let paymentOption: [String] = ["Cash", "Credit Card", "iDine Points"]
    
    static let tipAmounts = [10, 20, 30, 0]
    
    var totalPrice: Double {
        
        let total = Double(order.total)
        
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        
        return total + tipValue
    }
    
    var body: some View {
        
        Form {
            
            Section {
                
                Picker("How do you want to pay?", selection: $paymentType) {
                    
                    ForEach(0 ..< Self.paymentOption.count) {
                        
                        Text(Self.paymentOption[$0])
                    }
                    
                }
                
                Toggle(isOn: $addLoyalityDetail.animation()) {
                    
                    Text("Add iDine Loyality Number")
                }
                
                if addLoyalityDetail {
                    
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                }
            }
            
            Section(header: Text("Add a tip")) {
                
                Picker("Percentage", selection: $tipAmount) {
                    
                    ForEach(0 ..< Self.tipAmounts.count) {
                        
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)) {
                
                Button("Confirm Order") {
                    
                    self.showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Alert Confirmed"),
                  message: Text("Your total was $\(totalPrice, specifier: "%.2f")"),
                  dismissButton: Alert.Button.default(Text("OK")))
        }
        
    }
}

struct CheckOutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        
        CheckOutView().environmentObject(order)
    }
}
