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
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
