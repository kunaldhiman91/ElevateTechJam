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
        if cell.tag == 0 {
            let userData = self.memberData!.data[0].data.remove(at: index)
            self.memberData!.data[1].data.append(userData)
        } else {
            let userData = self.memberData!.data[1].data.remove(at: index)
            self.memberData!.data[0].data.append(userData)
        }
        familyTableView.reloadData()
    }
}


