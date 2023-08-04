//
//  CircullarLoadingView.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import SwiftUI

public struct CircullarLoadingView: View {
    
    @State private var isLoading = false
    private var width: CGFloat = 100
    private var height: CGFloat = 100

    var color: Color
    var lineCap: CGLineCap
    
    public init(color: Color, lineCap: CGLineCap) {
        self.color = color
        self.lineCap = lineCap
    }
    
    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.35)
            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: lineCap))
            .fill(color)
            .frame(width: width, height: height)
            .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    isLoading.toggle()
                }
            }
    }
}

struct CircullarLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CircullarLoadingView(color: .blue, lineCap: .round)
    }
}
