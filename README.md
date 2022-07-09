**中文** | [English](README.en.md)

<h1 align="center">KookyBot-Docs</h1>

<p align="center">
  <b>KookyBot SDK 文档</b>
</p>

<p align="center">
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-CC--BY--NC--SA--4.0-important?style=for-the-badge" />
  </a>
</p>

## 贡献文档指南

**您的提交信息应当遵守 [约定式提交](https://www.conventionalcommits.org/zh-hans/v1.0.0/) 规则**

### 安装文档所需依赖

``` bash
pip3 install -r requirements.txt
```

### 编译文档（将 Sphinx 的 rst/md 文件转换为 html 文件）

（该步骤仅用于预览编辑后的文件）

``` bash
make clean
make html
```

文档会在 `docs/html` 目录下以 `en_US`（英语（美国））生成。

如果你需要更改生成的语言，可以将 `source/conf.py` 文件中第 58 行 `language = os.environ.get('READTHEDOCS_LANGUAGE', 'en_US')` 中的 `en_US` 改为你想要的语言。

### 更新翻译文件

（该步骤以英文为例，如果需要使用其他语言，将 `en_US` 替换为目标语言）

``` bash
cd source
sphinx-build -b gettext . _locale
sphinx-intl update -p _locale -l en_US
```

该步骤会在 `source/_locale/en_US` 下生成一些 `.po` 文件，这些文件会被用于存储翻译内容：

- 空的翻译字符串会被增加，用于存储新增加的内容的翻译
- `#, fuzzy` 会被添加到被更改内容的 `msgid` 字符串的上一行。请更新翻译并移除 `#, fuzzy`。
- 被删除的翻译内容会被移动到 `.po` 文件的末尾并被注释，请移除这些翻译。

## 📜 协议&许可证

> **KookyBot-Docs 的内容基于 [CC-BY-NC-SA-4.0 许可证](license-translations/LICENSE-zh)（[原文](LICENSE)）发行**

``` text
KookyBot-Docs (c) 由 iXOR Techbology, Cubik65536, 以及 所有贡献者 创作.

KookyBot-Docs 根据知识共享（Creative Commons）
署名—非商业性使用—相同方式共享 4.0 公共许可协议进行分发。

您应该已经收到了一份许可证的副本。如果没有，
请参见 <http://creativecommons.org/licenses/by-nc/4.0/>。
```

> **KookyBot-Docs 的代码使用 [AGPL-3.0-or-later 协议](license-translations/LICENSE-zh.CODE)（[原文](LICENSE.CODE)）作为软件分发许可证**

``` text
KookyBot-Docs - KookyBot SDK 文档
Copyright (C) 2022 CubikTech, Cubik65536 以及 所有贡献者 版权所有。

本程序是自由软件：你可以根据自由软件基金会发布的 GNU Affero 通用公共许可证的条款，
即许可证的第3版或（您选择的）任何后来的版本重新发布它和/或修改它。

本程序的发布是希望它能起到作用。但没有任何保证；甚至没有隐含的保证。本程序的分发
是希望它是有用的，但没有任何保证，甚至没有隐含的适销对路或适合某一特定目的的保证。
参见 GNU Affero 通用公共许可证了解更多细节。

您应该已经收到了一份 GNU Affero 通用公共许可证的副本。如果没有，请参见 <https://www.gnu.org/licenses/>。
```
