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
        initialSetUp()
    }
    
    func initialSetUp(){
        let btnModuleOne = UIViews.makeButton(title: "Module 1", titleColor: .black, font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 3.0, borderWidth: 2)
        view.addSubview(btnModuleOne)
        // Adding Constraints
        btnModuleOne.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
        btnModuleOne.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 120 : 150).isActive = true
        btnModuleOne.topAnchor.constraint(equalTo: view.topAnchor, constant: DEVICE.IS_IPHONE ? 200 : 350).isActive = true
        btnModuleOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        btnModuleOne.addTarget(self, action: #selector(navigateToModuleOne(_ :)), for: .touchUpInside)
        
        
        let btnModuleTwo = UIViews.makeButton(title: "Module 2", titleColor: .black, font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 3.0, borderWidth: 2)
        view.addSubview(btnModuleTwo)
        
        btnModuleTwo.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
        btnModuleTwo.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 120 : 150).isActive = true
        btnModuleTwo.topAnchor.constraint(equalTo: btnModuleOne.bottomAnchor, constant: DEVICE.IS_IPHONE ? 20 : 30).isActive = true
        btnModuleTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        btnModuleTwo.addTarget(self, action: #selector(navigateToModuleTwo(_ :)), for: .touchUpInside)
        
    }

}


//MARK: Button Action:
extension ViewController{
    
    @objc func navigateToModuleOne(_ sender: UIButton) {
        let vc = ModuleOneVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigateToModuleTwo(_ sender: UIButton) {
        NetworkClient.shared.callGETApi(url: StringConstants.baseURL) {responseData in
            if let model = self.Decode(modelClass: [PhotoModel].self, from: responseData){
                print(model)
                DispatchQueue.main.async {
                    let vc = ModuleTwoVC()
                    vc.apiData = model
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
