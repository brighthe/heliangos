# block-wechat-automation.ps1
# 微信模块策略：computer-use 可用于「截取/浏览」聊天记录（截图、点开会话、滚动都放行），
# 但禁止 Claude 用键盘输入/批量动作「替用户打字、发送消息」。
#
# 本钩子匹配 computer-use 的键盘类与批量类工具（type / key / hold_key / *_batch / teach_*），
# 作为 PreToolUse 钩子以退出码 2 阻止调用，并把提示写入 stderr 交还给 Claude。
# 截图、left_click、scroll、screenshot 等不在匹配范围，可正常用于截取聊天记录。
[Console]::Error.WriteLine("[已拦截] 本仓库只允许用 computer-use『截取/浏览』微信聊天记录（截图、点开会话、滚动），禁止键盘输入或批量动作替用户发送消息。若需回复，请由 Claude 起草草稿、你自己发送。")
exit 2
