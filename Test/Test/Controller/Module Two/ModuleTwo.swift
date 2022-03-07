//
//  ModuleTwo.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import UIKit
import Kingfisher

class ModuleTwo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var photoTblView = Utilities.makeTableView()
    var apiData = [PhotoModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let btnBack = Utilities.makeButton(title: "Back", titleColor: .blue, font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0)
        view.addSubview(btnBack)
        btnBack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnBack.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        btnBack.addTarget(self, action: #selector(btnBack_Clicked(_ :)), for: .touchUpInside)
        
        
        
        
        photoTblView.dataSource = self
        photoTblView.delegate = self
        self.view.addSubview(photoTblView)
        
        photoTblView.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 10).isActive = true
        photoTblView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        photoTblView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        photoTblView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
        photoTblView.register(photoCell.self, forCellReuseIdentifier: "photoCell")
        
        photoTblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath as IndexPath) as! photoCell
        DispatchQueue.main.async {
            let model = self.apiData[indexPath.row]
            cell.lblTitle.text = "\(model.title ?? "")"
            let url = URL(string: "\(model.thumbnailUrl ?? "")")
            cell.imgView.kf.setImage(with: url)
            self.photoTblView.reloadData()
            
        }
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120.00
        }
    
    @objc func btnBack_Clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
