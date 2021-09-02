//
//  ViewController.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.
//

import UIKit
import SwiftUI
import CoreData

class ViewController: UIViewController {
    var container: NSPersistentContainer! // <-- i dont think i need this one
    var childView:UIHostingController = UIHostingController(
        rootView: AnyView(HomeView())
    )

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabBarVC = self.tabBarController as? TabBar {
            self.container = tabBarVC.container
        }
        view.addSubview(childView.view)
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childView.view.topAnchor.constraint(equalTo: view.topAnchor),
            childView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor), //
            childView.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            childView.view.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }


}


class myCoreData:ObservableObject {
    @Published var context = PersistentContainer().viewContext
}

