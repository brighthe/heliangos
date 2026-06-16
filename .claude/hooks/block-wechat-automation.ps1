# block-wechat-automation.ps1
# 本仓库微信模块为「只起草」模式：拦截 computer-use / 浏览器自动化类工具，
# 防止 Claude 直接读取或操作微信窗口、代替用户发送消息。
#
# 作为 PreToolUse 钩子：以退出码 2 阻止工具调用，并把提示写入 stderr 交还给 Claude。
[Console]::Error.WriteLine("[已拦截] 本仓库为『只起草』模式，请勿用电脑操控或浏览器自动化直接读写微信。把老师的消息粘贴给我，我读上下文后产出回复草稿，由你自己复制发送。")
exit 2
