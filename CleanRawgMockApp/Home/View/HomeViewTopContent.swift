//
//  HomeViewTopContent.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.


import SwiftUI

struct HomeViewTopContent: View {
    @Binding var showSearch:Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width:UIScreen.width,height: UIScreen.height*0.20)
            VStack(alignment:.leading) {
                // Ini sampe sekarang ga tau kenapa klo ga bikin hstack abis itu di spacerin, ntar malah ketengah, ga ke samping, pdhl udh di set widthnya
                HStack {
                    Text("Welcome")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
                Text("What would you like to play today?")
                    .font(.footnote)
                    .fontWeight(.light)
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.width*0.95, height: 50)
                    .overlay(
                        HStack {
                            Text("Adventure Quest World")
                                .font(.callout)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }.padding(.horizontal)
                    )
                    .padding(.bottom)
                    .onTapGesture {
                        showSearch = true
                    }
            }
            .padding(.top,UIScreen.height*0.06)
            .padding(.horizontal)
            .frame(width:UIScreen.width)
            .foregroundColor(.white)
        }
    }
}


