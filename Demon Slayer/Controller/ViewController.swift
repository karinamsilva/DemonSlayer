//
//  ViewController.swift
//  Demon Slayer
//
//  Created by Karina on 12/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = AllCharacteresViewModel()
    var list: [DataModel] = []
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
        setupTableView()
//        viewModel.getCharacters(table: tableView)
        viewModel.getCharacters()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    func registerTable() {
        tableView.delegate =  self
        tableView.dataSource = self
        tableView.register(CharactersView.self, forCellReuseIdentifier: "CharCell")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharCell", for: indexPath) as? CharactersView else { return UITableViewCell() }
        cell.characterName.text = viewModel.charactersArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

