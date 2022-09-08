import Foundation
import LogToDiscord

try LogToDiscord(appName: "testing", webhookUrl: "url").send(message: "testing", level: Level.Info, delay: 10)
