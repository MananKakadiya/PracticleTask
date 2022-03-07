//
//  Utilities.swift
//  Test
//
//  Created by Manan Kakadiya on 07/03/22.
//

import Foundation
import UIKit
import ContactsUI

class Utilities : NSObject {
    class func showAlertWithMessage(title : String, message : String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil));
            UIViewController.current().present(alert, animated: true, completion: nil)
        }
    }
    
    class func makeButton(title: String? = nil,
                    titleColor: UIColor = .black,
                    font: UIFont? = nil,
                    background: UIColor = .clear,
                    backgroundImage: String? = nil,
                    cornerRadius: CGFloat = 0,
                    borderWidth: CGFloat = 0) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = background
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.setBackgroundImage(UIImage(named: "\(backgroundImage ?? "")"), for: .normal)
        return button
    }
    
    class func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }
    
    class func makeCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    class func makeLabel(font: UIFont? = nil,
                    background: UIColor = .clear,
                    cornerRadius: CGFloat = 0,
                    borderWidth: CGFloat = 0,
                    borderColor: UIColor = .clear) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = background
        label.font = font
        label.layer.cornerRadius = cornerRadius
        label.layer.borderWidth = borderWidth
        return label
    }
    
    class func makeImageView(background: UIColor? = .clear, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = background
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.borderWidth = borderWidth
        imageView.layer.borderColor = borderColor.cgColor
        return imageView
    }
    
    class func getContacts() -> [CNContact] {

            let contactStore = CNContactStore()
            let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactPhoneNumbersKey,
                CNContactEmailAddressesKey,
                CNContactThumbnailImageDataKey] as [Any]

            var allContainers: [CNContainer] = []
            do {
                allContainers = try contactStore.containers(matching: nil)
            } catch {
                print("Error fetching containers")
            }

            var results: [CNContact] = []

            for container in allContainers {
                let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

                do {
                    let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                    results.append(contentsOf: containerResults)
                } catch {
                    print("Error fetching containers")
                }
            }
            return results
        }
}
