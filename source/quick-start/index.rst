快速上手
========

该章节将会简单描述如何安装 KookyBot SDK 并编写、运行一个简单的机器人。

添加依赖
--------

您可以通过多种方法安装 KookyBot SDK。我们推荐使用 JitPack 配合 Gradle
或者 Maven 等工具，这样您可以更方便的管理版本以及其他依赖。
但是，如果您愿意的话，您也可以将构建好的 jar 导入到您的项目中。

使用 JitPack 与 Gradle/Maven 等工具（推荐）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

自行构建 jar 并导入（不推荐）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. clone 本仓库到您的计算机上

.. code:: bash

   git clone https://github.com/KookyBot/KookyBot.git

2. 运行 ``gradle jar`` 构建 jar
3. 在 ``builds/libs`` 目录下找到构建完成的 jar
4. 依照您的 IDE 的操作方法将 jar 导入到项目中
5. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！

下载 GitHub Release 的 jar 包（不推荐）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. 前往 `GitHub Release 页面 <https://github.com/KookyBot/KookyBot/releases>`_ 并下载您需要的版本的 jar 包
2. 依照您的 IDE 的操作方法将 jar 导入到项目中
3. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！

下载 GitHub Action 的 jar 包（不推荐）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. 前往 `GitHub Action 页面 <https://github.com/KookyBot/KookyBot/actions>`_
2. 选择您需要的 commit 版本
3. 前往页面的 ``Artifacts`` 部分，点击 ``KookyBot-[commit-hash]`` 下载
   GitHub Action 构建的版本
4. 下载后解压 zip 包，您即可获得构建好的 jar 包
5. 依照您的 IDE 的操作方法将 jar 导入到项目中
6. 现在 KookyBot SDK 已经添加到您的项目中，您可以开始使用本 SDK 开发了！
