//
//  Manager.swift
//  uikit1
//
//  Created by Apple user on 07/11/21.
//

import Foundation

enum JobType: String {
    case manager = "Maneger"
    case headCoach = "Case"
}

struct Manager {
  
    let name: String
    let job: JobType
}
