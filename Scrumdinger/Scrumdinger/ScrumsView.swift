//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/02.
//

import SwiftUI

struct ScrumsView: View {
    
    // MARK: - Stored-Prop
    let scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                
                NavigationLink {
                    DetailView(scrum: scrum)
                } label: {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    //  Action
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
