# 我的 RIME 方案及词库

## 方案
1. [小鹤双拼](https://www.flypy.com/)
2. [日本語](https://github.com/gkovacs/rime-japanese)

## 安装方法
注：只需关注「用户文件夹」（下称 `$USER_DIR`），所有文件均不需要安装至「程序文件夹」。

将所有 `*.yaml`, `*.txt`, `*.lua` 文件放到 `$USER_DIR` <del>将所有 `build/*.bin` 放到 `$USER_DIR/build`</del>[^1], 然后重新部署。

[^1]: RIME 的算法程序会修改 `*.bin` 文件，而且似乎每个平台并不兼容，因此需要根据平台的不同在[小鹤网盘](http://flypy.ys168.com)下载。
