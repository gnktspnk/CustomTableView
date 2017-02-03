//
//  TableCell.swift
//  February1_Services
//
//  Created by Gennadii Tsypenko on 01.02.17.
//  Copyright © 2017 Gennadii Tsypenko. All rights reserved.
//

import UIKit

class TableCell : UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let idLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    var idUserLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(red: 151/255, green: 151/255, blue: 162/255, alpha: 1)
        return label
    }()
    var titleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.init(red: 211/255, green: 225/255, blue: 235/255, alpha: 0.2)
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.numberOfLines = 5
        return label
    }()
    var progressImage : UIImageView = {
       let image = UIImageView()
       image.contentMode = .scaleAspectFit
       image.clipsToBounds = true
       return image
    }()
    
    func setupViews(){
        backgroundColor = UIColor.white
        addSubview(idLabel)
        addSubview(idUserLabel)
        addSubview(titleLabel)
        addSubview(progressImage)
        //constraints
        addConstraintsWithFormat(format: "H:|-8-[v0]", views: idLabel)
        addConstraintsWithFormat(format: "H:[v0]-8-|", views: idUserLabel)
        addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:[v0]-8-|", views: progressImage)
        addConstraintsWithFormat(format: "V:|-8-[v0(24)]", views: idLabel)
        addConstraintsWithFormat(format: "V:[v0(24)]-8-|", views: progressImage)
        addConstraintsWithFormat(format: "V:|-8-[v0(24)]-8-[v1]-8-|", views: idUserLabel, titleLabel)
        
    }
    
}

extension UIView{
    
    func addConstraintsWithFormat(format : String, views: UIView...){
        var viewDictionary = [String : UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
        
        
    }
    
}
