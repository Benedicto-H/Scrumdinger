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
    
    // MARK: - State-Prop
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrumStore.scrums) {
                Task {
                    do {
                        try await scrumStore.save(scrums: scrumStore.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await scrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                scrumStore.scrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
