//
//  SearchVM.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 25/08/21.
//

import Foundation
import Combine

class Searching:ObservableObject {
    
    enum state {
        case load,failed,loading
    }
    
    enum appendState {
        case append,new
    }
    
    @Published var searchedItems = [Result]()
    @Published var State:state = .load
    @Published var searching = "dota"
    
    private var myAPI = Api()
    private var cancellables = Set<AnyCancellable>()
    private var page = 1
    
    init() {
    }
    
    func fetchData(kase:appendState = .new) {
        self.State = .loading
        let path = {() -> URLComponents in
            self.myAPI.link!.path = "/api/games"
            self.myAPI.link!.queryItems = [
                URLQueryItem(name: "key", value: self.myAPI.key),
                URLQueryItem(name: "page", value: String(self.page)),
                URLQueryItem(name: "search", value: self.searching),
            ]
            return myAPI.link!
        }()
        
        let request = URLRequest(url: path.url!)
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data,response) -> Data in 
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    self.State = .failed
                    throw URLError(.badURL)
                }
                return data
            }
            .decode(type: Search.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink {[weak self] complete in
                switch complete {
                case .finished :
                    print("Page \(self?.page ?? 0) is \(complete)")
                case .failure(let error):
                    self?.State = .failed
                    print("Page \(self?.page ?? 0) is \(error)")
                }
            } receiveValue: { [weak self] result in
                if kase == .append {
                    self?.searchedItems += result.results
                } else {
                    self?.searchedItems = result.results
                }
                self?.State = .load
            }
            .store(in: &cancellables)
    }
    
    
    func append(item:Result?) {
        guard let item = item else {
            fetchData()
            return
        }
        let itemIdx = searchedItems.index(searchedItems.endIndex,offsetBy: -5)
        if searchedItems.firstIndex(where: {$0.id == item.id}) == itemIdx {
            self.page += 1
            fetchData(kase: .append)
        }
    }
}

