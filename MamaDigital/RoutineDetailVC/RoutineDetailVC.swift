//
//  RoutineDetailVC.swift
//  MamaDigital
//
//  Created by Daniel Serrano on 14/07/17.
//  Copyright © 2017 Ranfelabs. All rights reserved.
//

import UIKit

class RoutineDetailVC: UITableViewController {

    var stepsArray = ["step1","step2","step3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleController = UILabel()
        titleController.text = "Practica diaria"
        titleController.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        titleController.textAlignment = .center
        titleController.textColor = UIColor.init(red: 95/255, green: 94/255, blue: 95/255, alpha: 1)
        titleController.font = UIFont(name: "Futura-Bold", size: 18)
        
        self.navigationItem.titleView = titleController
    }
}

// MARK: - TableView Datasource
extension RoutineDetailVC{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }else if section == 1{
            return 2
        }else{
            return stepsArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 1:
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionViewCellID", for: indexPath) as! DescriptionViewCell
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentViewCellID", for: indexPath) as! EquipmentViewCell
                return cell

            }
        default:
            let stepCell = tableView.dequeueReusableCell(withIdentifier: "StepsViewCellID", for: indexPath) as! StepsViewCell
            stepCell.selectionStyle = .none
            stepCell.stepImage.image = UIImage(named: stepsArray[indexPath.row])
            return stepCell
        }
    }
}

// MARK: - TableView Delegates
extension RoutineDetailVC{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            return 150
        }else if indexPath.section == 1{
            return 138
        }else{
            return 95
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerDesLabel = UILabel()
        headerDesLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        headerDesLabel.font = UIFont(name: "Avenir-Heavy", size: 18)
        
        headerView.addSubview(headerDesLabel)
        
        if section == 0{
            let headerView = HeaderTableView()
            return headerView
        }else if section == 1{
            headerDesLabel.text = ""
            return headerView
        }else{
            headerDesLabel.text = " Pasos"
            headerDesLabel.backgroundColor = .white
            return headerDesLabel
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 380
        }else if section == 1{
            return 1
        }else{
            return 30
        }
    }
}
