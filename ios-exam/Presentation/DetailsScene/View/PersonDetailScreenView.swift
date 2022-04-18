//
//  PersonDetailScreenView.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import UIKit

class PersonDetailScreenView: UIView {
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headerView: PersonHeaderView = {
        let view = PersonHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var personDetailsView: PersonOtherDetailsView = {
        let view = PersonOtherDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var personLocationView: PersonLocationView = {
        let view = PersonLocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(personDetailsView)
        stackView.addArrangedSubview(personLocationView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
