//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/05.
//

import SwiftUI

struct NewScrumSheet: View {
    
    // MARK: - State-Prop
    @State private var newScrum: DailyScrum = DailyScrum.emptyScrum
    
    // MARK: - State Binding-props
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
    }
}
