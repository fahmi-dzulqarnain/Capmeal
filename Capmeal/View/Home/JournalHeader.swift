//
//  JournalHeader.swift
//  SwiftUIExplore
//
//  Created by Edwin Niwarlangga on 23/07/21.
//

import SwiftUI

struct JournalHeader: View {
    var body: some View{
        VStack{
            HStack{
                Text("Ringkasan").font(.system(size: 35).bold()).padding(.leading, 20).foregroundColor(.white)
            }.frame(width: UIScreen.screenWidth, height: .none, alignment: .leading)
            HStack{
                Text("Thrusday, 15 July 2021").padding(.leading, 20).foregroundColor(.white)
                Button {
                    print("CLICK")
                } label: {
                    Image(systemName: "calendar").foregroundColor(.white).font(.system(size: 21))
                }
                
            }.frame(width: UIScreen.screenWidth, height: .none, alignment: .leading).padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
        }.padding(.top, 50)
        
    }
}

