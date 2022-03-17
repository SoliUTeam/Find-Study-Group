import ProjectDescription

// 1
let project = Project(
    name: "FindStudyGroup",
    organizationName: "SoliU",
    settings: nil,
    targets: [
        Target(
            // 2
            name: "FindStudyGroup",
            // 3
            platform: .iOS,
            // 4
            product: .app,
            // 5
            bundleId: "com.dennis-hong.Find-Study-Group",
            // 6
            infoPlist: "Find-Study-Group/Info.plist",
            // 7
            sources: ["Find-Study-Group/Asset/**"],
            // 8
            resources: ["Find Study Group/Resources/**"],
            // 9
            dependencies: [],
            // 10
            settings: nil)
             ])
