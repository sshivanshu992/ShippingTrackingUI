//
//  MultipleTrackingEventCell.swift
//  ShippingTrackingUI
//
//  Created by Shivanshu Verma on 30/10/24.
//

import UIKit

class MultipleTrackingEventCell: UITableViewCell {
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let eventsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        /// Add shadowView to contentView
        contentView.addSubview(shadowView)
        
        /// Add containerView to shadowView
        shadowView.addSubview(containerView)
        
        /// Add titleLabel and idLabel to containerView
        containerView.addSubview(titleLabel)
        containerView.addSubview(idLabel)
        
        /// Add eventsStackView to containerView
        containerView.addSubview(eventsStackView)
        
        /// Set constraints for `shadowView`
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        /// Set constraints for `containerView` inside shadowView
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor)
        ])
        
        /// Set constraints for `titleLabel` and `idLabel`
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            idLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            idLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            idLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        /// Set constraints for `eventsStackView` inside containerView
        NSLayoutConstraint.activate([
            eventsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            eventsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            eventsStackView.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 16), /// Space below ID label
            eventsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16) /// Space from bottom
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /// Apply shadow to shadowView
        shadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.shadowRadius = 10
        shadowView.layer.masksToBounds = false
    }
    
    public func configure(with events: [TrackingEventStatus], title: String, id: String) {
        titleLabel.text = title
        idLabel.text = id
        eventsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (index, event) in events.enumerated() {
            let eventView = MultipleEventView()
            let bool = events.count - 1 == index
            eventView.configure(with: event, isHiddenDashLine: bool)
            eventsStackView.addArrangedSubview(eventView)
        }
    }
  
}
