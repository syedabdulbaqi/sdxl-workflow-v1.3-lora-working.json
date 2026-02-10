# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-custom-scripts@1.2.5 --mode remote

# download models into comfyui
RUN comfy model download --url https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors --relative-path models/checkpoints --filename sd_xl_base_1.0.safetensors
RUN comfy model download --url https://huggingface.co/JCTN/JCTN_LORAxl/blob/9cde7a4715cadb257a6edb6164fe6bcb56275bcd/J_cartoon.safetensors --relative-path models/loras --filename J_cartoon.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
