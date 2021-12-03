//
//  LostTableViewCell.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/29/21.
//
import SwiftUI

class LostTableViewCell: UICollectionViewCell {
    
    var name = UILabel()
    var location = UILabel()
    var time = UILabel()
    var des_image = UIImageView()
    var rec = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for item: Item) {
        name.text = item.name
        location.text = item.location
        time.text = "\(item.time)"
//        des_image.image = item.pics
        contentView.backgroundColor = UIColor(red: 0.722, green: 0.803, blue: 0.858, alpha: 1)
        contentView.layer.cornerRadius = 25;
        
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowRadius = 0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        contentView.layer.masksToBounds = false
        

        
        rec.layer.backgroundColor = UIColor(red: 0.941, green: 0.961, blue: 0.976, alpha: 1).cgColor
        rec.layer.cornerRadius = 25
        contentView.addSubview(rec)
        
        let namefont = contentView.frame.height * 0.25
        name.font = UIFont(name: "RoundedMplus1c-ExtraBold", size: namefont)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black;
        contentView.addSubview(name)
        
        let locafont = namefont * (2/3)
        location.font = UIFont(name:"RoundedMplus1c-Regular", size: locafont)
        location.textColor=UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1)
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        
        //do we really need this?
        let timefont = locafont * (5/6)
        time.font = UIFont(name: "RoundedMplus1c-Light", size: timefont)
        time.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1)
        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
        
//        des_image.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(des_image)
        //haven't figured out how to handle images
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        
        //the parameter used in this section. Modify the scaler, the whole thing is adjusted.
        let toppad2 = contentView.frame.height * 0.108
        let nameheight = contentView.frame.height * 0.35
        let namelead = contentView.frame.width * 0.08
        let namewidth = contentView.frame.width * (3/7)
        
        
        NSLayoutConstraint.activate([
            name.widthAnchor.constraint(equalToConstant: namewidth),
            name.heightAnchor.constraint(equalToConstant: nameheight),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: namelead),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: toppad2),
        ])
        
        
        let toppad1 = nameheight * (1/50)
        NSLayoutConstraint.activate([
            location.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            location.topAnchor.constraint(equalTo: name.bottomAnchor),
            location.widthAnchor.constraint(equalTo: name.widthAnchor)
        ])
        
        

        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: location.bottomAnchor, constant: toppad1),
            time.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            time.widthAnchor.constraint(equalTo: name.widthAnchor)
        ])
        

    }

}
