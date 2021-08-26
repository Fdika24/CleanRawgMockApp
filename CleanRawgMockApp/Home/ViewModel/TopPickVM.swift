//
//  TopPickVM.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 22/08/21.
//

import Combine
import Foundation

class TopPicks:ObservableObject {
    
    enum viewState {
        case load,done,failed
    }
    
    @Published var topPicks = [TopPick]()
    @Published var state:viewState = .load
    private var myAPI = Api()
    private var cancellables = Set<AnyCancellable>()
    
    //Initialize when class is created, hope this works so that i dont have to add onAppear ?
    init(){
        fetchApi()
    }
    
    public func fetchApi() {
        //Need to work on a cleaner code
        let path = {() -> URLComponents in
            self.myAPI.link!.path = "/api/games"
            self.myAPI.link!.queryItems = [
                URLQueryItem(name: "key", value: self.myAPI.key),
                URLQueryItem(name: "ordering", value: "-rating")
            ]
            return myAPI.link!
        }()
        
        let request = URLRequest(url: path.url!)
        
        URLSession.shared.dataTaskPublisher(for: request) // This is publisher
            .subscribe(on: DispatchQueue.global(qos: .background)) // This to set it in the background process, eventhough by default in background
            .receive(on: DispatchQueue.main) // receiver
            .tryMap { (data,response) -> Data in //Maping the data
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    self.state = .failed
                    throw URLError(.badURL)
                }
                return data
            }
            .decode(type: HomeModelTopPicks.self, decoder: JSONDecoder())
            .sink { (complete) in
                switch complete{
                case .finished :
                    print("Top View Completion : \(complete)")
                case .failure(let error):
                    print("There's an error : \(error)")
                }
            } receiveValue: { [weak self] (result) in
                self?.state = .done
                self?.topPicks = result.results
            }
            .store(in: &cancellables)

    }
}
