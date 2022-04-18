//
//  PersonListView.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import UIKit

class PersonListView: UIView {
    
    let personList: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PersonListViewTableCell.self, forCellReuseIdentifier: "cellId")
        view.separatorStyle = .none
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(personList)
        NSLayoutConstraint.activate([
            personList.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            personList.leadingAnchor.constraint(equalTo: leadingAnchor),
            personList.trailingAnchor.constraint(equalTo: trailingAnchor),
            personList.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
