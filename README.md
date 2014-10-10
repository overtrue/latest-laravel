latest-laravel
==============

每天更新的Laravel完整包，下载直接可以运行。

本项目主要解决以下问题：

1. 不会用`composer`或者不太会用；
2. `composer` 装不上或者装上了但是`composer install`特别慢；

更新频率：每天上午 :clock830:`8:30`，如果哪天你发现缺少某个分支的包，请查看[错误报告](https://github.com/overtrue/latest-laravel/issues) 会看到当天的错误日志。

# 使用
1. 下载本项目里的`laravel-xxxxx.tar.gz`文件（你可以选择使用`git clone`或者点击上面目录中的文件后`view raw`下载）, 然后在你的www目录下触压；
2. 修改laravel目录为`www`目录的用户和用户组；
3. 添加`storeage`目录的写权限，*unix用户参考：`chmod -R 755 ./storeage`；

完成，访问`http://localhost/laravel/public/` 即可看到欢迎页面，如果打开页面感觉慢的话，是因为模板中使用了google字体的原因(不是所谓的框架慢...:joy:)

## :heavy_exclamation_mark:注意
`public`目录才是网站根目录，所以如果你要添加虚拟主机请把`document root` 设置到`public`，至于为什么这里不想做过多的解释，你就这么认为就好了。

## 原理

:bulb: 从`laravel/laravel`更新:inbox_tray: :arrow_right:  使用`composer install`安装依赖 :arrow_right: 打包:package: :arrow_right:  push 到GitHub:outbox_tray:

更多请直接参考脚本：[update.sh](https://github.com/overtrue/latest-laravel/blob/master/update.sh) :sweat_smile: shell功底差，请多指教！

更多请参考：http://laravel.com/ 或者 中文版:http://www.golaravel.com/

