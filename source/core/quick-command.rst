快速命令
======

快速命令是一种更简洁的命令实现方式，但是他没有自动补全、自动生成帮助、错误提示等功能，请根据需求使用。

使用方法
-------

在你自己的 **类监听器** 中添加：

.. code:: java

    @EventHandler
    @Filter(pattern = ".echo num {num,\\d+}")
    public void channelQC(String num, CommandSource commandSource) {
        commandSource.sendMessage(num);
    }

关于Filter注解的格式，是在一个完整的输入中，把参数替换为 :code:`{name,regex}` ，其中逗号和regex可选。

java中，函数参数列表顺序必须是Filter的顺序且最后一个参数必须是CommandSource。

kotlin中可以任意顺序。