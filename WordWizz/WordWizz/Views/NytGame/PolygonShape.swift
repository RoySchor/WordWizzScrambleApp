//
//  PolygonShape.swift
//  WordWizz
//
//  Created by Roy Schor on 1/29/24.
//

import SwiftUI

struct PolygonShape: Shape {
    var sides: Int

    func path(in rect: CGRect) -> Path {
        guard sides >= 3 else { return Path() }

        let radius = Double(min(rect.size.width, rect.size.height)) / 2.0 // Radius
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2) // Center
        var path = Path()

        for sideIndex in 0..<sides {
            let angleDegrees = (Double(sideIndex) * (360.0 / Double(sides))) - 90 // Angle for each vertex
            let xPosition = center.x + CGFloat(cos(angleDegrees * .pi / 180) * radius)
            let yPosition = center.y + CGFloat(sin(angleDegrees * .pi / 180) * radius)

            if sideIndex == 0 {
                path.move(to: CGPoint(x: xPosition, y: yPosition))
            } else {
                path.addLine(to: CGPoint(x: xPosition, y: yPosition))
            }
        }
        path.closeSubpath()
        return path
    }
}

#Preview {
    PolygonShape(sides: 6)
}
