//
//  HomeView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.
//

import SwiftUI

struct HomeView: View {
   // @Environment(\.managedObjectContext) var managedObjectContext:myCoreData
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var homeTopPicks = TopPicks()
    @StateObject var homeContent = MainContentHome()
    @ViewBuilder var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing:0){
                    //MARK: Top Content of HomeView
                    // This view represent a content located on the very top of homeview
                    HomeViewTopContent()
                    //TextField("makan",text:$userProfile.name)
                   // Button("Save"){
                        //ProfileModel.name = self.userProfile
                    //}
                    //MARK: Slide View of HomeView
                    if homeTopPicks.topPicks.count == 0 {
                        ShimmerView(baseColor: .gray)
                            .frame(width:UIScreen.width,height: 300)
                    } else {
                        TabView{
                            ForEach(homeTopPicks.topPicks){data in
                                Button(action: {print("Tapped..")}) {
                                    RemoteImage(url: data.image ?? "")
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width:UIScreen.width,height: 300)
                                }
                            }
                        }
                        .frame(width:UIScreen.width,height: 300)
                        .tabViewStyle(PageTabViewStyle())
                    }
                    //MARK: Main content - fixed
                    if homeContent.State == .idle {
                            ListItemShimmer()
                                .padding(.top)
                                .padding(.horizontal)
                                .padding(.bottom,5)
                            Divider()
                        }
                    LazyVStack{
                        ForEach(homeContent.MainContent){data in
                            listContentItem(name: data.name ?? "", image: data.image ?? "", released: data.released ?? "")
                                .padding(.top,10)
                                .padding(.horizontal)
                                .padding(.bottom,5)
                                .onAppear{
                                    homeContent.appendData(currentItem: data)
                                }
                            Divider()
                        }
                    }
                    if homeContent.State == .loading {
                        ProgressView()
                    }
                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.width, height: UIScreen.height)
        .ignoresSafeArea()
    }
}
/*
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
*/
