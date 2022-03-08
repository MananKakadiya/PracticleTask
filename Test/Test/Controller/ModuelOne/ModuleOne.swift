//
//  ModuleOne.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import UIKit
import ContactsUI

class ModuleOne: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var phoneContacts = [PhoneContactModel]()
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let addContact = CNMutableContact()
    
    let collView = UIViews.makeCollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        for contact in Utilities.getContacts() {
            phoneContacts.append(PhoneContactModel(contact: contact))
        }
        
        let btnBack = UIViews.makeButton(title: "Back", titleColor: .blue, font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0)
        view.addSubview(btnBack)
        btnBack.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
        btnBack.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 80 : 120).isActive = true
        btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        btnBack.addTarget(self, action: #selector(btnBack_Clicked(_ :)), for: .touchUpInside)
        
       
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collView.setCollectionViewLayout(layout, animated: true)
        collView.dataSource = self
        collView.delegate = self
        self.view.addSubview(collView)

        collView.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
        collView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
        collView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        collView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34).isActive = true
        collView.register(phoneCell.self, forCellWithReuseIdentifier: "phoneCell")
        
        let btnAddContact = UIViews.makeButton(titleColor: .blue, font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white,backgroundImage: "addNumber", cornerRadius: 0.0, borderWidth: 0.0)
        view.addSubview(btnAddContact)
        btnAddContact.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
        btnAddContact.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 50 : 80).isActive = true
        btnAddContact.rightAnchor.constraint(equalTo: view.rightAnchor, constant: DEVICE.IS_IPHONE ? -20 : -35).isActive = true
        btnAddContact.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: DEVICE.IS_IPHONE ? -55 : -70).isActive = true
        btnAddContact.addTarget(self, action: #selector(btnAddContact_Clicked(_ :)), for: .touchUpInside)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phoneContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = phoneContacts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "phoneCell", for: indexPath as IndexPath) as! phoneCell
        cell.contentView.layer.borderWidth = 1
        cell.lblName.text = "\(model.name ?? "")"
        cell.lblNumber.text = "\(model.phoneNumber.first ?? "")"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width/2.0) - 2
        return CGSize(width: width, height: DEVICE.IS_IPHONE ? 130 : 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return DEVICE.IS_IPHONE ? 5 : 8
    }
    
    @objc func btnBack_Clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnAddContact_Clicked(_ sender: UIButton) {
        print("Add number")
        let alertController = UIAlertController(title: "Add New Contact Number", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter name here"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter number here"
        }
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
            let nameTextField = alertController.textFields![0] as UITextField
            let numberTextField = alertController.textFields![1] as UITextField
            if let name = nameTextField.text {
                if name.isBlank{
                    Utilities.showAlertWithMessage(title: StringConstants.AlertViewTitle, message: StringConstants.AlertMessages.enterName)
                    return
                }
            }
            if let phone = numberTextField.text {
                if phone.isBlank {
                    Utilities.showAlertWithMessage(title: StringConstants.AlertViewTitle, message: StringConstants.AlertMessages.enterNumber)
                    return
                }
                if phone.count < 10 {
                    Utilities.showAlertWithMessage(title: StringConstants.AlertViewTitle, message: StringConstants.AlertMessages.enterValidNumber)
                    return
                }
            }
            self.addContact.givenName.append("\(nameTextField.text!)")
            self.addContact.phoneNumbers.append(contentsOf: [CNLabeledValue(label:CNLabelPhoneNumberiPhone, value:CNPhoneNumber(stringValue:"\(numberTextField.text!)"))])
            
            self.phoneContacts.append(PhoneContactModel(contact: self.addContact))

            self.collView.reloadData()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

