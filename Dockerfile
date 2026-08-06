# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.5-base
# install custom nodes into comfyui
RUN git clone https://github.com/kijai/ComfyUI-WanVideoWrapper /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && cd /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && (git checkout ff779c91714d8ee3484cd4119b082c72a1734b72 2>/dev/null || (git fetch origin ff779c91714d8ee3484cd4119b082c72a1734b72 --depth=1 && git checkout ff779c91714d8ee3484cd4119b082c72a1734b72) || echo "WARN: commit unreachable, falling back to default branch HEAD")
RUN git clone https://github.com/kijai/ComfyUI-KJNodes /comfyui/custom_nodes/ComfyUI-KJNodes && cd /comfyui/custom_nodes/ComfyUI-KJNodes && (git checkout 6dfd2c2420260dbb321a3412b9f1dff439a0f2e3 2>/dev/null || (git fetch origin 6dfd2c2420260dbb321a3412b9f1dff439a0f2e3 --depth=1 && git checkout 6dfd2c2420260dbb321a3412b9f1dff439a0f2e3) || echo "WARN: commit unreachable, falling back to default branch HEAD")
RUN git clone https://github.com/kijai/ComfyUI-MelBandRoFormer /comfyui/custom_nodes/ComfyUI-MelBandRoFormer && cd /comfyui/custom_nodes/ComfyUI-MelBandRoFormer && (git checkout b68d9077815387b64d596f8c39607052b95b6eba 2>/dev/null || (git fetch origin b68d9077815387b64d596f8c39607052b95b6eba --depth=1 && git checkout b68d9077815387b64d596f8c39607052b95b6eba) || echo "WARN: commit unreachable, falling back to default branch HEAD")
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && cd /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && (git checkout 0a75c7958fe320efcb052f1d9f8451fd20c730a8 2>/dev/null || (git fetch origin 0a75c7958fe320efcb052f1d9f8451fd20c730a8 --depth=1 && git checkout 0a75c7958fe320efcb052f1d9f8451fd20c730a8) || echo "WARN: commit unreachable, falling back to default branch HEAD")

# models come from the attached Network Volume at /runpod-volume/models/...
# instead of being baked into the image.

RUN wget --progress=dot:giga -O '/comfyui/input/freepik__use-img1-as-the-base-replace-the-scene-with-a-brig__34280.jpeg' "https://cool-anteater-319.convex.cloud/api/storage/7e3c8b64-81c5-4fa3-9fb2-7e8e608e2a2d"
