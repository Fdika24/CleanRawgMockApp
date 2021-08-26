//
//  SearchView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 25/08/21.
// iNGETIN BUAT TEST PAKE NARUTOLALA

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var searchingItems = Searching()
    
    init() {
    }
    var body: some View {
        VStack{
            HStack {
                if searchingItems.searching == "" {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black.opacity(0.5))
                        .animation(.easeInOut)
                }
                TextField("Search",text:$searchingItems.searching,onCommit:{searchingItems.fetchData()})
                    .animation(.easeInOut)
            }
            .padding(5)
            .padding(.horizontal,4)
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            Button("send"){
                searchingItems.fetchData()
            }
            List{
                ForEach(searchingItems.searchedItems){ data in
                    listContentItem(name: data.name ?? "", image: data.image ?? "", released: data.released ?? "").onAppear{
                        searchingItems.append(item: data)
                    }
                }
                if searchingItems.State == .loading {
                    ProgressView()
                }
                if searchingItems.State == .failed {
                    Text("Whoops! Looks like there's a problem with our database")
                }
            }
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
