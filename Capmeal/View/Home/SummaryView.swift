//
//  SummaryView.swift
//  SwiftUIExplore
//
//  Created by Edwin Niwarlangga on 23/07/21.
//

import SwiftUI

struct SummaryView :View {
    @State var progressValue: Float = 0.5
    var calories: Float = 1500
    var maximumCalories: Float = 1800
    
    
    var body : some View{
        VStack{
            HStack{
                Text("Kalori").padding(.leading, 20)
                Spacer()
                Text("\(Int(self.calories))/\(Int(self.maximumCalories)) kal").padding(.trailing, 20).foregroundColor(Color(UIColor(red: 0.14, green: 0.14, blue: 0.24, alpha: 1.00))).font(.system(size: 15))
            }
            ProgressBar(value: $progressValue).frame(height: 13).padding(.horizontal, 20)
            
            HStack{
                VStack{
                    Text("Karbohidrat").bold()
                    Text("45%")
                }.padding(.leading, 25)
                Spacer()
                VStack{
                    Text("Protein").bold()
                    Text("35%")
                }
                Spacer()
                VStack{
                    Text("Lemak").bold()
                    Text("20%")
                }.padding(.trailing, 25)
            }
        }.frame(width: UIScreen.screenWidth - 50, height: 125, alignment: .leading).overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1).shadow(radius: 10)
        ).onAppear(perform: calculateProgressBar)
        
    }
    
    func calculateProgressBar(){
        //function to calculate
        self.progressValue = calories / maximumCalories
    }
    
    func startProgressBar() {
        for _ in 0...80 {
            self.progressValue += 0.015
        }
    }
    
    func resetProgressBar() {
        self.progressValue = 0.0
    }
}
