//
//  ShimmerEffect.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.
//

import SwiftUI

public struct ShimmerView: View {
    
    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
        static let cornerRadius: CGFloat = 2.0
    }
    
    var baseColor:Color
    
    @State private var opacity: Double = Constants.minOpacity
    
    public init(baseColor:Color) {
        self.baseColor = baseColor
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(baseColor)
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
        }
    }
}
