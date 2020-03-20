//
//  RevenueView.swift
//  SwiftSingularSample
//
//  Created by Joseph Geraghty on 3/10/20.
//  Copyright © 2020 Joseph Geraghty. All rights reserved.
//

import SwiftUI
import Singular


struct RevenueView: View {
    @State private var showAlert = false
    var currencies = ["USD", "EUR", "GBP", "ILS", "INR", "JPY", "KRW"]
    @State private var selectedCurrency = 0
    @State private var pickerVisible = false
    
    @State var revenueEventName: String = ""
    @State var currency: String = ""
    @State var revenue: String = ""
    var body: some View {
        VStack {
            SingularLogo()
            TextField("Revenue Event Name", text: $revenueEventName)
                .padding(EdgeInsets(top: 20, leading: 50, bottom: 0, trailing: 50))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(currencies[selectedCurrency]){
                self.pickerVisible.toggle()
            }
                .padding(EdgeInsets(top: 10, leading: 100, bottom: 0, trailing: 100))
            
            TextField("Revenue", text: $revenue)
                .padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: 50))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                //triggering the revenue event: sending name, currency type and amount
                Singular.customRevenue(self.revenueEventName, currency: self.currencies[self.selectedCurrency], amount: (Double(self.revenue) ?? 0.0))
                self.showAlert = true
            }, label: {
                Text("Revenue Event")
            })
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Success"), message: Text("Revenue Event Sent!"), dismissButton: .default(Text("Dismiss")))
            }
            Button(action: {
                //triggering the revenue event: sending name, currency type, amount and extra attributes
                var args = [String : String]()
                args["value1"] = "something"
                args["value2"] = "something else"
                
                Singular.customRevenue(self.revenueEventName, currency: self.currencies[self.selectedCurrency], amount: (Double(self.revenue) ?? 0.0), withAttributes: args)
                self.showAlert = true
            }, label: {
                Text("Revenue Event with Attributes")
            })
            .padding()
                
            Spacer()

            if pickerVisible {
                    Picker(selection: $selectedCurrency, label: Text("Please choose a currency")) {
                       ForEach(0 ..< currencies.count) {
                          Text(self.currencies[$0])
                       }
                    }
                        .padding(EdgeInsets(top: 10, leading: 50, bottom: 0, trailing: 50))
                        .labelsHidden()
                    .background(Color.white)
                    .onTapGesture {
                        self.pickerVisible.toggle()
                    }
                }
        }
    }
}
