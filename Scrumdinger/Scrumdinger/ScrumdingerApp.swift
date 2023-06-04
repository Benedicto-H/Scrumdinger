//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/01.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    // MARK: - State-Prop
    @State private var scrums: [DailyScrum] = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
