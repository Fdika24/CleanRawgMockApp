//
//  FavVM.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 01/09/21.
//

import Foundation


class favVM:ObservableObject {
    @Published var items = [ItemPreviewModel]()
    @Published var showAlert = false
    private lazy var persistanceProvider:PersistanceProvider = {
        return PersistanceProvider()
    }()
    init() {
        print("Initialize.............\n")
        fetchData()
    }
    
    func fetchData(){
        self.persistanceProvider.getAllFav {[weak self] items in
            DispatchQueue.main.async {
                self?.items = items
                print("items : \(items) \n")
                print("Initialize.............\n")
            }
        }
    }
    func addNew(_ item:ItemPreviewModel){
        self.persistanceProvider.createNewFav(id: item.id!, slug: item.slug!, name: item.name!, image: item.image!, released: item.released!, desc: item.desc!, rating: item.rating!) {
            print("New item added into the database")
            self.fetchData()
        }
    }
    
    func deleteAllItems() {
        self.persistanceProvider.deleteAll {
            print("all deleted...")
        }
    }
}
