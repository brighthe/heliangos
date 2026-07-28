# 微信沟通模块

本模块按“联系人实体”集中保存沟通事件和回复上下文；由聊天确认的行政、项目、科研、软件或工具事实，按内容路由到各自业务仓库。完整执行规则见 [微信归档与事实路由工作流](../ai/wechat-workflow.md)。

## 目录结构

```text
wechat/
├── README.md
├── contacts/
│   └── <姓名>.md
├── templates/
│   └── contact.md
└── indexes/
    ├── by-context.md
    └── by-repository.md
```

所有联系人都存放在 `contacts/`，不按人生阶段、学校或关联仓库搬动文件。默认文件名为 `<姓名>.md`；出现同名联系人时使用 `<姓名>--<机构>.md`，frontmatter 中的 `person` 仍保存真实姓名。

## 联系人 schema

每位联系人文件以 YAML frontmatter 开头：

```yaml
---
record_type: wechat-contact
person: <姓名>
contexts:
  - <场景>
related_repositories: []
---
```

- `contexts`：相识或沟通场景，例如 `dlut-postdoc`、`xiangtan-phd`、`faculty-job-search`；一个人可以有多个场景。
- `related_repositories`：稳定、持续的业务关联，只用于检索和路由。单次聊天把事实路由到某仓库，不自动建立长期映射。
- 不设置 `default_repository`。同一人在不同聊天中可能涉及不同领域，必须按内容判断。

新建联系人时复制 [templates/contact.md](templates/contact.md)，并同步更新 [按场景索引](indexes/by-context.md) 与 [按仓库索引](indexes/by-repository.md)。

## 索引规则

- `by-context.md` 按 `contexts` 分组。
- `by-repository.md` 按 `related_repositories` 分组，并列出无长期映射的联系人。
- 索引只保存姓名与联系人链接，不复制单位、角色、进度或业务事实。
- frontmatter 发生变化时必须同步索引；联系人档案仍是权威来源。

## 信息边界

| 内容 | 单一事实来源 |
| --- | --- |
| 人物关系、称呼、沟通口径、沟通层未决、聊天原文 | 当前联系人文件 |
| 博士后行政生命周期 | `heliangos:career/dlut-postdoc.md` |
| 研究院任务、计划与进度 | `dut-institute-work` |
| 科研路线、调研与工作汇报 | `dut-postdoc` |
| 软件功能、缺陷与实现任务 | `soptx` |
| 工具、环境、配置与迁移 | `workstation` |

跨仓库引用统一使用 `repository:repo-relative-path#heading`：

```text
heliangos:wechat/contacts/李宁宁.md#2026-07-20
dut-institute-work:hpc/plan.md#协作与汇报
```

## 记录与路由

把聊天截图或文字交给 AI，使用 `wechat-log-and-route` 或 `/log-chat <姓名>`：

1. 在 `wechat/contacts/` 中按 frontmatter 的 `person` 定位联系人；同名、未建档或场景不明时先确认。
2. 忠实转写、按日期去重追加，只保存文字；已经发送的内容以实际发送版本为准。
3. 更新人物档案、沟通口径和沟通层未决；默认保留可见原文，只有明确要求时才脱敏。
4. 对明确形成的业务事实，在同一任务更新所属业务仓库；有歧义时先报告并请求确认。
5. 新聊天小节可按需写入：

```markdown
> 关联：`dut-institute-work:hpc`
> 派生更新：`dut-institute-work:hpc/plan.md`
```

自动路由不包含 commit 或 push，也不在本仓建立业务待办副本。

## 起草回复

使用 `/draft-reply <姓名> <消息>`。AI 读取联系人档案和近期聊天；来意复杂时先用 `intent-analyst`，再按 [微信写作风格](../ai/wechat-writing-style.md) 起草。重要回复可交给 `reply-reviewer` 审校。AI 只产出草稿，由我自己发送。
