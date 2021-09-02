//
//  favView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 02/09/21.
//

import SwiftUI

struct favView: View {
    @StateObject var favLa = favVM()
    var body: some View {
        VStack {
            Button("Add"){
                favLa.addNew(ItemPreviewModel(id: 2, slug: "@@", name: "my name is", image: "theimage", released: "2020", desc: "makan bang", rating: 2.0, rank: 3))
            }
            Button("refresh"){
                favLa.fetchData()
            }
            Button("Delete ALL"){
                favLa.deleteAllItems()
            }
            
        }
    }
}

struct favView_Previews: PreviewProvider {
    static var previews: some View {
        favView()
    }
}
