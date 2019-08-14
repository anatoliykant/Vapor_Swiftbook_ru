//
//  Word.swift
//  App
//
//  Created by kant on 23/07/2019.
//

import Vapor
import FluentPostgreSQL

public struct Word: Content, PostgreSQLUUIDModel, Migration {
    public var id: UUID?
    public var value: String
}
