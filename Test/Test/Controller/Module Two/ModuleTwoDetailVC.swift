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
        
        self.view.backgroundColor = .white
        let navigationView = UIViews.makeView(background: .white, cornerRadius: 0, borderWidth: 0)
        view.addSubview(navigationView)
        
        navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        navigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        navigationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        navigationView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        
        let btnBack = UIViews.makeButton(title: "Back", titleColor: .blue, font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0)
        navigationView.addSubview(btnBack)
        btnBack.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btnBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnBack.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 0).isActive = true
        btnBack.leftAnchor.constraint(equalTo: navigationView.leftAnchor, constant: 10).isActive = true
        btnBack.addTarget(self, action: #selector(btnBack_Clicked(_ :)), for: .touchUpInside)
        
        let titelLabel = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
        view.addSubview(titelLabel)
        
        titelLabel.topAnchor.constraint(equalTo: btnBack.topAnchor, constant: 10).isActive = true
        titelLabel.leftAnchor.constraint(equalTo: btnBack.rightAnchor, constant: 8).isActive = true
        titelLabel.rightAnchor.constraint(equalTo: navigationView.rightAnchor, constant: -10).isActive = true
        titelLabel.numberOfLines = 0

        titelLabel.text = "\(model?.title ?? "")"
        
        
        let imageView = UIViews.makeImageView(background: .white, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        view.addSubview(imageView)
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

        let url = URL(string: "\(model?.url ?? "")")
        imageView.kf.setImage(with: url)
        
        
        let staticURL = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
        view.addSubview(staticURL)
        staticURL.widthAnchor.constraint(equalToConstant: 50).isActive = true
        staticURL.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 20).isActive = true
        staticURL.leftAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        staticURL.text = ("URL: ")
        
        let lblURL = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
        view.addSubview(lblURL)
        
        lblURL.topAnchor.constraint(equalTo: staticURL.topAnchor, constant: 0).isActive = true
        lblURL.leftAnchor.constraint(equalTo: staticURL.rightAnchor, constant: 0).isActive = true
        lblURL.rightAnchor.constraint(equalTo: staticURL.rightAnchor, constant: -10).isActive = true
        lblURL.numberOfLines = 0
        lblURL.text = "\(model?.url ?? "")"
        
        
    }
    
    
    @objc func btnBack_Clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
