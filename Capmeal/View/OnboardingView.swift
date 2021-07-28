//
//  OnboardingView.swift
//  Capmeal
//
//  Created by Kelny Tan on 28/07/21.
//

import SwiftUI

struct OnboardingView: View {
    //@State untuk mengecek apa harus menyalakan onboarding atau gak
    //@AppStorage untuk memeriksa user butuh onboarding sebagai pengguna awal atau tidak jika dia adalah pengguna lama
    @State private var onboardingSetup: Bool = false
    @AppStorage("needsOnboarding") var needsOnboarding: Bool = true
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
