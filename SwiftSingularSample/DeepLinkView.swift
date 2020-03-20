//
//  DeepLinkView.swift
//  SwiftSingularSample
//
//  Created by Joseph Geraghty on 3/10/20.
//  Copyright © 2020 Joseph Geraghty. All rights reserved.
//

import SwiftUI

struct DeepLinkView: View {
    @State private var showAlert = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            SingularLogo()

            DeepLinkLabels(title: "Deep Link", content: $appState.deeplink)
            DeepLinkLabels(title: "Passthrough Parameters", content: $appState.passthrough)
            DeepLinkLabels(title: "Is Deferred", content: $appState.isDeferredText)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        
    }
}

struct DeepLinkLabels: View {
    var title: String
    @Binding var content: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))

                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .font(.body)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))

                .frame(maxWidth: .infinity, alignment: .leading)
        }

        .frame(maxWidth: .infinity)
        
    }
}
