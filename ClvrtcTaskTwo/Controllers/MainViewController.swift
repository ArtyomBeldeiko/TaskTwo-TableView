//
//  MainViewController.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 12.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
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
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
//    MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
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
