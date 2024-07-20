//
//  IntroLottieView.swift
//  News
//
//  Created by h on 10.04.2024.
//

import SwiftUI
import Lottie

struct IntroLottieView: View {
    var body: some View {
        LottieView(animation: .named("NewsAnimation.json"))
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
    }
}

#Preview {
    IntroLottieView()
}
