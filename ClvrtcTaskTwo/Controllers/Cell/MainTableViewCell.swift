//
//  MainTableViewCell.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 13.12.22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    private let leadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(leadingImageView)
        contentView.addSubview(titleLable)
        contentView.addSubview(descriptionLable)
    }
    
    private func setConstraints() {
        let leadingImageViewConstraints = [
            leadingImageView.heightAnchor.constraint(equalToConstant: 30),
            leadingImageView.widthAnchor.constraint(equalToConstant: 30),
            leadingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leadingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ]
        
        let titleLableConstraints = [
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingImageView.trailingAnchor, constant: 15)
        ]
        
        let descriptionLableConstraints = [
            descriptionLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
            descriptionLable.leadingAnchor.constraint(equalTo: titleLable.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(leadingImageViewConstraints)
        NSLayoutConstraint.activate(titleLableConstraints)
        NSLayoutConstraint.activate(descriptionLableConstraints)
    }
    
}
