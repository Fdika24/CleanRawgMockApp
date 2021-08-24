//
//  ViewController.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    //SwiftUI View = ç
    let childView:UIHostingController = {
        return UIHostingController(rootView: HomeView())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(childView.view)
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childView.view.topAnchor.constraint(equalTo: view.topAnchor),
            childView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            childView.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            childView.view.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }


}

