//
//  DetailViewController.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 15.12.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //    MARK: - Variables
    
    var presentedIcon: UIImage?
    var presentedTitle: String?
    var presentedDescription: String?
    
    
    //    MARK: - UI Elements
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 248 / 255, green: 220 / 255, blue: 237 / 255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    private let descriptionLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    private let lablesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //    MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setArrangedSubviews()
        setSubviews()
        setConstraints()
        
        if let image = presentedIcon, let title = presentedTitle, let description = presentedDescription {
            iconImageView.image = image
            titleLable.text = "Title: \(title)"
            descriptionLable.text = "Description: \(description)"
        }
    }
    
    //    MARK: - viewDidLayoutSubviews
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
    }
    
    private func setArrangedSubviews() {
        lablesStackView.addArrangedSubview(titleLable)
        lablesStackView.addArrangedSubview(descriptionLable)
    }
    
    private func setSubviews() {
        self.view.addSubview(backgroundView)
        self.view.addSubview(iconImageView)
        self.view.addSubview(lablesStackView)
    }
    
    private func setConstraints() {
        let backgroundViewConstraints = [
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        let iconImageViewConstraints = [
            iconImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 90),
            iconImageView.widthAnchor.constraint(equalToConstant: 90)
        ]
        
        let lablesStackViewConstraints = [
            lablesStackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 15),
            lablesStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            lablesStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40),
            lablesStackView.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(backgroundViewConstraints)
        NSLayoutConstraint.activate(iconImageViewConstraints)
        NSLayoutConstraint.activate(lablesStackViewConstraints)
    }
}
