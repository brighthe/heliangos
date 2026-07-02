# CLAUDE.md（Claude Code 专属）

本文件指导 **Claude Code** 在本仓库工作。**请先读通用上下文 [../common/context.md](../common/context.md)**——仓库定位、模块地图、微信模块工作方式、写作约定、可用能力、安全约束、隐私要求都在那里。本文件只补 Claude Code 的运行时专属细节。

## Claude Code 配置位置

技能 / 子代理 / 命令 / hook 都在根目录 [.claude/](../../.claude/) 下：

- `settings.json` —— 接线 Hook。
- `commands/` —— `/log-chat`、`/draft-reply`。
- `agents/` —— `intent-analyst`、`reply-reviewer`。
- `skills/wechat-work-style/` —— 写作风格技能。
- `hooks/block-wechat-automation.ps1` —— 安全硬约束脚本。

## Hook（“不驱动微信”硬约束的 Claude 实现）

[.claude/settings.json](../../.claude/settings.json) 配置了 `PreToolUse` 钩子，由 [.claude/hooks/block-wechat-automation.ps1](../../.claude/hooks/block-wechat-automation.ps1) 拦截 computer-use 的键盘输入与批量动作（`type`/`key`/`hold_key`/`*_batch`/`teach_*`），确保 Claude 任何情况下都**不会替我打字或发送微信消息**。
