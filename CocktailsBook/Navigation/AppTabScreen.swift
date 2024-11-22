//
//  TabScreen.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

enum AppTabScreen: Hashable, Identifiable, CaseIterable {
    
    case categories
    case ingredients
    case glasses
    
    var id: AppTabScreen { self }
}

//extension AppTabScreen {
//    
//    @ViewBuilder
//    var label: some View {
//        switch self {
//            case .categories:
//                Label("Caregories", systemImage: "tree")
//            case .ingredients:
//                Label("Ingredients", systemImage: "bird")
//            case .glasses:
//                Label("Glasses", systemImage: "leaf")
//        }
//    }
//    
//    @ViewBuilder
//    var destination: some View {
//        switch self {
//            case .categories:
//                BackyardNavigationStack()
//            case .ingredients:
//                BirdsNavigationStack()
//            case .glasses:
//                PlantsNavigationStack()
//        }
//    }
//    
//}
