import Vapor
import Authentication

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
    config.prefer(MemoryKeyedCache.self, for: KeyedCache.self)
    var middlewares = MiddlewareConfig()
    middlewares.use(SessionsMiddleware.self)
    // ...
    services.register(middlewares)
}
