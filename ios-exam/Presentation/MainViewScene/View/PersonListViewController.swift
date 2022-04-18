//
//  PersonListViewController.swift
//  ios-exam
//
//  Created by Deiner John Calbang on 4/18/22.
//

import UIKit

class PersonListViewController: UIViewController {
    
    private lazy var customView = view as! PersonListView
    
    private let viewModel = PersonListViewModel()
    
    override func loadView() {
        super.loadView()
        
        view = PersonListView(frame: UIScreen.main.bounds)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Person Lists"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.customView.personList.dataSource = self
        self.customView.personList.delegate = self
        
        self.bind()
        self.viewModel.fetchData()
    }
    
    private func bind() {
        
        self.viewModel.personLists.observe(on: self) { _ in
            self.customView.personList.reloadData()
        }
        
        self.viewModel.errorFound.observe(on: self) { val in
            guard !val.isEmpty else {return}
            
            let alertView = UIAlertController(title: "", message: val, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertView.addAction(action)
            
            self.present(alertView, animated: true, completion: nil)
        }
    }

}

extension PersonListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PersonListViewTableCell
        cell.configure(self.viewModel.getDataForEachRow(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.numberOfRows - 1 {
            self.viewModel.fetchData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vm = PersonDetailScreenViewModel(person: self.viewModel.getDataForEachRow(indexPath))
        let vc = PersonDetailScreenViewController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

