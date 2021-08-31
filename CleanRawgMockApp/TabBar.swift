//
//  TabBar.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 30/08/21.
//

import UIKit
import CoreData

class TabBar:UITabBarController {
    
    var container: NSPersistentContainer!
    
    @IBOutlet weak var TabBarContent: UITabBar!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else { fatalError("This view needs a persistent container.") }
        print("it works!")
    }
}
