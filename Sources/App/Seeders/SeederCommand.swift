import Vapor

class SeederCommand: Command {
    struct Signature: CommandSignature { }

    var app: Application

    init(app: Application)
    {
        self.app = app
    }

    var help: String {
        "Seeder"
    }

    func run(using context: CommandContext, signature: Signature) throws {
        context.console.print("Seeder Begin ...")
        
        let location = try Location(
            name: "Earth",
            status: "Active")
        try location.save(on: app.db).wait()

        context.console.print("Seeder End ...")
        //Read console data
        //let name = context.console.ask("What is your \("name", color: .blue)?")
        //context.console.print("Hello, \(name) 👋")
    }
}
