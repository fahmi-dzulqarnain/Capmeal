//
//  ContentView.swift
//  Capmeal
//
//  Created by Fahmi Dzulqarnain on 22/07/21.
//

import SwiftUI

struct Journal : Identifiable{
    var id : Int
    var image : String
    var calories : String
    var portion : String
    var name : String
    var time : String
    var offset : CGFloat
}

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                switch viewRouter.currentPage {
                 case .home:
                    Home()
                 case .profile:
                     Profile()
                default:
                    Home()
                 }
                
                Spacer()
                Divider()
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                    ZStack {
                        Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                         Image(systemName: "plus.circle.fill")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                             .foregroundColor(Color("NavigationBottomOverlay"))
                     }.offset(y: -geometry.size.height/8/2)
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account")
                }.frame(width: geometry.size.width, height:  75)
                
            }.edgesIgnoringSafeArea(.bottom)
            
        }
    }
    
    func calculateWidth() -> CGFloat{
        //padding
        let screen = UIScreen.main.bounds.width - 50
        //show 3 first card
        let width = screen - ( 2 * 50 )
        
        return width
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
            Text(tabName)
                .font(.footnote)
        }.foregroundColor(viewRouter.currentPage == assignedPage ? Color("NavigationBottomOverlay") : .gray)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

