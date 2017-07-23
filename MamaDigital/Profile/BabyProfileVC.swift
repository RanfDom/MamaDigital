//
//  BabyProfileVC.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 23/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import UIKit

class BabyProfileVC: UIViewController {

    @IBOutlet weak var babyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigView()
    }
    
    func initialConfigView() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBack)))
        babyImage.layer.cornerRadius = babyImage.frame.width/2
        babyImage.clipsToBounds = true
    }

    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
