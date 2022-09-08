# LogToDiscord

This package is mainly to send message to specific discord channel easily. Whether is from
server application, IOS application or MACOS Application.

### Installation

Insert the following lines into `Package.swift`

```
.package(url: "https://github.com/johnmelodyme/LogToDiscord.git", from: "1.0.5"),
```

### Usage:

```swift
import LogToDiscord

try LogToDiscord(
        appName: "testing",
        webhookUrl: "webhookUrl"
    ).send(message: "yourMessage", level: Level.Info, delay: 10)
```

### Explanation:

The parameter `level` are enumeration of various levels of the message being sent to discord
channel. The available level are as follows:

```swift
public enum Level
{
    case Error
    case Warn
    case Debug
    case Info
}
```

For demonstration please do refer to [example](https://github.com/johnmelodyme/LogToDiscord/blob/main/example/Sources/example/main.swift)

### How it looks:

<img src="./assets/xcode.png" width="500" height="300">
</br>
</br>
<img src="./assets/discord.png">

</br>

### Contribution:

I Would ❤️ to see any contributions. If you do liked my work, show some ❤️ by ⭐ repo.
Also you can appreciate me by buy me a coffee:
</br>
</br>
<a href="https://www.buymeacoffee.com/johnmelodymel" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee"  width="300" height="80" ></a>
