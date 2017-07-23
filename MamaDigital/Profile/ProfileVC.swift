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

        getData()
        
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

    func setUserInfo() {
        userNameLabel.text = user.name
        babyNameLabel.text = baby.name
    }
    
    func getData() {
        
        API_Service.requestBabyInfo(onSuccess: { (baby) in
            self.baby = baby
            self.setUserInfo()
        }) { (error) in
            print(error ?? 0)
        }
    }
    
    @IBAction func goToBabyProfile(_ sender: UIButton) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let babyVC = sb.instantiateViewController(withIdentifier: "BabyProfileVC") as! BabyProfileVC
        babyVC.babyData = baby
        self.present(babyVC, animated: true, completion: nil)
    }
}
