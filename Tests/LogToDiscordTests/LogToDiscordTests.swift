import XCTest
@testable import LogToDiscord

final class LogToDiscordTests: XCTestCase
{
    func testExample() throws
    {
        
        try LogToDiscord(
            appName: "test",
            webhookUrl: "someUrl"
        ).send(
            message: "test",
            level: Level.Info,
            delay: 10
        )
    }
}
