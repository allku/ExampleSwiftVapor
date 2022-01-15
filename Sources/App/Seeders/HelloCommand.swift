import Vapor

class HelloCommand: Command {
    struct Signature: CommandSignature { }

    var name: String
    var app: Application

    init(name: String, app: Application)
    {
        self.name = name
        self.app = app
    }

    var help: String {
        "Says hello"
    }

    func run(using context: CommandContext, signature: Signature) throws {
        context.console.print("Hello, world!")
        context.console.print(self.name)
        
        let location = try Location(
            name: "Earth",
            status: "Active")
        try location.save(on: app.db).wait()

        let name = context.console.ask("What is your \("name", color: .blue)?")
        context.console.print("Hello, \(name) 👋")
    }
}
