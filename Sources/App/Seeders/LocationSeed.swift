import Fluent

struct LocationSeed: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        print("Start seedig ...")
        let earth = try! Location(name: "Earth", status: "Active")

        return earth.save(on: database).flatMap { _ in
            let locations: [Location] = try!
            [
                .init(name: "Europa", status: "Active", location: earth),
                .init(name: "America", observation: "My continent", status: "Active")
            ]

            return locations.map {
                location in location.save(on: database)
            }.flatten(on: database.eventLoop)
        }
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
