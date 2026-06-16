# block-wechat-automation.ps1
# 工作方式：用户把微信聊天截图/文字发给 Claude，Claude 只产出文本，不驱动微信。
# 作为防御性硬约束，拦截 computer-use 的键盘类与批量类工具
# （type / key / hold_key / *_batch / teach_*），确保 Claude 任何情况下都
# 不会替用户打字或发送微信消息。
#
# PreToolUse 钩子：以退出码 2 阻止调用，并把提示写入 stderr 交还给 Claude。
[Console]::Error.WriteLine("[已拦截] 本仓库不通过 computer-use 操作微信。请让我把你发来的聊天截图/文字转写记录，或起草回复草稿由你自己发送，切勿用键盘/批量动作替你打字或发消息。")
exit 2
