//
//  MultipleStatusesVC.swift
//  ShippingTrackingUI
//
//  Created by Shivanshu Verma on 30/10/24.
//

import UIKit

class MultipleStatusesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var eventsGroupedByCell: [[TrackingEventStatus]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsGroupedByCell = [trackingData]
        tableView.register(MultipleTrackingEventCell.self, forCellReuseIdentifier: String(describing: MultipleTrackingEventCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MultipleStatusesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsGroupedByCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MultipleTrackingEventCell.self), for: indexPath) as? MultipleTrackingEventCell else {
            return UITableViewCell()
        }
        let event = eventsGroupedByCell[indexPath.row]
        cell.configure(with: event, title: "Gift and Joy Rose Dimanod Lamp Table Lamp", id: "Order ID - OD432636559815758100")
        return cell
    }
}

extension MultipleStatusesVC {
    var trackingData: [TrackingEventStatus] {
        return [
            TrackingEventStatus(
                statuses: [
                    EventStatus(
                        title: "Order Confirmed",
                        date: "Wed, 9th Oct 2024",
                        description: "Your order has been placed and is being processed."
                    ),
                    EventStatus(
                        title: "Processed by Seller",
                        date: "Thu, 10th Oct 2024",
                        description: "The seller has packed and prepared your order for shipment."
                    ),
                    EventStatus(
                        title: "Picked up by Courier",
                        date: "Sun, 13th Oct 2024",
                        description: "Your item has been picked up by the courier partner and is en route to the sorting facility."
                    ),
                    EventStatus(
                        title: "In Transit",
                        date: "Mon, 14th Oct 2024",
                        description: "Your item is currently in transit between facilities."
                    ),
                    EventStatus(
                        title: "Out for Delivery",
                        date: "Wed, 16th Oct 2024",
                        description: "The item is out for delivery and will arrive shortly."
                    ),
                    EventStatus(
                        title: "Delivered",
                        date: "Wed, 16th Oct 2024",
                        description: "The item has been successfully delivered."
                    )
                ],
                location: "Order Confirmed Wed, 9th Oct '24",
                id: "Event-1"
            ),
            TrackingEventStatus(
                statuses: [
                    EventStatus(
                        title: "Shipment Prepared",
                        date: "Fri, 10th Oct 2024",
                        description: "Your items have been packed and are awaiting courier pickup."
                    ),
                    EventStatus(
                        title: "Shipped",
                        date: "Sun, 12th Oct 2024",
                        description: "The items are now in transit with Ekart Logistics."
                    ),
                    EventStatus(
                        title: "Arrived at Local Hub",
                        date: "Tue, 15th Oct 2024",
                        description: "The items have arrived at the local delivery hub and are awaiting dispatch."
                    ),
                    EventStatus(
                        title: "Out for Delivery",
                        date: "Wed, 16th Oct 2024",
                        description: "Your items are out for delivery and will arrive today."
                    ),
                    EventStatus(
                        title: "Delivered",
                        date: "Wed, 16th Oct 2024",
                        description: "Your items have been delivered."
                    )
                ],
                location: "Shipped  Sun, 13th Oct '24",
                id: "Event-2"
            ),
            TrackingEventStatus(
                statuses: [
                    EventStatus(
                        title: "Order Confirmed",
                        date: "Mon, 8th Oct 2024",
                        description: "Order has been successfully placed and is being processed by the seller."
                    ),
                    EventStatus(
                        title: "Packed and Ready",
                        date: "Wed, 10th Oct 2024",
                        description: "Your items have been securely packed and are ready for dispatch."
                    ),
                    EventStatus(
                        title: "Handed to Courier",
                        date: "Fri, 12th Oct 2024",
                        description: "The package has been handed over to the courier partner for delivery."
                    ),
                    EventStatus(
                        title: "Clearing Customs",
                        date: "Sat, 13th Oct 2024",
                        description: "The package is going through customs clearance."
                    ),
                    EventStatus(
                        title: "Reached Destination City",
                        date: "Tue, 15th Oct 2024",
                        description: "The package has reached your city and will be out for delivery soon."
                    )
                ],
                location: "Out For Delivery Thu, 17th Oct '24",
                id: "Event-3"
            ),
            TrackingEventStatus(
                statuses: [
                    EventStatus(
                        title: "Delivered",
                        date: "Wed, 16th Oct 2024",
                        description: "The package has been delivered to your address."
                    )
                ],
                location: "Delivered, 17th Oct '24",
                id: "Event-3"
            )
        ]
    }
}



struct TrackingEventStatus {
    let statuses: [EventStatus]
    let location: String?
    let id: String
}

struct EventStatus {
    let title: String
    let date: String
    let description: String
}
