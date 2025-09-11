// ModelMenu.swift
import Foundation

struct MenuPayload: Codable {
    let menuItems: [MenuItem]
}

struct MenuItem: Codable {
    let title: String
    let url: String
}
