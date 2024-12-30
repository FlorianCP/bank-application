import Foundation
import SwiftUI

struct LineChartData: Identifiable {
    let id = UUID()
    let title: String
    let values: [LineChartSlice]
    
    struct LineChartSlice: Identifiable {
        let id = UUID()
        let skillName: String
        let color: String // Color name that can be used with Color(...)
        let progressPoints: [ProgressPoint]
        
        struct ProgressPoint: Identifiable {
            let id = UUID()
            let date: Date
            let level: Double // 0-100
        }
    }
}

struct PieChartData: Identifiable {
    let id = UUID()
    let title: String
    let values: [PieChartSlice]
    
    struct PieChartSlice: Identifiable {
        let id = UUID()
        let name: String
        let percentage: Double
        let color: String // Color name that can be used with Color(...)
    }
}

// Sample Data
extension LineChartData {
    static let skillDevelopment = LineChartData(title: "Skill-Entwicklung", values: [
        LineChartSlice(
            skillName: "Swift",
            color: "blue",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2020, month: 1))!, level: 20),
                .init(date: Calendar.current.date(from: DateComponents(year: 2021, month: 6))!, level: 45),
                .init(date: Calendar.current.date(from: DateComponents(year: 2022, month: 12))!, level: 75),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024, month: 3))!, level: 90)
            ]),
        LineChartSlice(
            skillName: "SwiftUI",
            color: "green",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2021, month: 1))!, level: 10),
                .init(date: Calendar.current.date(from: DateComponents(year: 2022, month: 6))!, level: 40),
                .init(date: Calendar.current.date(from: DateComponents(year: 2023, month: 12))!, level: 70),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024, month: 3))!, level: 85)
            ]),
        LineChartSlice(
            skillName: "UIKit",
            color: "red",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2020, month: 1))!, level: 30),
                .init(date: Calendar.current.date(from: DateComponents(year: 2021, month: 6))!, level: 55),
                .init(date: Calendar.current.date(from: DateComponents(year: 2022, month: 12))!, level: 80),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024, month: 3))!, level: 95)
            ])
    ])
}

extension PieChartData {
    static let skills = PieChartData(title: "Skills", values: [
        PieChartSlice(name: "iOS Development", percentage: 40, color: "blue"),
        PieChartSlice(name: "Fullstack", percentage: 20, color: "green"),
        PieChartSlice(name: "Backend Development", percentage: 25, color: "orange"),
        PieChartSlice(name: "Project Management", percentage: 15, color: "purple")
    ])
}

extension PieChartData {
    static let languages = PieChartData(title: "Programmiersprachen", values: [
        PieChartSlice(name: "Swift", percentage: 45, color: "blue"),
        PieChartSlice(name: "ObjC", percentage: 15, color: "orange"),
        PieChartSlice(name: "TS / JS", percentage: 25, color: "green"),
        PieChartSlice(name: "Python", percentage: 20, color: "purple"),
        PieChartSlice(name: "PHP", percentage: 20, color: "purple"),
    ])
}

#Preview {
    NavigationStack {
        ScrollView {
            VStack {
                LineChart(data: LineChartData.skillDevelopment)
                    .padding()
                
                PieChart(data: PieChartData.skills)
                    .padding()
                
                PieChart(data: PieChartData.languages)
                    .padding()
            }
        }
    }
}
