//
//  PersonListViewTableCell.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import UIKit
import Kingfisher

class PersonListViewTableCell: UITableViewCell {
    
    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    var profileIV: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .gray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 60 / 2
        return iv
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5 )
        ])
        
        cardView.addSubview(profileIV)
        NSLayoutConstraint.activate([
            profileIV.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5),
            profileIV.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            profileIV.heightAnchor.constraint(equalToConstant: 60),
            profileIV.widthAnchor.constraint(equalToConstant: 60),
            profileIV.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -5)
        ])
        
        cardView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileIV.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ person: Persons) {
        self.nameLabel.text = self.composeFullName(person.name)
        
        if let url = URL(string: person.picture?.medium ?? "") {
            
            self.profileIV.kf.setImage(with: url)
            
        }
    }
    
    private func composeFullName(_ name: Name?) -> String {
        guard let name = name, let firstName = name.first, let lastName = name.last  else {
            return "First Name Last Name"
        }

        return firstName + " " + lastName
    }
    
}
