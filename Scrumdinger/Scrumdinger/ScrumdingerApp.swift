//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/01.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    // MARK: - StateObject-Prop
    @StateObject private var scrumStore: ScrumStore = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrumStore.scrums) {
                Task {
                    do {
                        try await scrumStore.save(scrums: scrumStore.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await scrumStore.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
