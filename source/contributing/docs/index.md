# 贡献指南 - 文档

本文将会详细指导您如何向本文档贡献内容/代码。

如果您想要向本仓库贡献内容，请确保您仔细阅读了本文中的**所有内容**。不符合要求的 PR 将会被拒绝，多次提交不符合要求的 PR 将会使您被封禁。

## 预览页面以及更新翻译

请参考 [README.md](https://github.com/KookyBot/KookyBot-Docs/blob/main/README.md) 文件中的说明。在更新翻译是请确保您**完全**遵守了 [README.md](https://github.com/KookyBot/KookyBot-Docs/blob/main/README.md) 文件中的要求。

## 格式要求

1. 文件名必须以小写英语命名并以 `-` 分割。 例如：`file-name.rst` / `file-name.md`。
2. 增加新文件是请确保其路径被添加到了 `index.rst` 开头的 `.. toctree::` 中。
3. 增加新的多级页面（例如 `core/event`）时，如果其上级路径（此处为 `core`）已有 index 文件，则直接创建新文件 `event` 即可。如果其上级路径没有 index 文件，且不需要改文件，则创建 `core/event` 文件夹并在其中创建 index 文件。
4. 您可以使用 rst（[reStructuredText](https://www.restructuredtext.net)）或者 md（[Markdown](https://www.markdownguide.org)）格式撰写内容。但是请确保您**完全**遵守了相关语法，您可以在使用 Markdown 时适当使用 html 来实现您想要的效果。
5. 不管使用何种格式，在使用多行代码块时**必须**使用 4 个空格的缩进，且代码块的格式化语言与实际语言相匹配（纯文字内容**不得**留白，格式化语言需要写为 `text`）。
6. 在撰写中文版文档时，如果出现英语词汇（例如专用名词等）或者单行代码块，在该词汇/代码块前后加一个空格以增加可读性，如果前/后是标点符号则可按情况不增加空格。

## Commit 信息格式规范

对于提交时需要填写的 commit 信息，请遵守以下几点基本要求：

1. commit 摘要请简要描述这一次 commit 改动的内容。注意 commit 摘要的长度不要超过 50 字符，超出的部分会自动置于正文中。
2. 如果需要进一步描述本次 commit 内容，请在正文中详细说明。

对于 commit 摘要，推荐按照如下格式书写：

``` text
<修改类型>(<路径/文件名>): <修改的内容>
```

``` {warning}
注意，commit message 中的 `<路径/文件名>` 为相对于 `source` 文件夹的路径，而且除非更改的文件是主页（则文件名为 `index`），否则文件名不需要增加 `index` 来表示文件。文件名后缀也不需要被添加。
```

修改类型分为如下几类：

- `feat`：用于添加内容的情况。
- `fix`：用于修正现有内容错误的情况。
- `refactor`：用于对一个页面进行重构（较大规模的更改）的情况。
- `style`：对于代码风格的更改，例如：空白、格式、缩进等。
- `revert`：用于回退之前更改的情况。

示例：

- `feat(core/event/class-listener): 增加类监听器 Filter 注解的使用指南`
- `feat(core/event/class-listener): Add English locale`
- `feat(core/event/class-listener): Update English locale`
- `fix(core/event): 没有被增加到目录中 (#0001)`
- `fix(core/event): Fix typo in English locale`
- `style(console): 整理 Markdown 格式`
- `refactor(index): 整理页面内容`

## Pull Request 信息格式规范

对于 Pull Request，在具体信息中请写明本次 PR 的目的（做了 **什么** 工作，修复了 **什么** 问题）。

对于 Pull Request 的标题，推荐使用如下格式书写：

``` text
<修改类型>(<路径/文件名>): <修改的内容> (<对应 issue 的编号（如有）>)
```

修改类型、示例以及相关提醒可以参考上面的 commit 信息格式规范。
