//
//  LoadRemoteImage.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 22/08/21.
//

import SwiftUI
import Combine

struct RemoteImage:View {
    private enum State{
        case loading,done,failed
    }
    
    private class Loader:ObservableObject {
       @Published var data = Data()
       @Published var state:State = .loading
        private var cancellables = Set<AnyCancellable>()
        
        init(url:String) {
            fetchImage(url: url)
        }
        
        func fetchImage(url:String) {
            guard let url = URL(string: url) else {
                self.state = .failed
                print("\(url) is invalid")
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTaskPublisher(for: request)
                .subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.main)
                .tryMap {[weak self] (data,response) -> Data in
                    guard
                        let response = response as? HTTPURLResponse,
                        response.statusCode >= 200 && response.statusCode < 300 else {
                        self?.state = .failed
                        throw URLError(.badURL)
                    }
                    return data
                }
                .sink { (complete) in
                   // print("Image Completion : \(complete)")
                } receiveValue: {[weak self] (data) in
                    self?.data = data
                    self?.state = .done
                }
                .store(in: &cancellables)
        }
    }
    
    @StateObject private var loader:Loader
    var loading: AnyView
    var failure: Image
    
    init(url: String, failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = AnyView(ShimmerView(baseColor: .gray))
        self.failure = failure
    }
    
    @ViewBuilder var body: some View {
        VStack {
            switch loader.state {
            case .loading:
                loading
            case .failed:
                failure
            default:
                if let image = UIImage(data: loader.data) {
                    Image(uiImage: image).resizable()
                } else {
                    failure
                }
            }
        }
    }
}
