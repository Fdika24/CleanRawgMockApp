//
//  ListItemShimmer.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 25/08/21.
//

import SwiftUI

struct ListItemShimmer: View {
    var body: some View {
        HStack{
            ShimmerView(baseColor: .gray)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            VStack(alignment:.leading){
                ShimmerView(baseColor: .gray)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 15)
                    .cornerRadius(50)
                ShimmerView(baseColor: .gray)
                    .frame(width: 150, height: 15)
                    .cornerRadius(50)
            }
            Spacer()
        }
        .foregroundColor(.black)
    }
}
