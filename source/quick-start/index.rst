快速上手
========

| 该章节将会简单描述如何安装 KookyBot SDK 并编写、运行一个简单的机器人。
| 您也可以参考 `Kotlin 示例代码仓库 <https://github.com/KookyBot/KookyBotDemoKt>`_ 来帮助您快速上手。

添加依赖
--------

我们在此处将会演示如何使用 jitpack 搭配 Gradle/Maven 等工具来添加 KookyBot SDK 作为项目依赖。

`Kotlin Gradle 示例代码 <https://github.com/KookyBot/KookyBotDemoKt/blob/main/build.gradle.kts>`_ 

1. 添加 Mojang 仓库

KookyBot 使用 `Mojang Brigadier <https://github.com/Mojang/brigadier>`_ 作为命令解析器，所以您需要添加 Mojang 的依赖仓库来让 KookyBot 的命令机制正常工作

.. tabs::

   .. code-tab:: kotlin Gradle Kotlin

         repositories {
            ...
            maven { url = uri("https://libraries.minecraft.net") }
         }

   .. code-tab:: groovy Gradle Groovy

         repositories {
            ...
            maven { url 'https://libraries.minecraft.net' }
         }

   .. code-tab:: xml Maven

         <repositories>
            <repository>
               <id>mclib</id>
               <url>https://libraries.minecraft.net</url>
            </repository>
         </repositories>

2. 添加 JitPack 作为依赖仓库

KookyBot 目前使用 jitpack 作为依赖仓库，所以您需要添加 jitpack 来让 Gradle/Maven 可以正常获取 KookyBot

.. tabs::

   .. code-tab:: kotlin Gradle Kotlin

         repositories {
            ...
            maven { url = uri("https://jitpack.io") }
         }

   .. code-tab:: groovy Gradle Groovy

         repositories {
            ...
            maven { url 'https://jitpack.io' }
         }

   .. code-tab:: xml Maven

         <repositories>
            <repository>
               <id>jitpack.io</id>
               <url>https://jitpack.io</url>
            </repository>
         </repositories>

3. 添加 slf4j 到依赖中

KookyBot 使用 `slf4j <https://www.slf4j.org>`_ 作为 LOG 库，所以您需要添加 slf4j 到依赖中

.. tabs::

   .. code-tab:: kotlin Gradle Kotlin

         dependencies {
            ...
            // KOOK SDK
            implementation("org.slf4j:slf4j-simple:1.7.11")
         }

   .. code-tab:: groovy Gradle Groovy

         dependencies {
            ...
            // KOOK SDK
            implementation 'org.slf4j:slf4j-simple:1.7.11'
         }

   .. code-tab:: xml Maven

         <dependencies>
            <!-- KOOK SDK -->
            <dependency>
               <groupId>org.slf4j</groupId>
               <artifactId>slf4j-simple</artifactId>
               <version>1.7.11</version>
            </dependency>
         </dependencies>

4. 添加 KookyBot 到依赖中

.. note::
   | 注意，假如您希望使用实验版或者指定 commit 构建
   | 请将版本 tag（下文中的 :code:`0.1.3-SNAPSHOT`\ ）改为 :code:`master-SNAPSHOT`\（基于主分支最新 commit 的构建）或者 commit 哈希

.. tabs::

   .. code-tab:: kotlin Gradle Kotlin

         dependencies {
            ...
            // KOOK SDK
            implementation("com.github.KookyBot:KookyBot:0.1.3-SNAPSHOT")
         }

   .. code-tab:: groovy Gradle Groovy

         dependencies {
            ...
            // KOOK SDK
            implementation 'com.github.KookyBot:KookyBot:0.1.3-SNAPSHOT'
         }

   .. code-tab:: xml Maven

         <dependencies>
            <!-- KOOK SDK -->
            <dependency>
               <groupId>com.github.KookyBot</groupId>
               <artifactId>KookyBot</artifactId>
               <version>0.1.3-SNAPSHOT</version>
            </dependency>
         </dependencies>

5. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！

编写你的第一行代码
-------------------

现在，KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！在合适的地方创建 :code:`Application.kt`\ 或者
:code:`Main.java`\ 文件，然后在这个文件中开发你的第一个 KookyBot 机器人。

`Kotlin 示例代码 <https://github.com/KookyBot/KookyBotDemoKt/blob/main/src/main/kotlin/io/github/kookybot/Application.kt>`_ 

.. tabs::

   .. code-tab:: kotlin

         package [your-package-name]

         import java.io.File
         import io.github.kookybot.client.Client
         import io.github.kookybot.events.channel.ChannelMessageEvent

         suspend fun main() {
            // Read the KOOK bot token / 读取 KOOK bot token
            val token = File("data/token.txt").readLines().first()
            // Create a new KOOK bot client / 创建一个新的 KOOK bot 客户端
            val client = Client(token) {
               // Register default Brigadier commands / 注册默认 Brigadier 命令
               withDefaultCommands()
            }
            // Start the KOOK bot client / 启动 KOOK bot 客户端
            val self = client.start()
            // Add a listener for channel messages / 添加一个监听器以侦听频道消息
            client.eventManager.addListener<ChannelMessageEvent> {
               // Message is "hello" / 消息是 "hello"
               if (content == "hello") {
                     // Send "Hello, world!" to the channel / 发送 "Hello, world!" 到频道
                     channel.sendMessage("Hello, world!")
               }
            }
         }

   .. code-tab:: java

         // Coming soon...

现在，将机器人邀请到您的服务器中，并在频道中发送 :code:`hello`\  试试看！您也可以发送 :code:`/help`\  命令来获取默认命令帮助。
