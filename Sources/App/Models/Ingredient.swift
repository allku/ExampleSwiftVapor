import Fluent
import Vapor

final class Ingredient: Model, Content {

    static let schema = "ingredients"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "name")
    var name: String

    @Parent(key: "beer_id")
    var beer: Beer

    init() { }

    init(id: Int? = nil, name: String, beer: Beer) throws {
        self.id = id
        self.name = name
        self.beer.id = try! beer.requireID()
    }
}
