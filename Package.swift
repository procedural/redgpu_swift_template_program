// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "REDGPU Swift Template Program",
  dependencies: [],
  targets: [
    .systemLibrary(name: "redgpu"),
    .target(name: "program", dependencies: ["redgpu"])
  ]
)

