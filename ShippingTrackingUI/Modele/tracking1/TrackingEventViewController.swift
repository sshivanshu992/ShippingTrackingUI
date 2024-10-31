//
//  TrackingEventViewController.swift
//  ShippingTrackingUI
//
//  Created by Shivanshu Verma on 30/10/24.
//

import UIKit
struct TrackingEvent {
    let title: String
    let date: String
    let location: String
    let status: TrackingStatus
}

enum TrackingStatus {
    case dispatched, received, delivery
}


class TrackingEventViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let events: [TrackingEvent] = [
        TrackingEvent(title: "Order Dispatched", date: "create date is 2024-10-28", location: "Warehouse An", status: .dispatched),
        TrackingEvent(title: "Package Received", date: "2024-10-29", location: "Distribution Center", status: .received),
        TrackingEvent(title: "Package Scanned", date: "2024-10-30", location: "Delivery Hub", status: .delivery),
        TrackingEvent(title: "Package Dispatched", date: "2024-10-31", location: "Warehouse B", status: .dispatched),
        TrackingEvent(title: "Package Received", date: "2024-11-01", location: "Customer Location", status: .received),
        TrackingEvent(title: "Package Received", date: "2024-10-29", location: "Distribution Center", status: .received),
        TrackingEvent(title: "Package Received", date: "2024-10-29", location: "Distribution Center", status: .received),
    ]

    private var eventsGroupedByCell: [[TrackingEvent]] = [] // Array of event groups for each cell

    override func viewDidLoad() {
        super.viewDidLoad()
        // Split events into groups of 3
        eventsGroupedByCell = events.chunked(into: 3)
        tableView.register(TrackingEventCell.self, forCellReuseIdentifier: String(describing: TrackingEventCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /// just for testing
    @IBAction func reloadTableViewButtionAction(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.eventsGroupedByCell = [self.events.shuffled()]
            self.tableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.eventsGroupedByCell = [self.events.shuffled()]
                self.tableView.reloadData()
            }
        }
    }
    
}

extension TrackingEventViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsGroupedByCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TrackingEventCell.self), for: indexPath) as? TrackingEventCell else {
            return UITableViewCell()
        }
        let event = eventsGroupedByCell[indexPath.row]
        cell.configure(with: event, title: "Gift and Joy Rose Dimanod Lamp Table Lamp", id: "Order ID - OD432636559815758100")
        return cell
    }
}
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
