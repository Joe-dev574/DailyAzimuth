//
//  ItemSymbol.swift
//  DailyAzimuth
//
//  Created by Joseph DeWeese on 11/20/24.
//

import SwiftUI

enum SFSymbol: String, CaseIterable {
    case none = ""
    case bed = "bed.double"
    case morningRitual = "mug.fill"
    case shoot = "figure.hunting"
    case project = "folder.fill"
    case work = "desktopcomputer"
    case reading = "book.fill"
    case write = "pencil.and.scribble"
    case study = "laptopcomputer"
    case walk = "figure.walk"
    case workout = "figure.strengthtraining.traditional"
    case martialArts = "figure.martial.arts"
    case swimming = "figure.pool.swim"
    case running = "figure.run"
    case yoga = "figure.yoga"
    case gaming = "gamecontroller"
    
    var title: String {
        switch self {
        case .none: 
            return ""
        case .bed:
            return "Bedtime"
        case .swimming:
            return "Swimming"
        case .running:
            return "Running"
        case .gaming:
            return "Gaming"
        case .walk: 
            return "Walking"
        case .martialArts:
            return "Martial Arts"
        case .morningRitual:
            return "Morning Ritual"
        case .shoot:
            return "Shooting"
        case .project:
            return "Project"
        case .work:
            return "Work"
        case .reading:
            return "Reading"
        case .write:
            return "Writing"
        case .study:
            return "Study"
        case .workout:
            return "Workout"
        case .yoga:
            return "Yoga"
        }
    }
}
