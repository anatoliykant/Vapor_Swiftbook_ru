import Vapor
import Fluent
import FluentPostgreSQL

/// Called before your application initializes.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#configureswift)
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Configure the rest of your application here
    
    /// Directory config setup
    let directoryConfig = DirectoryConfig.detect()
    services.register(directoryConfig)
    
    /// FluentSQLite provider setup
//    try services.register(FluentSQLiteProvider())
//
//    /// Database configure
//    var databaseConfig = DatabasesConfig()
//    let fullPath = "\(directoryConfig.workDir)words.db"
//    print(#line, #function, "Path to DB:", fullPath)
//    let db = try SQLiteDatabase(storage: .file(path: fullPath))
//    databaseConfig.add(database: db, as: .sqlite)
//    services.register(databaseConfig)
    
    try services.register(FluentPostgreSQLProvider())
    
    let configure = PostgreSQLDatabaseConfig(hostname: "mysql", port: 5432, username: "postgres", database: nil, password: "postgrepassword1", transport: .cleartext)
    let postgresql = PostgreSQLDatabase(config: configure)
    
    var databaseConfig = DatabasesConfig()
    databaseConfig.add(database: postgresql, as: .psql)
    services.register(databaseConfig)
    
    /// Migration service configure
    var migrationConfig = MigrationConfig()
    migrationConfig.add(model: Word.self, database: .psql)
    services.register(migrationConfig)
}
