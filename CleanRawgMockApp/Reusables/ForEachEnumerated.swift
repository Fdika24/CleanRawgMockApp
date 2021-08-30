//
//  ForEachEnumerated.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 23/08/21.
//

import SwiftUI

struct ForEachEnumerated<Data: RandomAccessCollection, Content: View, ID: Hashable>: View {
    let data: [EnumeratedSequence<Data>.Element]
    let content: (Int, Data.Element) -> Content
    let id: KeyPath<EnumeratedSequence<Data>.Element, ID>
    
    init(_ data: Data, @ViewBuilder content: @escaping (Int, Data.Element) -> Content) where Data.Element: Identifiable, ID == Data.Element.ID {
        self.data = Array(data.enumerated())
        self.content = content
        self.id = \.element.id
    }

    var body: some View {
        ForEach(data, id: id) { element in
            content(element.offset, element.element)
        }
    }
}
