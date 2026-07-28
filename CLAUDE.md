# CLAUDE.md

本文件指导 **Claude Code** 在 `heliangos` 中工作。

## 共享仓库入口

下行 import 在会话启动时加载仓库定位、模块和文档职责：

@README.md

记录聊天、建立联系人或路由事实时读取 `ai/wechat-workflow.md`；起草、修改或审阅微信回复时读取 `ai/wechat-writing-style.md`；只有明确要求 commit 或 push 时才读取 `ai/git-workflow.md`。

## Claude Code 专用补充

### 配置位置

- `settings.json`：接线 Hook。
- `commands/`：`/log-chat`、`/draft-reply`。
- `agents/`：`intent-analyst`、`reply-reviewer`。
- `skills/wechat-work-style/`：微信工作沟通风格入口。
- `skills/wechat-log-and-route/`：聊天归档与跨仓库事实路由入口。
- `hooks/block-wechat-automation.ps1`：安全硬约束脚本。

### Hook

[.claude/settings.json](.claude/settings.json) 配置 `PreToolUse` 钩子，由 [.claude/hooks/block-wechat-automation.ps1](.claude/hooks/block-wechat-automation.ps1) 拦截 computer-use 的键盘输入与批量动作（`type`、`key`、`hold_key`、`*_batch`、`teach_*`），确保 Claude 不替用户输入或发送微信消息。
