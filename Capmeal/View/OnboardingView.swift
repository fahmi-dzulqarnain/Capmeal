//
//  OnboardingView.swift
//  Capmeal
//
//  Created by Kelny Tan on 23/07/21.
//

import SwiftUI

struct OnboardingView: View {
    @State private var onBoardingState: Bool = false
    @AppStorage("onBoardingOccur") var onBoardingOccur: Bool = true
    var body: some View {
        Text("")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
