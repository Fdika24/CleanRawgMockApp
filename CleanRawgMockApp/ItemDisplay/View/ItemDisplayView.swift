//
//  ItemDisplayView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 27/08/21.
//

import SwiftUI

struct ItemDisplayView: View {
    
    init() {}
    var body: some View {
        ZStack(alignment:.top){
            ScrollView {
                VStack(alignment:.leading){
                    Image("test1")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: UIScreen.width, height: 300)
                    Group {
                        Text("Title")
                    }.padding(.horizontal)
                    Spacer()
                }
            }.ignoresSafeArea(edges: .top)
            Group{
                Rectangle()
                    .foregroundColor(.white)
                    .ignoresSafeArea(edges: .top)
                    .frame(width: UIScreen.width, height: 20)
                HStack{
                    Text("The Name")
                }
                .frame(width:UIScreen.width)
                .background(Color.white)
            }
            .opacity(0)
        }
    }
}

struct ItemDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDisplayView()
    }
}
