//
//  UIViews.swift
//  Test
//
//  Created by Manan Kakadiya on 08/03/22.
//

import Foundation

class UIViews: NSObject {
    
    class func makeView(background: UIColor = .clear,
                    cornerRadius: CGFloat = 0,
                    borderWidth: CGFloat = 0) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = background
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        return view
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
}
