命令机制: Brigadier 以及如何使用它
======

关于Brigadier用法也可以查看 `官方文档 <https://github.com/Mojang/brigadier#usage>`_ ，但是这里的也许更有用一点。

Brigadier 是 Mojang 开发的一款命令库，最初用于解析 Minecraft 游戏中的命令。该库提供了一系列方便快捷的方法帮助构建命令树、自动生成帮助、权限鉴别、命令执行、参数、命令提示等。

添加命令：register
----------------
你可以使用 :code:`CommandDispatcher<CommandSource>.register()` 来注册命令。

.. tabs::

   .. code-tab:: kotlin Kotlin

        client.eventManager.dispatcher.run {
            register(/*...*/)
         }

   .. code-tab:: java Java

        var dispatcher = client.eventManager.dispatcher;
        dispatcher.register(/*...*/);

执行命令：executes
----------------
使用:code:`executes`描述您的命令如何执行

这里是用了:code:``

.. tabs::

   .. code-tab:: kotlin Kotlin

        dispatcher.register(
            LiteralArgumentBuilder.literal<CommandSource?>("test") // kotlin 需要泛型参数
            .executes { it -> // it: CommandContext<CommandSource>
                it.sourxe.sendMessage("Hello, world!")
                0 // return value is 0
            }
        )

   .. code-tab:: java Java

         client.eventManager.dispatcher.register(LiteralArgumentBuilder.literal("test")
            .executes (context -> { // context: CommandContext<CommandSource>
                it.sourxe.sendMessage("Hello, world!");
                return 0; // return value is 0
            })
        )

现在，你可以使用 :code:`/test` 来执行这个命令

命令源：CommandSource
---------
表示谁执行了命令。

你可以用 :code:`context.getSource` 来获取命令源。

当type为Console时，命令源是控制台，拥有root权限，无视权限检查。

当type为Private时，命令源时私聊，private字段非null

当type为Channel时，命令源是频道，channel和user字段非null

timestamp字段永远非null，是消息的timestamp或控制台输入的时间

命令树介绍
------
当你输入一串命令 :code:`/say 啊吧啊吧` ，试想它是如何被执行的？
首先，dispatcher发现了前缀 :code:`/` ，认为这是一个命令。
然后找到了say命令，发现它接受一个string类型的参数，所以 :code:`啊吧啊吧` 被认为是一个参数。
最后，dispatcher找到了一个executes方法，所以 :code:`/say 啊吧啊吧` 被执行了。

这个过程中的每一步都是被认为是一个命令树节点，并且每一个节点都可以有自己的子节点，于是所有节点构成了一颗命令树。
当你执行命令后，dispatcher将解析它，并在命令树中寻找合适的节点，
调用那个节点的executes函数执行命令（这也是executes的底层原理）

接下来，请牢记这个知识点，它将在后续的章节中被用到。

then: 命令树的树枝
------
前面我们了解了命令树，考虑这种情况：

::
    register: /test
    Situation 1: /test greet <message>
    Situation 2: /test save <filename> <content>

那么，我们怎么实现不同的命令树节点呢？

答案是 :code:`then`

.. tabs::

   .. code-tab:: kotlin Kotlin

        dispatcher.register(
            LiteralArgumentBuilder.literal<CommandSource?>("test") // kotlin 需要泛型参数
            .executes { it -> // 用户输入/test执行这个
                it.sourxe.sendMessage("Hello, world!")
                0 // return value is 0
            }
            .then(LiteralArgumentBuilder.literal<CommandSource?>("greet")
                .executes { it -> // 用户输入/test greet执行这个
                    it.sourxe.sendMessage("Usage: /test greet <message>")
                    0 // return value is 0
                }
            )
            .then(LiteralArgumentBuilder.literal<CommandSource?>("save")
                .executes { it -> // 用户输入/test save执行这个
                    it.sourxe.sendMessage("Usage: /test save <filename> <content>")
                    0 // return value is 0
                }
                // 怎么实现参数呢？看后面的章节
            )
        )

   .. code-tab:: java Java

         client.eventManager.dispatcher.register(LiteralArgumentBuilder.literal("test")
            .executes (context -> { // context: CommandContext<CommandSource>
                it.sourxe.sendMessage("Hello, world!");
                return 0; // return value is 0
            })
            .then(LiteralArgumentBuilder.literal("greet")
                .executes (context -> { // context: CommandContext<CommandSource>
                    it.sourxe.sendMessage("Usage: /test greet <message>");
                    return 0; // return value is 0
                })
            )
            .then(LiteralArgumentBuilder.literal("save")
                .executes (context -> { // context: CommandContext<CommandSource>
                    it.sourxe.sendMessage("Usage: /test save <filename> <content>");
                    return 0; // return value is 0
                })
                // 怎么实现参数呢？看后面的章节
            )
        )

literal: 文本常量
------
柑橘前面的例子，或许你已经明白了：:code:`LiteralArgumentBuilder.literal("text")`是新建一个文本常量，这个文本常量是一个命令树的节点。

如果用户输入匹配到了这个节点，他就会进入命令树的这一分枝。

添加参数: RequiredArgumentBuilder
--------------------------------
接下来，你的命令需要参数了！

参数需要 :code:`then(...)` 中添加argument的分支。argument有一个类型信息。

栗子

.. tabs::

   .. code-tab:: kotlin Kotlin

       .then(RequiredArgumentBuilder.argument<CommandSource?, String?>("arg name", StringArgumentType.word())).executes {
            it.source.sendMessage(StringArgumentType.getString(it, "arg name"))
            0
        }

   .. code-tab:: java Java

        .then(RequiredArgumentBuilder.argument("arg name", StringArgumentType.word())).executes (context -> {
            context.source.sendMessage(StringArgumentType.getString(content, "arg name"));
            return 0;
        }

请注意以下几点：

1. Kotlin由于null安全原因，有时候必须制定泛型参数，请根据ide提示自行添加。
2. :code:`StringArgumentType.getString` 是一个静态方法。KookyBot内置的所有ArgumentType均包括类似方法。
3. 支持的ArgumentType见下表：

.. table::

    ============= ==================================== ========================================================
      来源              名称                              获取方法
    ============= ==================================== ========================================================
      Brigadier    StringArgumentType.word               StringArgumentType.getString
      Brigadier    StringArgumentType.string             StringArgumentType.getString
      Brigadier    StringArgumentType.greedyString       StringArgumentType.getString
      Brigadier    IntegerArgumentType.integer           IntegerArgumentType.getInteger
      Brigadier    BoolArgumentType.bool                 BoolArgumentType.getBool
      Brigadier    FloatArgumentType.floatArg            FloatArgumentType.getFloat
      KookyBot     StringListArgumentType.stringList     StringListArgumentType.getStringList
      KookyBot     UserArgumentType.id                   UserArgumentType.getId /\*将(met)id(met)解析为id\*/  
    ============= ==================================== ========================================================

让控制台的输入以命令方式执行
-----------------------

使用 :code:`client.eventManager.parseCommand(String command)` 可以让dispatcher执行命令，且命令源为控制台。

获取命令树的节点
------

参见 `官方文档 <https://github.com/Mojang/brigadier#usage>`_ 

模拟执行命令
------

请使用 :code:`dispatcher.execute()`

生成help
------

参见 `Brigadier Docs <https://github.com/Mojang/brigadier#displaying-usage-info>`_

权限系统
------

摸鱼ing