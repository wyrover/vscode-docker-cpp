1. vscode 安装 Docker 插件

2. 创建一个简单的 cpp 文件

```cpp
#include <iostream>

int main(int argc, char const *argv[])
{
    std::cout << "Hello Docker container!" << std::endl;
    return 0;
}
```


3. 创建一个 Dockerfile

Ctrl + Shift + P

Docker: Add Docker files to Workspace
Other


4. 修改 Dockerfile


```
# Get the base Ubuntu image from Docker Hub
FROM ubuntu:latest
 
# Update apps on the base image
RUN apt-get -y update && apt-get install -y
 
# Install the Clang compiler
RUN apt-get -y install clang
 
# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/dockertest1
 
# Specify the working directory
WORKDIR /usr/src/dockertest1
 
# Use Clang to compile the Test.cpp source file
RUN clang++ -o Test Test.cpp
 
# Run the output program from the previous step
CMD ["./Test"]
```

或者使用 gcc


```
# Get the GCC preinstalled image from Docker Hub
FROM gcc:4.9
 
# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/dockertest1
 
# Specify the working directory
WORKDIR /usr/src/dockertest1
 
# Use GCC to compile the Test.cpp source file
RUN g++ -o Test Test.cpp
 
# Run the program output from the previous step
CMD ["./Test"]
```

5. 构建 docker 镜像

Ctrl + Shift + P

Docker:Build Image


6. 构建完成，选择左侧 vscode 的 Docker 标签

选中镜像 vscode-docker-cpp latest 右键 `Run Interactive` ，会构建输出



其他

1. 需要在 win10 安装 Docker for Windows Installer.exe\
2. 需要 vpn 更新 docker image


https://devblogs.microsoft.com/cppblog/c-development-with-docker-containers-in-visual-studio-code/