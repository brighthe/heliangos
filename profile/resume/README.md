# 何亮的个人简历（LaTeX）

个人简历的**唯一权威版本**，求职、对外自我介绍等所有场景统一从这里取用与更新。

## 文件说明

| 文件 | 说明 |
| --- | --- |
| [resume.tex](resume.tex) | 简历源文件（正文内容与样式都在这一个文件里） |
| [resume.pdf](resume.pdf) | 编译产出的成品 |
| `images/` | `photo-id.jpg` 证件照（正文引用）、`photo-full.jpg` 全身照（备用）、`xtu-logo.png` / `xtu-watermark.png` 湘潭大学校徽与水印、`header-band.png` / `footer-band.png` 页眉页脚底纹 |
| `fonts/` | 内置 NotoSerifSC 字体，编译无需额外装字体 |

## 编译

```
xelatex resume.tex
```

用 `XeLaTeX` 或 `LuaLaTeX` 编译（依赖 `fontspec` 加载内置字体），产出 `resume.pdf`。

## 对外发送约定

**不要直接发 `resume.pdf`**，发送时另存为语义清晰的文件名，如：`何亮-简历-2026.pdf`。

## 模板来源

基于宁波大学（NBU）LaTeX 中文简历模板，其上游为 [SEU 中文 CV 模板](https://www.overleaf.com/latex/templates/seu-cv-dong-nan-da-xue-latex-zhong-wen-jian-li-mo-ban/jyzpthvnbmpm) 与 [NPU 中文 CV 模板](https://www.overleaf.com/latex/templates/npu-cv/mncqzxhvfzrx)。校徽、配色与版式已按个人需要修改。
