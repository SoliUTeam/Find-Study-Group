import ProjectDescription

// 1
let project = Project(
    name: "Find Study Group",
    organizationName: "SoliU",
    settings: nil,
    targets: [
        Target(
            // 2
            name: "MovieInfo",
            // 3
            platform: .iOS,
            // 4
            product: .app,
            // 5
            bundleId: "<YOUR_BUNDLE_ID_HERE>",
            // 6
            infoPlist: "MovieInfo/Info.plist",
            // 7
            sources: ["MovieInfo/Source/**"],
            // 8
            resources: ["MovieInfo/Resources/**"],
            // 9
            dependencies: [],
            // 10
            settings: nil)
             ])
