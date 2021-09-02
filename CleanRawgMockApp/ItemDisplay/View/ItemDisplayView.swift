//
//  ItemDisplayView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 27/08/21.
//

import SwiftUI

struct ItemDisplayView: View {
    @State var itemOpacity:Double = 0
    
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
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("released")
                            .font(.headline)
                        Text("rating")
                            .font(.subheadline)
                            .padding(.bottom)
                        Text("Desc")
                            .font(.caption)
                            .fontWeight(.regular)
                    }.padding(.horizontal)
                    Spacer()
                }
            }.ignoresSafeArea(edges: .top)
            Group{
                Rectangle()
                    .foregroundColor(.white)
                    .ignoresSafeArea(edges: .top)
                    .frame(width: UIScreen.width, height: 20)
                    .opacity(itemOpacity)
                HStack{
                    Image(systemName: "arrow.backward")
                    Spacer()
                    Text("The Name")
                        .opacity(itemOpacity)
                    Spacer()
                    Image(systemName: "bookmark")
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom)
                .frame(width:UIScreen.width)
                .background(Color.white.opacity(Double(itemOpacity)))
            }.animation(.easeInOut)
        }
    }
}

struct ItemDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDisplayView()
    }
}
