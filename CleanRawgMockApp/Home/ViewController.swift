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
    
    var container: NSPersistentContainer!
    let childView:UIHostingController = {
        return UIHostingController(rootView: HomeView())
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let favVC = segue.destination as? FavVC {
            favVC.container = container
        }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
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

