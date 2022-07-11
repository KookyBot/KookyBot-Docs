# 快速上手

该章节将会简单描述如何安装 KookyBot SDK 并编写、运行一个简单的机器人。

## 添加依赖

您可以通过多种方法安装 KookyBot SDK。我们推荐使用 JitPack 配合 Gradle 或者 Maven 等工具，这样您可以更方便的管理版本以及其他依赖。
但是，如果您愿意的话，您也可以将构建好的 jar 导入到您的项目中。

### 使用 JitPack 与 Gradle/Maven 等工具（推荐）

```{warning}
本文使用 Gradle Kotlin 作为示例工具，您可能需要根据您使用的工具（Gradle Groovy 或者 Maven 等）调整代码。
```

1. 添加 JitPack 作为 Gradle 仓库

``` kotlin
repositories {
    maven { url = uri("https://jitpack.io") }
}
```

2. 添加 KookyBot 到依赖中

``` kotlin
dependencies {
    // KOOK SDK
    implementation("com.github.KookyBot:KookyBot:0.1.1")
}
```

3. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！

### 自行构建 jar 并导入（不推荐）

1. clone 本仓库到您的计算机上

``` bash
git clone https://github.com/KookyBot/KookyBot.git
```

2. 运行 `gradle jar` 构建 jar
3. 在 `builds/libs` 目录下找到构建完成的 jar
4. 依照您的 IDE 的操作方法将 jar 导入到项目中
5. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！

### 下载 GitHub Release 的 jar 包（不推荐）

1. 前往 [GitHub Release 页面](https://github.com/KookyBot/KookyBot/releases) 并下载您需要的版本的 jar 包
2. 依照您的 IDE 的操作方法将 jar 导入到项目中
3. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！

### 下载 GitHub Action 的 jar 包（不推荐，除非您想要尝试开发版本）

1. 前往 [GitHub Action 页面](https://github.com/KookyBot/KookyBot/actions)
2. 选择您需要的 commit 版本
3. 前往页面的 `Artifacts` 部分，点击 `KookyBot-[commit-hash]` 下载 GitHub Action 构建的版本
4. 下载后解压 zip 包，您即可获得构建好的 jar 包
5. 依照您的 IDE 的操作方法将 jar 导入到项目中
6. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！
