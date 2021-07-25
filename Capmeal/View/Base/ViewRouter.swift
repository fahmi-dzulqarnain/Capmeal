//
//  File.swift
//  SwiftUIExplore
//
//  Created by Edwin Niwarlangga on 22/07/21.
//

import Foundation

import SwiftUI

enum Page {
     case home
     case profile
 }

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}
