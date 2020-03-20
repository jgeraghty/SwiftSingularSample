//
//  IdentityView.swift
//  SwiftSingularSample
//
//  Created by Joseph Geraghty on 3/10/20.
//  Copyright © 2020 Joseph Geraghty. All rights reserved.
//

import SwiftUI
import Singular


struct IdentityView: View {
    @State var customUserId: String = ""
    @State var userIdText: String = ""
    var body: some View {
        VStack {
            SingularLogo()
            TextField("Custom User Id", text: $customUserId)
                .padding(EdgeInsets(top: 20, leading: 50, bottom: 10, trailing: 50))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Once set, the Custom User Id will persist between runs until `[Singular unsetCustomUserId]` is called.
            // This can also be called before SDK init if you want the first session to include the Custom User Id.
            Button(action: {
               //triggering setting the device custom user id
                Singular.setDeviceCustomUserId(self.customUserId)
                self.userIdText = "Custom User Id set to: \(self.customUserId)"
            }, label: {
                Text("Set Custom User Id")
            })
                .padding()
            Button(action: {
                //unsetting the custom user id
                Singular.unsetCustomUserId()
                self.userIdText = "Unsetting the Custom User Id was successful"
            }, label: {
                Text("Unset Custom User Id")
            })
                .padding()
            Text("\(self.userIdText)")
                .padding()
                
            Spacer()
        }
    }
}
