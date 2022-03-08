//
//  PhoneCell.swift
//  Test
//
//  Created by Manan Kakadiya on 08/03/22.
//

import Foundation
import UIKit

class phoneCell: UICollectionViewCell {
    let staticName = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
    let lblName = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
    
    let staticNumber = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
    let lblNumber = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: 18.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addViews()
    }
    override init(frame: CGRect) {
           super.init(frame: frame)
           addViews()
       }
    func addViews(){
        staticName.text = "Name: "
        staticNumber.text = "Contact: "
        addSubview(staticName)
        addSubview(lblName)
        
        addSubview(staticNumber)
        addSubview(lblNumber)
        
        staticName.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        staticName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        
        lblName.leftAnchor.constraint(equalTo: staticName.rightAnchor, constant: 0).isActive = true
        lblName.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        lblName.topAnchor.constraint(equalTo: staticName.topAnchor).isActive = true
        lblName.numberOfLines = 0
        
        staticNumber.leftAnchor.constraint(equalTo: staticName.leftAnchor, constant: 0).isActive = true
        staticNumber.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 5).isActive = true
        
        lblNumber.leftAnchor.constraint(equalTo: staticNumber.rightAnchor, constant: 0).isActive = true
        lblNumber.rightAnchor.constraint(equalTo: lblName.rightAnchor, constant: -10).isActive = true
        lblNumber.topAnchor.constraint(equalTo: staticNumber.topAnchor).isActive = true
        lblNumber.numberOfLines = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

