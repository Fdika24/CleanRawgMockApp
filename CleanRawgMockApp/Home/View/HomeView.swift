//
//  HomeView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.
//

import SwiftUI

struct Item: Identifiable {
    let id: String
    
    init() {
        id = UUID().uuidString
    }
}

struct HomeView: View {
    @State
        var items = (0...100).map { _ in Item() }
    @StateObject var homeTopPicks = TopPicks()
    @StateObject var homeContent = MainContentHome()
    @ViewBuilder var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing:0){
                    //MARK: Top Content of HomeView
                    // This view represent a content located on the very top of homeview
                    HomeViewTopContent()
                    //MARK: Slide View of HomeView
                    if homeTopPicks.topPicks.count == 0 {
                        ShimmerView(baseColor: .gray)
                            .frame(width:UIScreen.width,height: 230)
                    } else {
                        TabView{
                            ForEach(homeTopPicks.topPicks){data in
                                Button(action: {print("Tapped..")}) {
                                    RemoteImage(url: data.image ?? "")
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width:UIScreen.width,height: 230)
                                }
                            }
                        }
                        .frame(width:UIScreen.width,height: 230)
                        .tabViewStyle(PageTabViewStyle())
                    }
                    //MARK: Main content - kudu di perbaikin
                    if homeContent.State == .idle {
                            ListItemShimmer()
                                .padding(.top)
                                .padding(.horizontal)
                                .padding(.bottom,5)
                            Divider()
                        }
                    ForEach(homeContent.MainContent){data in
                        homeContentItem(name: data.name ?? "", image: data.image ?? "", released: data.released ?? "")
                            .padding(.top,10)
                            .padding(.horizontal)
                            .padding(.bottom,5)
                        Divider()
                    }
                    if homeContent.State == .loading {
                        ProgressView()
                            .onAppear{
                                homeContent.fetchAPI()
                            }
                    }
                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.width, height: UIScreen.height)
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

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

struct homeContentItem: View {
    let name:String
    let image:String
    let released:String
    var body: some View {
        HStack{
            RemoteImage(url: image)
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill )
            VStack(alignment:.leading) {
                Text(name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(released)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.top)
    }
}
