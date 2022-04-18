//
//  PersonDetailScreenViewController.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class PersonDetailScreenViewController: UIViewController {
    
    private lazy var customView = view as! PersonDetailScreenView
    
    private var viewModel: PersonDetailScreenViewModel!
    
    init(_ viewModel: PersonDetailScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = PersonDetailScreenView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bind()
    }
    
    private func bind() {
        
        self.viewModel.personDetails.observe(on: self) { data in
            guard let data = data else {
                return
            }
            
            //Header
            if let url = URL(string: data.picture?.large ?? "") {
                self.customView.headerView.profileIV.kf.setImage(with: url)
            }
            self.customView.headerView.nameLabel.text = self.viewModel.composeFullName(data.name)
            
            //Details
            self.customView.personDetailsView.genderLabel.text = data.gender ?? ""
            self.customView.personDetailsView.ageLabel.text = String(data.dob?.age ?? 0)
            self.customView.personDetailsView.bdayLabel.text = self.convertBirthdayFormat(birthdayString: data.dob?.date ?? "")
            self.customView.personDetailsView.mobileLabel.text = data.cell ?? ""
            self.customView.personDetailsView.emailLabel.text = data.email ?? ""
            
            //Location
            self.customView.personLocationView.addressLabel.text = self.viewModel.fullAddressCompose(data.location)
            let coordinates = CLLocationCoordinate2D(latitude: self.viewModel.getCoordinates(data.location).0, longitude: self.viewModel.getCoordinates(data.location).1)
            let pin = MKPointAnnotation()
            pin.coordinate = coordinates
            self.customView.personLocationView.mapView.setCenter(coordinates, animated: false)
            self.customView.personLocationView.mapView.addAnnotation(pin)
        }
        
    }
    
    
    private func convertBirthdayFormat(birthdayString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let theDate = dateFormatter.date(from: birthdayString)!
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: theDate)
    }
    
}
