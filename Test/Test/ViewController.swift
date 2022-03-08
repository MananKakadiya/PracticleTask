//
//  ViewController.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnModuleOne = UIViews.makeButton(title: "Module 1", titleColor: .black, font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 3.0, borderWidth: 2)
        view.addSubview(btnModuleOne)
        // Adding Constraints
        btnModuleOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnModuleOne.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btnModuleOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        btnModuleOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        btnModuleOne.addTarget(self, action: #selector(navigateToModuleOne(_ :)), for: .touchUpInside)
        
        
        let btnModuleTwo = UIViews.makeButton(title: "Module 2", titleColor: .black, font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 3.0, borderWidth: 2)
        view.addSubview(btnModuleTwo)
        
        btnModuleTwo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnModuleTwo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btnModuleTwo.topAnchor.constraint(equalTo: btnModuleOne.bottomAnchor, constant: 20).isActive = true
        btnModuleTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        btnModuleTwo.addTarget(self, action: #selector(navigateToModuleTwo(_ :)), for: .touchUpInside)
        
    }
    
    @objc func navigateToModuleOne(_ sender: UIButton) {
        let vc = ModuleOne()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigateToModuleTwo(_ sender: UIButton) {
        print("Pressed")
        
        NetworkClient.shared.callGETApi(url: StringConstants.baseURL) {responseData in
            if let model = self.Decode(modelClass: [PhotoModel].self, from: responseData){
                print(model)
                DispatchQueue.main.async {
                    let vc = ModuleTwo()
                    vc.apiData = model
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}

