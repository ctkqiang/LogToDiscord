import Foundation
import LogToDiscord





try LogToDiscord(appName: "testing", webhookUrl: "https://discord.com/api/webhooks/923568801759506463/OwCxiGYKZpsFZZLB51nXtWo6rkK8U3oNtZU6u9kSiEHh60G5kEc87igKbYZ7gJwaDC-D").send(message: "testing", level: Level.Info, delay: 10)
