//
//  ContentView.swift
//  SwiftSingularSample
//
//  Created by Joseph Geraghty on 3/6/20.
//  Copyright © 2020 Joseph Geraghty. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var selection = 0
    @EnvironmentObject var appState: AppState
 
    var body: some View {
        TabView(selection: $appState.selectedTab) {
            EventsView()
                .tabItem {
                    Image(systemName: (selection == 0 ? "pencil" : "pencil"))
                    Text("Custom Events")
            }.tag(Tab.events)
            RevenueView()
                .tabItem {
                    Image(systemName: (selection == 1 ? "dollarsign.circle.fill" : "dollarsign.circle"))
                    Text("Revenue")
            }.tag(Tab.revenue)
            IdentityView()
                .tabItem {
                    Image(systemName: (selection == 2 ? "person.fill" : "person"))
                    Text("Identity")
            }.tag(Tab.identity)
            DeepLinkView()
                .tabItem {
                    Image(systemName: (selection == 2 ? "link" : "link"))
                    Text("Deep Link")
            }.tag(Tab.deeplink)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SingularLogo: View {
    var body: some View {
        Image("singular_full_logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 125, leading: 40, bottom: 40, trailing: 40))
    }
}

extension ContentView {
    enum Tab: Hashable {
        case events
        case revenue
        case identity
        case deeplink
    }
}

