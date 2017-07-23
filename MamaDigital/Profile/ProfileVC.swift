//
//  ProfileVC.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 22/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var babyContainerView: UIView!
    @IBOutlet weak var babyButton: UIView!
    @IBOutlet weak var babyNameLabel: UILabel!
    
    var baby:Baby!
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialConfigView()
    }
    
    func initialConfigView() {
        baby = Baby(name: "Alfreo", age: "5 meces")
        user = User(name: "Ranferi", email: "ranfo@hola.com", baby: baby)
        
        userNameLabel.text = user.name
        babyNameLabel.text = baby.name
    
        userImage.layer.cornerRadius = userImage.frame.width/2
        userImage.clipsToBounds = true
        babyButton.layer.cornerRadius = babyButton.frame.width/2
        babyButton.clipsToBounds = true
    }

}
