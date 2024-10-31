//
//  MultipleEventView.swift
//  ShippingTrackingUI
//
//  Created by Shivanshu Verma on 30/10/24.
//

import UIKit

class MultipleEventView: UIView {
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
    
    private let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        addSubview(eventTitleLabel)
        addSubview(statusesStackView)
        
        NSLayoutConstraint.activate([
            statusIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            statusIcon.topAnchor.constraint(equalTo: self.topAnchor),
            statusIcon.widthAnchor.constraint(equalToConstant: 20),
            statusIcon.heightAnchor.constraint(equalToConstant: 20),
            
            dashedLineView.leadingAnchor.constraint(equalTo: statusIcon.centerXAnchor),
            dashedLineView.widthAnchor.constraint(equalToConstant: 1),
            dashedLineView.topAnchor.constraint(equalTo: statusIcon.bottomAnchor),
            dashedLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            eventTitleLabel.leadingAnchor.constraint(equalTo: statusIcon.trailingAnchor, constant: 12),
            eventTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            eventTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            statusesStackView.leadingAnchor.constraint(equalTo: eventTitleLabel.leadingAnchor),
            statusesStackView.trailingAnchor.constraint(equalTo: self.eventTitleLabel.trailingAnchor),
            statusesStackView.topAnchor.constraint(equalTo: self.eventTitleLabel.bottomAnchor, constant: 12),
            statusesStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with event: TrackingEventStatus, isHiddenDashLine: Bool = false) {
        self.dashedLineView.isHidden = isHiddenDashLine
        self.eventTitleLabel.text = event.location
        
        statusesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for status in event.statuses {
            let statusView = StatusView()
            statusView.configure(with: status)
            statusesStackView.addArrangedSubview(statusView)
        }
    }
}
