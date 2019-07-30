import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
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

    // create a route at GET /sessions/set/:name
    sessions.get("set", String.parameter) { req -> String in
        // get router param
        let name = try req.parameters.next(String.self)
       // print(name)
        //dump(req)
        // set name to session at key "name"
        try req.session()["name"] = name

        // return the newly set name
        return name
    }

    // create a route at GET /sessions/del
    sessions.get("del") { req -> String in
        // destroy the session
        try req.destroySession()

        // signal success
        return "done"
    }
}
