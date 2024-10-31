//
//  EventView.swift
//  ShippingTrackingUI
//
//  Created by Shivanshu Verma on 30/10/24.
//


import UIKit

class EventView: UIView {
    private let statusIcon: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dashedLineView: DashedLineView = {
        let dashedLine = DashedLineView()
        dashedLine.backgroundColor = .clear
        dashedLine.dashLength = 5
        dashedLine.gapLength = 3
        dashedLine.lineColor = .lightGray
        dashedLine.lineWidth = 2
        dashedLine.orientation = .vertical
        dashedLine.translatesAutoresizingMaskIntoConstraints = false
        return dashedLine
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(backgroundColor: UIColor = .clear) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(statusIcon)
        addSubview(dashedLineView)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            statusIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            statusIcon.topAnchor.constraint(equalTo: self.topAnchor),
            statusIcon.widthAnchor.constraint(equalToConstant: 20),
            statusIcon.heightAnchor.constraint(equalToConstant: 20),
            
            dashedLineView.leadingAnchor.constraint(equalTo: statusIcon.centerXAnchor), /// Align with the statusIcon
            dashedLineView.widthAnchor.constraint(equalToConstant: 1), /// Width of the line
            dashedLineView.topAnchor.constraint(equalTo: statusIcon.bottomAnchor), /// Start from the bottom of statusIcon
            dashedLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor), /// Extend to the bottom of the EventView
            
            /// Title label constraints
            titleLabel.leadingAnchor.constraint(equalTo: statusIcon.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            /// Date label constraints
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            /// Location label constraints
            locationLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            locationLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14)
        ])
    }
    
    func configure(with event: TrackingEvent, isHiddenDashLine: Bool = false) {
        self.titleLabel.text = event.title
        self.dateLabel.text = event.date
        self.locationLabel.text = event.location
        self.statusIcon.backgroundColor = getStatusColor(for: event.status)
        self.dashedLineView.isHidden = isHiddenDashLine
    }
    
    private func getStatusColor(for status: TrackingStatus) -> UIColor {
        switch status {
            case .dispatched:
                return .systemGreen
            case .received:
                return .systemBlue
            case .delivery:
                return .systemOrange
        }
    }
}
