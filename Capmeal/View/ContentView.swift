//
//  ContentView.swift
//  Capmeal
//
//  Created by Fahmi Dzulqarnain on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    
    // ges, ges.. Ini contoh manggil CoreData ViewModel nya yak..
    // Jan lupa pakai @StateObject yak
    
    //@State onBoardingSetup untuk mengecek apa harus menyalakan onboarding atau gak
    //@AppStorage untuk memeriksa user butuh onboarding sebagai pengguna awal atau tidak jika dia adalah pengguna lama
    
    @State private var onboardingSetup: Bool = false
    @AppStorage("needsOnboarding") var needsOnboarding: Bool = true
    @StateObject var data = CoreDataViewModel()
    
    var body: some View {
        VStack(content: {
            Text("Placeholder")
        })
    }
}

struct JournalView: View {
    let journal: JournalEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            if let meal = journal.meal {
                // Nah ini maknanya kita ambil meal
                Text(meal.deskripsi ?? "")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    private var mainView : some View {
        VStack{
            Spacer()
            .fullScreenCover(isPresented: $needsOnboarding){
                OnboardingView()
            }
        }
    }
}
