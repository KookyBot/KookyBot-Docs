# 事件机制

事件是聊天机器人的灵魂。在这一节中，我们将介绍 KookyBot 的事件系统的基本使用和实现细节。

## 事件监听器的基本类型

KookyBot 支持这些事件监听器:

| 名称 | 详情 | 使用方法 |
|------|------|----------|
| 单方法监听器 | 使用一个方法监听某类事件，最方便快捷 | 通过 EventManager.addListener |
| 类监听器 | 多个方法一起监听，自由度更高 | 继承 Listener |
| 点击监听器 | 仅在 CardMessage.ModuleScope.ButtonElement 中使用，您只需要设置 onclock 参数即可自动设置，是创建按钮的不二选择 | 设置 onclick 参数即可 |
| 指令监听器 | 由 Brigadier 提供的构建+提示+执行命令系统 | client.addCommand<br/>参见 [命令机制: Brigadier 以及如何使用它](../command/index) |

## 我应该如何选择使用的监听器？

快速开发使用**单方法监听器**，一个复杂功能使用**类监听器**，命令直接使用 **Brigadier** ，创建 CardMessage 时可以选择快捷的 **onclick** 或自由度更高的 **自行监听点击事件**。

## 他们是如何工作的？

**注意：**

**监听器只会根据最终对象的类型分配事件，所以，如果监听了包括但不限于 `Event`、`MessageEvent` 等类型，此监听器无法正常工作。**

websocket 或 webhook 收到消息后，先进行解密、解压获取到 json，然后交给 EventManager，并解析为类型不同的事件对象，最后根据对象的类型分配给每一个正确注册的监听器。
