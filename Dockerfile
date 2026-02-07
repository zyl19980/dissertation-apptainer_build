# 使用同样的基底
FROM nvcr.io/nvidia/pytorch:24.01-py3

# 设置环境变量
ENV HF_HUB_OFFLINE=1
ENV DEBIAN_FRONTEND=noninteractive

# 安装依赖 (与 .def 中的 %post 内容一致)
RUN apt-get update && apt-get install -y git wget vim && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir vllm==0.6.3 openai modelscope && \
    apt-get clean && rm -rf /var/lib/apt/lists/*