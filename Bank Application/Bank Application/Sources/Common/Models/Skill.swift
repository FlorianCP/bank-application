import Foundation

struct SkillProgress: Identifiable {
    let id = UUID()
    let skillName: String
    let progressPoints: [ProgressPoint]
    let color: String // Color name that can be used with Color(...)
    
    struct ProgressPoint: Identifiable {
        let id = UUID()
        let date: Date
        let level: Double // 0-100
    }
}

struct SkillCategory: Identifiable {
    let id = UUID()
    let name: String
    let percentage: Double
    let color: String // Color name that can be used with Color(...)
}

// Sample Data
extension SkillProgress {
    static let sampleData: [SkillProgress] = [
        SkillProgress(
            skillName: "Swift",
            progressPoints: [
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2020, month: 1))!, level: 20),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2021, month: 6))!, level: 45),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2022, month: 12))!, level: 75),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2024, month: 3))!, level: 90)
            ],
            color: "blue"
        ),
        SkillProgress(
            skillName: "SwiftUI",
            progressPoints: [
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2021, month: 1))!, level: 10),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2022, month: 6))!, level: 40),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2023, month: 12))!, level: 70),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2024, month: 3))!, level: 85)
            ],
            color: "green"
        ),
        SkillProgress(
            skillName: "UIKit",
            progressPoints: [
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2020, month: 1))!, level: 30),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2021, month: 6))!, level: 55),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2022, month: 12))!, level: 80),
                ProgressPoint(date: Calendar.current.date(from: DateComponents(year: 2024, month: 3))!, level: 95)
            ],
            color: "red"
        )
    ]
}

extension SkillCategory {
    static let sampleData: [SkillCategory] = [
        SkillCategory(name: "iOS Development", percentage: 40, color: "blue"),
        SkillCategory(name: "Backend Development", percentage: 25, color: "green"),
        SkillCategory(name: "UI/UX Design", percentage: 20, color: "orange"),
        SkillCategory(name: "Project Management", percentage: 15, color: "purple")
    ]
} 