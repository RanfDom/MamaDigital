//
//  EquipmentViewCell.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 14/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import UIKit

class EquipmentViewCell: UITableViewCell {

    @IBOutlet weak var equipmnetCollectionView: UICollectionView!
    var eqImages:[String] = ["eq1","eq2","eq3","eq4","eq1"]

    override func awakeFromNib() {
        equipmnetCollectionView.delegate = self
        equipmnetCollectionView.dataSource = self
    
    }
}

extension EquipmentViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eqImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EquipmentCollectionCellID", for: indexPath) as! EquipmentCollectionCell
        
        cell.eqImage.image = UIImage(named: eqImages[indexPath.row])
        return cell
    }
    
}

extension EquipmentViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let itemWidth = (collectionView.bounds.width / itemsPerRow)-8
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
