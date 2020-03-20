//
//  EventsView.swift
//  SwiftSingularSample
//
//  Created by Joseph Geraghty on 3/10/20.
//  Copyright © 2020 Joseph Geraghty. All rights reserved.
//

import SwiftUI
import Singular

struct EventsView: View {
    @State var eventName: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            SingularLogo()
            TextField("Event Name", text: $eventName)
                .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                print("custom event button tapped!")
                Singular.event(self.eventName)
                self.showAlert = true
            }, label: {
                Text("Custom Event")
            })
                .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Event Sent!"), dismissButton: .default(Text("Dismiss")))
            }
            Button(action: {
                print("custom event with attributes button tapped!")
                
                var args = [String : String]()
                args["value1"] = "something"
                args["value2"] = "something else"
                
                Singular.event(self.eventName, withArgs: args)
                self.showAlert = true
                
            }, label: {
                Text("Custom Event with Attributes")
            })
            .padding()
                
            Spacer()
        }
    }
}
