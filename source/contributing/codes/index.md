# 贡献指南 - 代码

本文将会详细指导您如何向 [KookyBot 主代码仓库](https://github.com/KookyBot/KookyBot)贡献内容/代码。

如果您想要向 KookyBot 贡献代码，请确保您仔细阅读了本文中的**所有内容**。不符合要求的 PR 将会被拒绝，多次提交不符合要求的 PR 将会使您被封禁。

## 代码格式约定

1. 使用 4 个空格缩进代码，而不是使用 _tabs_。
2. 一行不应超过 80 个字符，如果超过了，请将代码/注释拆分成多行。
3. 使用空格分割运算符，例如：使用 `a + b` 而不是 `a+b`。
4. 开始函数的第一个大括号应该被放在函数声明后面，用一个空格分割，例如：

    使用：

    ``` kotlin
        fun getUrl(): String {
            return "<url>"
        }
    ```

    而非：

    ``` kotlin
        fun getUrl(): String
        {
            return "<url>"
        }
    ```

5. 不要重复无用功
    * [三次法则 (程序设计)](https://zh.wikipedia.org/wiki/三次法则_(程序设计))

## Commit 信息格式规范

您的 commit 信息必须（MUST）遵循[约定式提交](https://www.conventionalcommits.org/zh-hans/v1.0.0/)。

## Pull Request 信息格式规范

对于 Pull Request，在具体信息中请写明本次 PR 的目的（做了 **什么** 工作，修复了 **什么** 问题）。

对于 Pull Request 的标题，推荐使用如下格式书写：

``` text
<修改类型>(<路径/文件名>): <修改的内容> (<对应 issue 的编号（如有）>)
```

修改类型以及示例可以参考[约定式提交](https://www.conventionalcommits.org/zh-hans/v1.0.0/)。
