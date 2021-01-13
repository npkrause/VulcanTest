VULKAN_SDK_PATH = /home/npkrause/VulcanSDK/1.2.141.0/x86_64
STB_INCLUDE_PATH = /home/npkrause/libraries/stb

CFLAGS = -std=c++17 -I$(VULKAN_SDK_PATH)/include -I$(STB_INCLUDE_PATH)
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan
debug: CCFLAGS += -DNDEBUG -g
debug: VulkanTest

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/vulkan/explicit_layer.d ./VulkanTest

clean:
	rm -f VulkanTest
