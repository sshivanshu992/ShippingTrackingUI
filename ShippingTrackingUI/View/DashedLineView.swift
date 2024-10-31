//
//  DashedLineView.swift
//  ShippingTrackingUI
//
//  Created by Shivanshu Verma on 30/10/24.
//

import UIKit

/**
 A UIView subclass that draws a customizable dashed line.
 
 You can use `DashedLineView` to draw a dashed line with customizable dash length, gap length, line color, and line width. This view uses Core Graphics and the `UIGraphicsGetCurrentContext` method to render the dashed line directly onto the view.
 
 - Properties:
 - `dashLength`: The length of the dashes in the dashed line. Default is `6`.
 - `gapLength`: The length of the gaps between the dashes in the dashed line. Default is `3`.
 - `lineColor`: The color of the dashed line. Default is `.systemGray5`.
 - `lineWidth`: The width of the dashed line. Default is `2`.
 - `orientation`: The orientation of the dashed line. Default is `.horizontal`.
 */
class DashedLineView: UIView {
    
    /// The length of the dashes in the dashed line. Default is `6`.
    var dashLength: CGFloat = 6
    
    /// The length of the gaps between the dashes in the dashed line. Default is `3`.
    var gapLength: CGFloat = 3
    
    /// The color of the dashed line. Default is `.systemGray5`.
    var lineColor: UIColor = .systemGray5
    
    /// The width of the dashed line. Default is `2`.
    var lineWidth: CGFloat = 2
    
    /// The orientation of the dashed line. Default is `.horizontal`.
    enum LineOrientation {
        case horizontal
        case vertical
    }
    
    /// The orientation of the dashed line. Default is `.horizontal`.
    var orientation: LineOrientation = .horizontal
    
    /// Draws the dashed line in the view's bounds.
    ///
    /// This method is called whenever the view needs to be rendered.
    /// It uses the current graphics context to draw the dashed line with the specified properties.
    /// - Parameter rect: The area that needs to be drawn.
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(lineWidth)
        context.setStrokeColor(lineColor.cgColor)
        
        /// Create the dotted pattern
        let dashPattern: [CGFloat] = [dashLength, gapLength]
        context.setLineDash(phase: 0, lengths: dashPattern)
        
        /// Check the orientation and draw accordingly
        switch orientation {
            case .horizontal:
                context.move(to: CGPoint(x: 0, y: rect.height / 2))
                context.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
            case .vertical:
                context.move(to: CGPoint(x: rect.width / 2, y: 0))
                context.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        }
        context.strokePath()
    }
}
