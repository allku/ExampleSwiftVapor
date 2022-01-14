import Fluent

struct LocationSeed: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        let locations: [Location] = try!
        [
            .init(name: "Venus", observation: "", status: "Active"),
            .init(name: "Earth", observation: "", status: "Active")
        ]

        return locations.map {
            location in location.save(on: database)
        }.flatten(on: database.eventLoop)
        
//        print("Start seedig ...")
//        let earth = try! Location(name: "Earth", observation: "", status: "Active")
//
//        print("Earth " + earth.name)
//
//        return earth.save(on: database)
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        Location.query(on: database).delete()
    }
}
