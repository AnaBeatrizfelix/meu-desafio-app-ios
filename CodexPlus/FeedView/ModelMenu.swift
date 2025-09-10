// ModelMenu.swift
import Foundation

struct MenuPayload: Codable {
    let menuItems: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    let title: String
    let url: String
    var id: String { url } 
}
