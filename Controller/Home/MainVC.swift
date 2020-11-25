//
//  MainVC.swift
//  Collection-In-Tableview
//
//  Created by Mahmoud Sherbeny on 11/22/20.
//

import UIKit

protocol delegte {
    func cellTapped(isTapped: Int)
}

class MainVC: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        tableView.register(UINib(nibName: "FeatureCell", bundle: nil), forCellReuseIdentifier: "FeatureCell")
        tableView.register(UINib(nibName: "PickCell", bundle: nil), forCellReuseIdentifier: "PickCell")
        tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
    }
    
    //MARK: - Helper Function
    func setupUI() {
        title = "Main"
        tableView.allowsSelection = false
        tableView.tableHeaderView = setupTableHeader()
    }
    
    func setupTableHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 40))
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        let menuBtn = UIButton()
        let forYouBtn = UIButton()
        let eventBtn = UIButton()
        
        menuBtn.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        forYouBtn.setTitle("For You", for: .normal)
        eventBtn.setTitle("Event", for: .normal)
        
        menuBtn.tintColor = .black
        forYouBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        eventBtn.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        
        forYouBtn.titleLabel!.font = UIFont(name: "Arial" , size: 16)
        eventBtn.titleLabel!.font = UIFont(name: "Arial" , size: 16)
        
        stackView.addArrangedSubview(menuBtn)
        stackView.addArrangedSubview(forYouBtn)
        stackView.addArrangedSubview(eventBtn)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
                                        stackView.topAnchor.constraint(equalTo: headerView.topAnchor),
                                        stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
                                        stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
                                        stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -50)])
        
        return headerView
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let backView = UIView()
        let headetTitile = UILabel(frame: CGRect(x: 20.0, y: 5.0 , width: SCREENWIDTH - 40.0, height: 20.0))
        
        backView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        if section == 0 {
            headetTitile.text = "Feature Art World"
        } else if section == 1 {
            headetTitile.text = "Pick for you"
        } else {
            headetTitile.text = "Categories"
        }
        
        backView.addSubview(headetTitile)
        return backView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickCell", for: indexPath) as! PickCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
            cell.delegate = self
            return cell
        }
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return SCREENHEIGHT / 6
        } else if indexPath.section == 1 {
            return SCREENHEIGHT / 2
        } else {
            return SCREENHEIGHT / 7
        }
    }
}

extension MainVC: delegte {
    func cellTapped(isTapped: Int) {
        let VC = DetailsVC()
        VC.title = "Tapped \(isTapped)"
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
