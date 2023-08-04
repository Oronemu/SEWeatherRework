//
//  Haptic.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import Foundation
import SwiftUI

public class Haptic {
    
    public static func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
    
    public static func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
}
