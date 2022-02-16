//
//  Puzzle.swift
//  UI-466
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct Puzzle: Identifiable {
    var id = UUID().uuidString
    var imageName : String
    var answer : String
    var jumbbledWord : String
    
    var lettere : [Letter] = []
    
}

struct Letter : Identifiable{
    
    var id = UUID().uuidString
    var value : String
}

var puzzles : [Puzzle] = [

Puzzle(imageName: "Crown", answer: "Crown", jumbbledWord: "CUROROWKN"),
Puzzle(imageName: "p1", answer: "RokiSasaki", jumbbledWord: "REIWAMONSTER")


]

