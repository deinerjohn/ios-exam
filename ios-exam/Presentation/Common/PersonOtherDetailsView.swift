//
//  PersonOtherDetailsView.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import UIKit

class PersonOtherDetailsView: UIView {
    
    var detailsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User Details:"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    private let genderTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private let ageTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Age:"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private let bdayTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Birthday:"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private let mobileTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mobile #:"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private let emailTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    var bdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    var mobileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(detailsTitle)
        NSLayoutConstraint.activate([
            detailsTitle.topAnchor.constraint(equalTo: topAnchor),
            detailsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            detailsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        let detailTitleStack = UIStackView(arrangedSubviews: [
        genderTitle,
        ageTitle,
        bdayTitle,
        mobileTitle,
        emailTitle
        ])
        detailTitleStack.translatesAutoresizingMaskIntoConstraints = false
        detailTitleStack.axis = .vertical
        detailTitleStack.distribution = .fill
        detailTitleStack.spacing = 15
        
        addSubview(detailTitleStack)
        NSLayoutConstraint.activate([
            detailTitleStack.topAnchor.constraint(equalTo: detailsTitle.bottomAnchor, constant: 20),
            detailTitleStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.bottomAnchor.constraint(equalTo: detailTitleStack.bottomAnchor)
        ])
        
        addSubview(genderLabel)
        NSLayoutConstraint.activate([
            genderLabel.centerYAnchor.constraint(equalTo: genderTitle.centerYAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: genderTitle.trailingAnchor, constant: 10)
        ])
        
        addSubview(ageLabel)
        NSLayoutConstraint.activate([
            ageLabel.centerYAnchor.constraint(equalTo: ageTitle.centerYAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: ageTitle.trailingAnchor, constant: 10)
        ])
        
        addSubview(bdayLabel)
        NSLayoutConstraint.activate([
            bdayLabel.centerYAnchor.constraint(equalTo: bdayTitle.centerYAnchor),
            bdayLabel.leadingAnchor.constraint(equalTo: bdayTitle.trailingAnchor, constant: 10),
        ])
        
        addSubview(mobileLabel)
        NSLayoutConstraint.activate([
            mobileLabel.centerYAnchor.constraint(equalTo: mobileTitle.centerYAnchor),
            mobileLabel.leadingAnchor.constraint(equalTo: mobileTitle.trailingAnchor, constant: 10)
        ])
        
        addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.centerYAnchor.constraint(equalTo: emailTitle.centerYAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailTitle.trailingAnchor, constant: 10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
