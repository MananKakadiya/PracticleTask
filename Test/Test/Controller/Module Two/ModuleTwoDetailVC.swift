//
//  ModuleTwoDetailVC.swift
//  Test
//
//  Created by Manan Kakadiya on 08/03/22.
//

import UIKit

class ModuleTwoDetailVC: UIViewController {
    var model : PhotoModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


//MARK: Other Viewcontroller's Method
extension ModuleTwoDetailVC {
    func initialSetUp(){
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            
            let navigationView = UIViews.makeView(background: .white, cornerRadius: 0, borderWidth: 0)
            self.view.addSubview(navigationView)
            
            navigationView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 44).isActive = true
            navigationView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
            navigationView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
            navigationView.heightAnchor.constraint(greaterThanOrEqualToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
            
            
            let btnBack = UIViews.makeButton(title: "Back", titleColor: .blue, font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0)
            navigationView.addSubview(btnBack)
            btnBack.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 80 : 120).isActive = true
            btnBack.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 40 : 60).isActive = true
            btnBack.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 0).isActive = true
            btnBack.leftAnchor.constraint(equalTo: navigationView.leftAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
            btnBack.addTarget(self, action: #selector(self.btnBack_Clicked(_ :)), for: .touchUpInside)
            
            let titelLabel = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
            self.view.addSubview(titelLabel)
            
            titelLabel.topAnchor.constraint(equalTo: btnBack.topAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
            titelLabel.leftAnchor.constraint(equalTo: btnBack.rightAnchor, constant: DEVICE.IS_IPHONE ? 8 : 12).isActive = true
            titelLabel.rightAnchor.constraint(equalTo: navigationView.rightAnchor, constant: DEVICE.IS_IPHONE ? -10 : -15).isActive = true
            titelLabel.numberOfLines = 0
            
            titelLabel.text = "\(self.model?.title ?? "")"
            
            
            let imageView = UIViews.makeImageView(background: .white, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
            self.view.addSubview(imageView)
            imageView.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 250 : 400).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 250 : 400).isActive = true
            imageView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: DEVICE.IS_IPHONE ? 30 : 45).isActive = true
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true

            let url = URL(string: "\(self.model?.url ?? "")")
            imageView.kf.setImage(with: url)
//
            
            let staticURL = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
            staticURL.text = ("URL: ")
            self.view.addSubview(staticURL)
            staticURL.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
            staticURL.topAnchor.constraint(equalTo:  imageView.bottomAnchor, constant: DEVICE.IS_IPHONE ? 20 : 35).isActive = true
            staticURL.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: DEVICE.IS_IPHONE ? 15 : 25).isActive = true
            staticURL.numberOfLines = 1
            
            
            let lblURL = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
            lblURL.text = "\(self.model?.url ?? "")"
            self.view.addSubview(lblURL)
            
            lblURL.topAnchor.constraint(equalTo: staticURL.topAnchor, constant: 0).isActive = true
            lblURL.leftAnchor.constraint(equalTo: staticURL.rightAnchor, constant: 0).isActive = true
            lblURL.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: DEVICE.IS_IPHONE ? -10 : -15).isActive = true
            lblURL.numberOfLines = 0
            
            
        }
    }
}

//MARK: Button Action
extension ModuleTwoDetailVC {
    @objc func btnBack_Clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
