//
//  PersonLocationView.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import UIKit
import MapKit

class PersonLocationView: UIView {
    
    var locationTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location:"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    private let addressTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address:"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(locationTitle)
        NSLayoutConstraint.activate([
            locationTitle.topAnchor.constraint(equalTo: topAnchor),
            locationTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            locationTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        addSubview(addressTitle)
        NSLayoutConstraint.activate([
            addressTitle.topAnchor.constraint(equalTo: locationTitle.bottomAnchor, constant: 10),
            addressTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addressTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalToConstant: 350),
            self.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 100)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
