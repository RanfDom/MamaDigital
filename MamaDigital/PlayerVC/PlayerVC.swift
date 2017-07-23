//
//  PlayerVC.swift
//  MamaDigital
//
//  Created by Ranferi Dominguez on 7/23/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayerVC: UIViewController {
    
    var player : AVPlayer?
    var video_URL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url : URL = URL(string: video_URL!)!
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        
        player?.play()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true) { 
            self.player?.pause()
        }
    }
}
