//
//  HeaderTableView.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 14/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import UIKit

class HeaderTableView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initView(){
        Bundle.main.loadNibNamed("HeaderTableView", owner: self, options: nil)
        guard (contentView) != nil else {return}
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        downloadButton.layer.cornerRadius = downloadButton.frame.width/2
    }
    
    
    // MARK: -Button functions
    @IBAction func downloadAction(_ sender: UIButton) {
        print("Super cara feliz :D")
    }
}
