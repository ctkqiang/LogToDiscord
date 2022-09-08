import Foundation
import LogToDiscord

try LogToDiscord(appName: "testing", webhookUrl: "webhookUrl").send(message: "testing", level: Level.Info, delay: 10)
