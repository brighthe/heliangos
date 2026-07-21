# CLAUDE.md

本文件指导 **Claude Code** 在 `heliangos` 中工作。

## 共享上下文（import 自动加载）

下行 import 会在会话启动时把所有 AI 共享的通用上下文（仓库定位、模块地图、微信模块工作方式、写作约定、可用能力、安全约束、隐私要求）展开加载，无需另行读取：

@ai/context.md

## Claude Code 专用补充

### 配置位置

技能 / 子代理 / 命令 / hook 都在根目录 [.claude/](.claude/) 下：

- `settings.json` —— 接线 Hook。
- `commands/` —— `/log-chat`、`/draft-reply`。
- `agents/` —— `intent-analyst`、`reply-reviewer`。
- `skills/wechat-work-style/` —— 写作风格技能。
- `hooks/block-wechat-automation.ps1` —— 安全硬约束脚本。

### Hook（“不驱动微信”硬约束的 Claude 实现）

[.claude/settings.json](.claude/settings.json) 配置了 `PreToolUse` 钩子，由 [.claude/hooks/block-wechat-automation.ps1](.claude/hooks/block-wechat-automation.ps1) 拦截 computer-use 的键盘输入与批量动作（`type`/`key`/`hold_key`/`*_batch`/`teach_*`），确保 Claude 任何情况下都**不会替我打字或发送微信消息**。
