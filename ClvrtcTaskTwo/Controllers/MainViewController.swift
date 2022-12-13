//
//  MainViewController.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 12.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
    var data = Data().dataArray.repeated(count: 100)
    
    
    //    MARK: - UI elements
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 248 / 255, green: 220 / 255, blue: 237 / 255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainTableView: UITableView = {
        let table = UITableView()
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //    MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
    }
    
    private func addSubviews() {
        self.view.addSubview(backgroundView)
        self.view.addSubview(mainTableView)
    }
    
    private func setConstraints() {
        let backgroundViewContraints = [
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        let mainTableViewConstraints = [
            mainTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(backgroundViewContraints)
        NSLayoutConstraint.activate(mainTableViewConstraints)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.titleLable.text = "Title \(data[indexPath.row].title)"
        cell.descriptionLable.text = "Description \(data[indexPath.row].description)"
        cell.leadingImageView.image = data[indexPath.row].image
        return cell
    }
    
}


