//
//  SearchView.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 25/08/21.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView() {
            LazyVStack(spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Column \($0)")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
