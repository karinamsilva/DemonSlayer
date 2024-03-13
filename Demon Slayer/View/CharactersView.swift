//
//  CharactersView.swift
//  Demon Slayer
//
//  Created by Karina on 12/03/24.
//

import Foundation
import UIKit

class CharactersView: UITableViewCell {
    
    let characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        contentView.addSubview(characterName)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            characterName.topAnchor.constraint(equalTo: topAnchor),
            characterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterName.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
