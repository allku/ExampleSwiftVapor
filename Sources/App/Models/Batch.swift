import Fluent
import Vapor

final class Batch: Model, Content {

    static let schema = "batches"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "code")
    var code: String
    
    @Field(key: "name")
    var name: String

    @Field(key: "status")
    var status: String

    init() { }

    init(id: Int? = nil, code: String, name: String, status: String) throws {
        self.id = id
        self.code = code
        self.name = name
        self.status = status
    }
}
