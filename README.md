Latest-laravel
==============

每天更新的Laravel完整包，下载直接可以运行。 [赞助本项目](#%E8%B5%9E%E5%8A%A9dollar)

- 本项目主要解决以下问题：

    - 不会用`composer`或者不太会用；
    - `composer` 装不上或者装上了但是`composer install`特别慢。

- 更新频率：
    > 每天上午 :clock830:`8:30`

- Laravel 分支
    - `master` 也就是目前的4.2, 对应包名： `laravel-master.tar.gz`
    - `develop` 也就是5.0(还未发布，天天都在变哦) 对应包名：`laravel-develop.tar.gz`

 如果你发现目录中不存在某个包，那么这个包就是打包失败，很有可能是开发版作者的修改还未完成以至于打包失败。错误日志见[issue](https://github.com/overtrue/latest-laravel/issues)

# 使用
1. 下载本项目里的`laravel-xxxxx.tar.gz`文件, 然后在你的www目录下触压；
2. 给`storeage`目录的写权限，*unix用户参考：`chmod -R 755 ./storeage`；

完成，访问`http://localhost/laravel/public/` 即可看到欢迎页面。

_本项目打包时会清除首页模板的google字体引用，避免半天打不开首页的情况。_

>>>>>>> f371fa002d8e20f82e21a93f21cabd6a1600e7f3

## 原理

:bulb: 从`laravel/laravel`更新:inbox_tray: :arrow_right:  使用`composer install`安装依赖 :arrow_right: 打包:package: :arrow_right:  push 到GitHub :outbox_tray:

更多请直接参考脚本：[update.sh](https://github.com/overtrue/latest-laravel/blob/master/scripts/update.sh) :sweat_smile: shell功底差，请多指教！

## 说明
- 本项目的前提你还是要满足基本条件才能正常运行Laravel：`php >= 5.4 && mcrypt 拓展`
- `public`目录才是网站根目录，所以如果你要添加虚拟主机请把`document root` 设置到`public`，至于为什么这里不想做过多的解释，你就这么认为就好了。

## 赞助:dollar:
本项目运行在DigitalOcean机器上，如果您觉得对你有帮助愿意捐助的话有两种方式：

1. 我的支付宝：anzhengchao@gmail.com
2. 直接转到我的PayPal：anzhengchao@gmail.com（有PayPal的朋友推荐使用此方式，免去我找淘宝充PayPal的麻烦:sweat_smile:）

请留下您的联系方式，感谢！

## 关于Laravel
请参考：http://laravel.com/ 或者 中文版:http://www.golaravel.com/

