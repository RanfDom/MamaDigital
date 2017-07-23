//
//  ProfileView.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 22/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import UIKit



class ProfileView: UIView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var babiesContainerView: UIView!
    @IBOutlet weak var babyButton: UIButton!
    @IBOutlet weak var babyNameLabel: UILabel!
    
    var myBaby:Baby?
    
    init(frame:CGRect ,_ user : User?) {
        super.init(frame: frame)
        myBaby = user?.baby
        userNameLabel.text = user?.name
        babyNameLabel.text = myBaby?.name
        initialViewConfig()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialViewConfig() {
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        babyButton.layer.cornerRadius = babyButton.frame.width/2
    }
    
    @IBAction func goToBabyInfo(_ sender: UIButton) {
    }
}
