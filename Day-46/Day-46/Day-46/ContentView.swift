//
//  ContentView.swift
//  Day-46
//
//  Created by Ojas Gupta on 1/1/2023.
//


import SwiftUI

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}


struct Arrow: Shape {
    
    var startCursor: CGPoint = CGPoint(x: 10, y: 10)
    
//    var insetAmount: Double
//
//    var animatableData: Double {
//        get {insetAmount}
//        set {insetAmount = newValue}
//    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
            path.move(to: startCursor)
            path.addLine(to: CGPoint(x: 200, y: 10))
            path.addLine(to: CGPoint(x: 150, y: 50))
            path.move(to: CGPoint(x: 200, y:10))
            path.addLine(to: CGPoint(x: 150, y: -25))
        
        
        return path
    }
}

struct Trapezoid: Shape {
    var insetAmount: Double
    
    
    var animatableData: Double {
        get {insetAmount}
        set {insetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5),
                            ]),
                            startPoint: .leading,
                            endPoint: .bottom),
                        lineWidth: 100
                    )
                    .frame(width: 400, height: 300, alignment: .center)
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var insetAmount: Double = 0
    
    var body: some View {
        
        VStack {
//            Arrow(startCursor: CGPoint(x: 10, y:10))
//                .stroke(Color.black, style: StrokeStyle(lineWidth: CGFloat(insetAmount), lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0))
//                .frame(width: 300, height: 100, alignment: .center)
//
//            Slider(value: $insetAmount, in: 0...20, step: 1)
            
            
//            Rectangle()
//                .fill(
//                    LinearGradient(gradient: Gradient(
//                        stops: [
//                            .init(color: .red, location: 0),
//                            .init(color: .orange, location: 0.2),
//                            .init(color: .yellow, location: 0.4),
//                            .init(color: .green, location: 0.6),
//                            .init(color: .blue, location: 0.7),
//                            .init(color: .indigo, location: 0.8),
//                            .init(color: .purple, location: 1),
//                        ]
//                    ), startPoint: .leading, endPoint: .bottom)
//                )
            
            ColorCyclingRectangle(amount: insetAmount)
            
            
            Slider(value: $insetAmount)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
