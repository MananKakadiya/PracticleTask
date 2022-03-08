//
//  PhotoCell.swift
//  Test
//
//  Created by Manan Kakadiya on 08/03/22.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {
    
    let staticTitle = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
    let lblTitle = UIViews.makeLabel(font: UIFont.init(name: "Arial", size: DEVICE.IS_IPHONE ? 15.0 : 20.0), background: .white, cornerRadius: 0.0, borderWidth: 0.0, borderColor: .clear)
    
    let imgView = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    func addViews(){
        staticTitle.text = "Title: "
        addSubview(imgView)
        addSubview(staticTitle)
        addSubview(lblTitle)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leftAnchor.constraint(equalTo: leftAnchor, constant: DEVICE.IS_IPHONE ? 15 : 25).isActive = true
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: DEVICE.IS_IPHONE ? 15 : 25).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 100 : 120).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: DEVICE.IS_IPHONE ? 100 : 120).isActive = true
        
        staticTitle.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: DEVICE.IS_IPHONE ? 10 : 15).isActive = true
        staticTitle.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 0).isActive = true

        lblTitle.leftAnchor.constraint(equalTo: staticTitle.rightAnchor, constant: 0).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: DEVICE.IS_IPHONE ? -10 : -15).isActive = true
        lblTitle.topAnchor.constraint(equalTo: staticTitle.topAnchor).isActive = true
        lblTitle.numberOfLines = 0

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
