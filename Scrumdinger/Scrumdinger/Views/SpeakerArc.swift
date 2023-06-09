//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/08.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    // MARK: - Stored-Props
    let speakerIndex: Int
    let totalSpeakers: Int
    
    // MARK: - Computed-Props
    private var degreesPerSpeaker: Double {
        
        get {
            return 360.0 / Double(totalSpeakers)
        }
    }
    
    private var startAngle: Angle {
        
        get {
            return Angle(degrees: (degreesPerSpeaker * Double(speakerIndex)) + 1.0)
        }
    }
    
    private var endAngle: Angle {
        
        get {
            return Angle(degrees: (startAngle.degrees + degreesPerSpeaker - 1.0))
        }
    }
    
    // MARK: - Method
    func path(in rect: CGRect) -> Path {
        
        let diameter: CGFloat = min(rect.size.width, rect.size.height) - 24.0
        let radius: CGFloat = diameter / 2.0
        let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
