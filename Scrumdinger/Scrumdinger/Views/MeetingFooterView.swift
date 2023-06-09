//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/04.
//

import SwiftUI

struct MeetingFooterView: View {
    
    // MARK: - Stored-Props
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    
    // MARK: - Computed-Props
    private var speakerNumber: Int? {
        
        get {
            guard let index: Array<ScrumTimer.Speaker>.Index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
            
            return index + 1
        }
    }
    
    private var isLastSpeaker: Bool {
        
        get {
            return speakers.dropLast().allSatisfy { $0.isCompleted }
            
            //  return speakers.dropLast().reduce(true) { $0 && $1.isCompleted }
            }
        }
    
    private var speakerText: String {
        
        get {
            guard let speakerNumber: Int = speakerNumber else { return "No more speakers" }
            
            return "Speaker \(speakerNumber) of \(speakers.count)"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                if (isLastSpeaker == true) {
                    
                    Text("Last Speaker")
                } else {
                    
                    Text(speakerText)
                    
                    Spacer()
                    
                    Button {
                        skipAction()
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
