//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/04.
//

import SwiftUI

struct MeetingHeaderView: View {
    
    // MARK: - Stored-Props
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    // MARK: - Computed-Props
    private var totalSeconds: Int {
        
        get {
            return secondsElapsed + secondsRemaining
        }
    }
    
    private var progress: Double {
        
        get {
            guard totalSeconds > 0 else {
                return 1
            }
            
            return Double(secondsElapsed) / Double(totalSeconds)
        }
    }
    
    private var minutesRemaining: Int {
        
        get {
            return secondsRemaining / 60
        }
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)    //  The default is `ignore`. (-> Any child accessibility elements become hidden.)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
