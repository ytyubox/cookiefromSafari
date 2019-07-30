import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    router.get("redirect") { (req) -> Response in
        return req.redirect(to: "ytyuboxcookietry://123")
    }
    router.get("hello") { req in
        return "Hello, world!"
    }
    let sessions = router.grouped("sessions").grouped(SessionsMiddleware.self)

    // create a route at GET /sessions/foo
    sessions.get("foo") { req in
        return "Foo"
    }
    sessions.get("get") { req -> String in
        // access "name" from session or return n/a
        return try req.session()["name"] ?? "n/a"
    }

    // create a route at GET /sessions/del
    sessions.get("del") { req -> String in
        // destroy the session
        try req.destroySession()

        // signal success
        return "done"
    }
    
}
