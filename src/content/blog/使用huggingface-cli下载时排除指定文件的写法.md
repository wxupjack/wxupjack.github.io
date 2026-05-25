---
title: "使用 huggingface-cli 下载时排除指定文件的写法"
description: "使用 huggingface-cli 下载模型时，通过参数列表同时排除多种文件。"
publishDate: 2024-03-11
tags:
  - Hugging Face
  - CLI
---

### 问题
在huggingface官网上，[Command Line Interface](https://huggingface.co/docs/huggingface_hub/main/en/guides/cli#huggingface-cli-login)，对于cli工具的介绍中，包含/排除特定文件只举了以下例子：
```bash
huggingface-cli download stabilityai/stable-diffusion-xl-base-1.0 --include "*.safetensors" --exclude "*.fp16.*"*

huggingface-cli upload Wauplin/space-example --repo-type=space --exclude="/logs/*" --delete="*" --commit-message="Sync local Space with Hub"
```

实例中都是单个条件，然而当你想要排除/包含**多种**文件时，例如：bert-base-uncased 仓库中有 "msgpack, onnx, bin, ot, h5, safetensors" 等多个权重，而我只需要onnx格式。

### 解决方法
此时，需要用***参数列表***来传参：
```bash
huggingface-cli download bert-base-uncased --exclude "*.msgpack" "*.onnx" "*.bin" "*.ot" "*.h5"

# 或简单写法
huggingface-cli download bert-base-uncased --exclude *.msgpack *.onnx *.bin *.ot *.h5
```

### 思路

具体的huggingface-cli相关代码，在Github上 `huggingface_hub`仓库`/src/huggingface_hub/commands/download.py`文件。
1. 其在 `DownloadCommand` 类中，定义了 `--include, --exclude`的参数解析器，参数`nargs="*", type=str`，意为解析后续任意数量的参数，并作为一个string类型的列表返回。
2. 将这两个参数赋值`allow_patterns = self.include; ignore_patterns = self.exclude`，后传入`/src/huggingface_hub/_snapshot_download.py` 的 `snapshot_download`方法。
3. 根据 `snapshot_download`的定义，`allow_patterns (List[str] or str, *optional*)`，与第1条中的定义匹配。
4. 最后，在 `src/huggingface_hub/utils/_paths.py`文件中，定义了 `filter_repo_objects`方法，将仓库中的文件列表，使用 `fnmatch`库（也就是Unix shell 风格的通配符） 与用户指定的格式一一匹配。
