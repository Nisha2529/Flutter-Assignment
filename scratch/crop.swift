import Foundation
import AppKit

let inputPath = "/Users/nishanathani/.gemini/antigravity/brain/3ab3335e-e296-4d78-94a8-02c54fdf9d87/.user_uploaded/media_1794473974629_d5785dba.jpg"
guard let image = NSImage(contentsOfFile: inputPath) else {
    print("Failed to load image")
    exit(1)
}

guard let tiff = image.tiffRepresentation,
      let bitmap = NSBitmapImageRep(data: tiff) else {
    print("Failed to get bitmap")
    exit(1)
}

print("Loaded image: \(bitmap.pixelsWide) x \(bitmap.pixelsHigh)")

// Let's create high-quality crops
let crops: [(name: String, rect: NSRect)] = [
    ("home_viewport", NSRect(x: 10, y: 350, width: 155, height: 420)),
    ("home_full", NSRect(x: 170, y: 50, width: 155, height: 720)),
    ("journal_viewport", NSRect(x: 335, y: 350, width: 155, height: 420)),
    ("journal_full", NSRect(x: 500, y: 320, width: 155, height: 450)),
    ("insights_viewport", NSRect(x: 670, y: 350, width: 155, height: 420)),
    ("insights_full", NSRect(x: 825, y: 20, width: 155, height: 750)),
]

for crop in crops {
    let rep = NSBitmapImageRep(bitmapDataPlanes: nil,
                               pixelsWide: Int(crop.rect.width),
                               pixelsHigh: Int(crop.rect.height),
                               bitsPerSample: 8,
                               samplesPerPixel: 4,
                               hasAlpha: true,
                               isPlanar: false,
                               colorSpaceName: .deviceRGB,
                               bytesPerRow: 0,
                               bitsPerPixel: 0)!
    NSGraphicsContext.saveGraphicsState()
    let ctx = NSGraphicsContext(bitmapImageRep: rep)
    NSGraphicsContext.current = ctx
    // NSImage coordinates: y starts from bottom
    image.draw(in: NSRect(origin: .zero, size: crop.rect.size),
               from: crop.rect,
               operation: .copy,
               fraction: 1.0)
    NSGraphicsContext.restoreGraphicsState()
    if let pngData = rep.representation(using: .png, properties: [:]) {
        let outUrl = URL(fileURLWithPath: "scratch/\(crop.name).png")
        try? pngData.write(to: outUrl)
        print("Saved scratch/\(crop.name).png")
    }
}
