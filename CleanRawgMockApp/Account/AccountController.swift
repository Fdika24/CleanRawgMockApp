//
//  AccountController.swift
//  CleanRawgMockApp
//
//  Created by Farhandika Zahrir Mufti guenia on 21/08/21.
//

import UIKit


class AccountController:UIViewController  {
    @IBOutlet weak var UserDetails: UILabel! 
    @IBOutlet weak var UserName: UILabel!
    
    @IBOutlet weak var ProfilePicture: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AccountController {
    @IBAction func EditProfileButton(_ sender: UIButton) {
        UserName.text = "Makabn bang"
        ProfilePicture.image = UIImage(named: "Dika")
        print("Pressed....")
    }
}
