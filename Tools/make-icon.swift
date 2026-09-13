// Renders the AudioMixer app icon: a white macOS squircle with three bold black bars
// (middle tallest, left lower, right lowest). Usage: swift make-icon.swift <output.png> [size]
import AppKit
import SwiftUI

struct IconView: View {
    let size: CGFloat
    var body: some View {
        let inset = size * 100 / 1024          // Apple's macOS icon grid: 824 pt squircle on a 1024 pt canvas
        let side = size - inset * 2
        let radius = side * 0.2237
        let barWidth = side * 0.135
        let gap = side * 0.075
        let heights: [CGFloat] = [0.50, 0.68, 0.38]
        ZStack {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(LinearGradient(colors: [Color.white, Color(red: 0.95, green: 0.95, blue: 0.965)], startPoint: .top, endPoint: .bottom))
                .overlay(
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                        .strokeBorder(Color.black.opacity(0.06), lineWidth: max(1, side * 0.004))
                )
                .frame(width: side, height: side)
            HStack(alignment: .center, spacing: gap) {
                ForEach(0..<3, id: \.self) { index in
                    Capsule(style: .continuous)
                        .fill(Color(red: 0.06, green: 0.06, blue: 0.07))
                        .frame(width: barWidth, height: side * heights[index])
                }
            }
        }
        .frame(width: size, height: size)
    }
}

let arguments = CommandLine.arguments
guard arguments.count >= 2 else {
    FileHandle.standardError.write("usage: make-icon.swift <output.png> [size]\n".data(using: .utf8)!)
    exit(1)
}
let output = URL(fileURLWithPath: arguments[1])
let size = CGFloat(arguments.count > 2 ? Double(arguments[2]) ?? 1024 : 1024)

MainActor.assumeIsolated {
    let renderer = ImageRenderer(content: IconView(size: size))
    renderer.scale = 1
    guard let cgImage = renderer.cgImage else {
        FileHandle.standardError.write("render failed\n".data(using: .utf8)!)
        exit(2)
    }
    let rep = NSBitmapImageRep(cgImage: cgImage)
    guard let data = rep.representation(using: .png, properties: [:]) else { exit(3) }
    try! data.write(to: output)
    print("wrote \(output.path) (\(cgImage.width)x\(cgImage.height))")
}
