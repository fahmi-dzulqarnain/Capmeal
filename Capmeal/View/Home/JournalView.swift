//
//  JournalView.swift
//  SwiftUIExplore
//
//  Created by Edwin Niwarlangga on 23/07/21.
//

import SwiftUI

struct JournalView : View{
    @Binding var journals : [Journal]
    @Binding var scrolled : Int
    
    var body: some View{
        ZStack{
            ForEach(journals.reversed()){journal in
                
                HStack{
                    
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                        Image(journal.image)
                            .resizable()
                            //dynamic width & height...
                            .aspectRatio(contentMode: .fill)
                            .frame(width: calculateWidth(), height: (UIScreen.main.bounds.height / 2.8) - CGFloat(journal.id - scrolled) * 50)
                            .cornerRadius(25)
                        //based on scroll changed view size...
                        
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                            VStack(alignment : .leading, spacing: 15){
                                Text(journal.name).font(.system(size: 25))
                                HStack{
                                    HStack{
                                        Image(systemName : "circle.fill").foregroundColor(Color("Primary"))
                                        Text(journal.calories)
                                    }
                                    
                                    HStack{
                                        Image(systemName : "circle.fill").foregroundColor(Color("Primary"))
                                        Text(journal.portion)
                                    }
                                }
                            }.frame(width : calculateWidth(), height: 100).background(Color.white).cornerRadius(25).shadow(radius: 10)
                            
                            HStack(alignment : .center){
                                Text(journal.time)
                            }.frame(width : calculateWidth() - (calculateWidth()/2), height: 20).background(Color("Secondary")).cornerRadius(10).padding(.top, -10)
                            
                        }
                        
                        
                    }.offset(x: journal.id - scrolled <= 2 ? CGFloat(journal.id - scrolled) * 50 : 100)
                    
                    
                    Spacer()
                    
                }.contentShape(Rectangle())
                //adding gesture
                .offset(x: journal.offset).gesture(DragGesture().onChanged({ value in
                    
                    withAnimation {
                        
                        //disabling drag from last card
                        if value.translation.width < 0 && journal.id != journals.last!.id{
                            journals[journal.id].offset = value.translation.width
                        }else{
                            //restoring cards ...
                            if journal.id > 0{
                                journals[journal.id - 1].offset = -(calculateWidth() + 100) + value.translation.width
                            }
                        }
                        
                    }
                    
                }).onEnded({ value in
                    withAnimation {
                        if value.translation.width < 0{
                            if -value.translation.width > 180 && journal.id != journals.last!.id{
                                //moving view away..
                                journals[journal.id].offset = -(calculateWidth() + 100)
                                scrolled += 1
                            }else{
                                journals[journal.id].offset = 0
                            }
                            
                        }else{
                            //restroring card..
                            if journal.id > 0{
                                if value.translation.width > 180{
                                    journals[journal.id - 1].offset = 0
                                    scrolled -= 1
                                }else{
                                    journals[journal.id - 1].offset = -(calculateWidth() + 100)
                                }
                            }
                        }
                    }
                }))
                
                
            }
        }.frame(height: UIScreen.screenHeight / 2.8, alignment: .center).padding(.horizontal, 25)
    }
    
    func calculateWidth() -> CGFloat{
        //padding
        let screen = UIScreen.main.bounds.width - 50
        //show 3 first card
        let width = screen - ( 2 * 50 )
        
        return width
    }
}

