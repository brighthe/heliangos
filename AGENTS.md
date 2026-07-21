# AGENTS.md

本文件指导 **Codex、Antigravity 等非-Claude AI** 在 `heliangos` 中工作。

## 必读入口

在开始任务前，应先读取并遵守：

1. [ai/context.md](ai/context.md)：所有 AI 共享的通用上下文——仓库定位、模块地图、微信模块工作方式、写作约定、可用能力、安全约束、隐私要求。
2. 本文件：Codex & Antigravity 专用补充（配置位置、Hook 实现）。

## Codex & Antigravity 专用补充

### 配置位置

- **Codex**：[.codex/](.codex/) 下 —— `agents/*.toml`（`intent-analyst`、`reply-reviewer`）、`hooks.json`（接线 Hook）、`hooks/`。
- **跨工具技能**：[.agents/skills/](.agents/skills/) 下 —— `wechat-work-style` 写作风格技能。

### Hook（“不驱动微信”硬约束的实现）

[.codex/hooks.json](.codex/hooks.json) 配置了 `PreToolUse` 钩子，拦截 computer-use 的键盘输入与批量动作（`type`/`key`/`hold_key`/`computer_batch`/`teach_batch`/`teach_step`）。脚本**复用 Claude 侧的** [.claude/hooks/block-wechat-automation.ps1](.claude/hooks/block-wechat-automation.ps1)，确保任何情况下都**不会替我打字或发送微信消息**。

### 中文 Markdown 编码

编辑中文文档时保持 UTF-8；使用 PowerShell 整体读写文件时必须显式指定 `-Encoding UTF8`，修改后检查乱码和 Mojibake。
