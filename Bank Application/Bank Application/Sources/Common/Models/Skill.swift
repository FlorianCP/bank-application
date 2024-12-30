import Foundation
import SwiftUI

struct LineChartData: Identifiable {
    let id = UUID()
    let title: String
    let values: [LineChartSlice]
    
    struct LineChartSlice: Identifiable {
        let id = UUID()
        let skillName: String
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

extension LineChartData {
    static let skillDevelopment = LineChartData(title: "Programmiersprachen Entwicklung", values: [
        LineChartSlice(
            skillName: "Objective C",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2007))!, level: 0),
                .init(date: Calendar.current.date(from: DateComponents(year: 2012))!, level: 60),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024))!, level: 45),
            ]),
        LineChartSlice(
            skillName: "Swift",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2015))!, level: 0),
                .init(date: Calendar.current.date(from: DateComponents(year: 2018))!, level: 45),
                .init(date: Calendar.current.date(from: DateComponents(year: 2023))!, level: 80),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024))!, level: 80),
            ]),
        LineChartSlice(
            skillName: "TS / JS",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2007))!, level: 10),
                .init(date: Calendar.current.date(from: DateComponents(year: 2016))!, level: 60),
                .init(date: Calendar.current.date(from: DateComponents(year: 2023))!, level: 55),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024))!, level: 85)
            ]),
        LineChartSlice(
            skillName: "Python",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2022))!, level: 0),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024))!, level: 75)
            ]),
        LineChartSlice(
            skillName: "PHP",
            progressPoints: [
                .init(date: Calendar.current.date(from: DateComponents(year: 2007))!, level: 30),
                .init(date: Calendar.current.date(from: DateComponents(year: 2016))!, level: 75),
                .init(date: Calendar.current.date(from: DateComponents(year: 2024))!, level: 55)
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

#Preview("Skill Development") {
    NavigationStack {
        LineChart(data: LineChartData.skillDevelopment)
            .padding()
    }
}

#Preview("Skills") {
    NavigationStack {
        PieChart(data: PieChartData.skills)
            .padding()
    }
}

#Preview("Languages") {
    NavigationStack {
        PieChart(data: PieChartData.languages)
            .padding()
    }
}
