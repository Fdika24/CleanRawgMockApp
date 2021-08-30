//
//  HomeViewTopContent.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.


import SwiftUI

struct HomeViewTopContent: View {
    @State var userProfile = ProfileModel.name
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width:UIScreen.width,height: UIScreen.height*0.15)
            VStack(alignment:.leading) {
                // Ini sampe sekarang ga tau kenapa klo ga bikin hstack abis itu di spacerin, ntar malah ketengah, ga ke samping, pdhl udh di set widthnya
                HStack {
                    Text("Welcome, \(self.userProfile)!")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
                Text("What would you like to play today?")
                    .font(.footnote)
                    .fontWeight(.light)
                Spacer()
            }
            .padding(.top,UIScreen.height*0.06)
            .padding(.horizontal)
            .frame(width:UIScreen.width)
            .foregroundColor(.white)
        }
    }
}


