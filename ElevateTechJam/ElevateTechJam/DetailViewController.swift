//
//  DetailViewController.swift
//  ElevateTechJam
//
//  Created by Kunal Kumar on 2019-09-21.
//  Copyright © 2019 TD. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var familyTableView: FamilyTableView!
    
    var memberData: MemberDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.familyTableView.register(UINib(nibName: "ConnectionDetailCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.familyTableView.delegate = self
        self.familyTableView.dataSource = self
        self.familyTableView.estimatedRowHeight = 150
        self.familyTableView.rowHeight = UITableView.automaticDimension
        //self.familyTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memberData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ConnectionDetailCellTableViewCell
        cell.tag = indexPath.row
        cell.detailVC = self
        
        let userData = self.memberData?.data[indexPath.row]
        cell.cardData = userData

        return cell
    }

    func moveFromCell(cell:ConnectionDetailCellTableViewCell, index: Int) {

        let optionMenu = UIAlertController(title: nil, message: "Move to Card", preferredStyle: .actionSheet)

        for card: CardDetail in self.memberData!.data {
            let cardAction = UIAlertAction(title: card.card, style: .default) { (action: UIAlertAction) in
                let userData = self.memberData!.data[cell.tag].data.remove(at: index)
                let index = self.memberData!.indexOfCardWithNumber(number: card.card!)
                self.memberData!.data[index].data.append(userData)
                self.familyTableView.reloadData()
            }
            optionMenu.addAction(cardAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(cancelAction)

        // 5
        self.present(optionMenu, animated: true, completion: nil)


    }
}


