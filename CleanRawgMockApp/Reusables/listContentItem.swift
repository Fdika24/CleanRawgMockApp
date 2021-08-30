//
//  listContentItem.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 25/08/21.
//

import SwiftUI


struct listContentItem: View {
    let name:String
    let image:String
    let released:String
    
    init(name:String,image:String,released:String) {
        self.name = name
        self.image = image
        self.released = released
    }
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

