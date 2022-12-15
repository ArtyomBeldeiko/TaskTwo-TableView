//
//  MainViewController.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 12.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
    var data = Data().dataArray.repeated(count: 100)
    
    
    //    MARK: - UI Elements
    
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
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        
        addSubviews()
        setConstraints()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.addGestureRecognizer(longPressGesture)
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
    
//    MARK: - Actions
    
    @objc private func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        mainTableView.isEditing = true
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        tableView.isEditing = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = data[indexPath.row]
        
        let detailViewController = DetailViewController()
        detailViewController.presentedIcon = selectedItem.image
        detailViewController.presentedTitle = selectedItem.title
        detailViewController.presentedDescription = selectedItem.description
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


