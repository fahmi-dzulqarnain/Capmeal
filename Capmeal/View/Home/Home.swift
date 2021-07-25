//
//  Home.swift
//  SwiftUIExplore
//
//  Created by Edwin Niwarlangga on 22/07/21.
//

import SwiftUI

struct Home: View {
    
    var weeklyData : [String] = ["15 Jul","15 Jul","15 Jul","15 Jul","15 Jul","15 Jul","15 Jul"]
    @State var journals : [Journal] = [
        Journal(id: 0, image: "p1", calories: "100 cal", portion: "150 gr", name: "Buah buahan", time: "Sarapan", offset: 0),
        
        Journal(id: 1,image: "p2", calories: "100 cal", portion: "150 gr", name: "Salad", time: "Makan Siang", offset: 0),
        
        Journal(id: 2,image: "p3", calories: "100 cal", portion: "150 gr", name: "Beng Beng", time: "Snack", offset: 0),
        
        Journal(id: 3,image: "p4", calories: "100 cal", portion: "150 gr", name: "Nasi Goreng", time: "Makan Malam", offset: 0)
    ]
    
    @State var scrolled = 0
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                JournalHeader().background(Color("Tersier")).cornerRadius(30,corners: [.bottomLeft,.bottomRight]).edgesIgnoringSafeArea(.top)
                
                WeeklyCollectionView(weeklyData: weeklyData).padding(.bottom, 10)
                
                SummaryView()
                JournalTitle()
                JournalView(journals: $journals, scrolled: $scrolled)
                
                
            }.edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct JournalTitle : View{
    var body: some View{
        HStack{
            Text("Konsumsimu Hari Ini").font(.system(size: 28).bold()).padding(.leading, 20)
        }.frame(width: UIScreen.screenWidth, height: .none, alignment: .topLeading).padding(.top, 5)
    }
}


struct WeeklyCollectionView : View{
    let weeklyData: [String]
    var isSelected : Bool = false
    var body: some View{
        HStack{
            ForEach(weeklyData, id: \.self){items in
                Button(action: {
                    print("CLICK")
                }, label: {
                    VStack{
                        Image(systemName: "circle.fill").foregroundColor(Color("Primary"))
                        Text(items).foregroundColor(Color("Tersier"))
                    }
                }).padding(.horizontal, 2)
                
            }
            
        }.padding(.top, -30)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
