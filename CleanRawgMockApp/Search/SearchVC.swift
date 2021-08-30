//
//  SearchVC.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 30/08/21.
//

import UIKit
import SwiftUI

class SearchVC: UIViewController {
    
    let childView:UIHostingController = {
        return UIHostingController(rootView: SearchView())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(childView.view)
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            childView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor), //
            childView.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            childView.view.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }


}

