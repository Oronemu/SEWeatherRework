//
//  ErrorView.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import SwiftUI

public struct ErrorView: View {
    @State private var isHapticWorked: Bool = false
    
    public var error: String
    
    public init(error: String) {
        self.error = error
    }
    
    public var body: some View {
        VStack {
            Text("😓")
                .font(.system(size: 80))
                .padding(.bottom, -10)
            Text("Oops, there seems to be an error.")
                .font(.system(size: 30, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            Text(error)
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .onAppear {
            if !isHapticWorked {
                Haptic.notify(.error)
                self.isHapticWorked.toggle()
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "An error has occured")
    }
}

