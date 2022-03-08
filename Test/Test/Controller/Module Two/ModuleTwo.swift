//
//  ModuleTwo.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import UIKit
import Kingfisher

class ModuleTwo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var photoTblView = UIViews.makeTableView()
    var apiData = [PhotoModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let btnBack = UIViews.makeButton(title: "Back", titleColor: .blue, font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0)
        view.addSubview(btnBack)
        btnBack.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
        btnBack.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 80 : 120).isActive = true
        btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        btnBack.addTarget(self, action: #selector(btnBack_Clicked(_ :)), for: .touchUpInside)
        
        
        
        
        photoTblView.dataSource = self
        photoTblView.delegate = self
        photoTblView.prefetchDataSource = self
        self.view.addSubview(photoTblView)
        
        photoTblView.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
        photoTblView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
        photoTblView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: DEVICE.IS_IPHONE ? -10 : -15).isActive = true
        photoTblView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
        photoTblView.register(photoCell.self, forCellReuseIdentifier: "photoCell")
        
        photoTblView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
                self.photoTblView.es.addPullToRefresh {
                    self.pullToRefresh()
                }
        }
    }
    
    func pullToRefresh(){
       
        apiData.removeAll()
        NetworkClient.shared.callGETApi(url: StringConstants.baseURL) {responseData in
            if let model = self.Decode(modelClass: [PhotoModel].self, from: responseData){
                print(model)
                DispatchQueue.main.async {
                    self.apiData = model
                    self.reloadData()
                }
            }
        }
    }
    
    func reloadData(){
        self.photoTblView.es.stopLoadingMore()
        self.photoTblView.es.stopPullToRefresh()
        photoTblView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        let model = apiData[indexPath.row]
        let vc = ModuleTwoDetailVC()
        vc.model = model
        self.navigationController?.pushViewController(vc, animated: true)
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
            
            cell.selectionStyle = .none
            
        }
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return DEVICE.IS_IPHONE ? 120 : 180
        }
    
    @objc func btnBack_Clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ModuleTwo: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetchRowsAt \(indexPaths)")
       
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt \(indexPaths)")
        
    }
}
