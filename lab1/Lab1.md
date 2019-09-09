# Lab1

```
Author : 
    Jyun-Liang, Chen
    Pin-Lun, Lin
```
## 1. Outline
- [LAB1](#lab1)
  - [1. Outline](#1-outline)
  - [2. Vivado](#2-vivado)
      - [2.1 Requirement](#21-requirement)
      - [2.2 Create Vivado Project](#22-create-vivado-project)
      - [2.3 Vivado SDK](#23-vivado-sdk)
  - [3. Petalinux](#3-petalinux)
      - [3.1 Requirement](#31-requirement)
      - [3.2 Petalinux Command](#32-petalinux-command)
      - [3.3 Create Project](#33-create-project)
  - [4. ArchLinux](#4-archlinux)
      - [4.1 Requirement](#41-requirement)
      - [4.2 Prepare SD Card](#42-prepare-sd-card)
      - [4.3 Prepare Boot ArchLinux](#43-prepare-boot-archlinux)
      - [4.4 Print Hello World](#44-print-hello-world)
## 2. Vivado

### 2.1 Requirement

- Install vivado.
- Create a vivado project.
- Create block design.
- Import ZYNQ.
- Generate Bitstream.

In this tutorial, I use：

- Xilinx Vivado 2018.3
- Ubuntu 18.04
- Zedboard
  
### 2.2 Create Vivado Project
#### New a project
>>File &rarr; Project &rarr; New...

![1](./images/create_vivado/1.png)

#### Click Next

![2](./images/create_vivado/2.png)

#### Input Your Project Name and Location

![3](./images/create_vivado/3.png)

#### Check Option

![4](./images/create_vivado/4.png)

#### Choose ZedBoard Zynq

![5](./images/create_vivado/5.png)

#### Click Finish

![6](./images/create_vivado/6.png)

#### Click Create Block Design

![7](./images/create_vivado/7.png)

#### Input Block Design before Click OK

![8](./images/create_vivado/8.png)

#### Click ![9](./images/create_vivado/9.png) and Double Click ZYNQ7 Processing System

![10](./images/create_vivado/10.png)

#### Click ![11](./images/create_vivado/11.png)

![12](./images/create_vivado/12.png)
![13](./images/create_vivado/13.png)

#### Connect *FCLK_CLK_0* to *M_AXI_GP0_ACLK*

![14](./images/create_vivado/14.png)

#### 接著按Validate Design確認沒有Error或Critical Warning並盡量將Warning修正掉

![Validate_Design](./images/create_vivado/Validate_Design.PNG)

#### Block Diagrame驗證完成後，需要建立由RTL編寫的Top Module

>右鍵Block Diagrame的.db檔 &rarr; Create HDL Wrapper... &rarr; Let Vivado manage wrapper and auto-update &rarr; OK

![Create_HDL_Wrapper_0](./images/create_vivado/Create_HDL_Wrapper_0.PNG)
![Create_HDL_Wrapper_1](./images/create_vivado/Create_HDL_Wrapper_1.PNG)

#### 最後按Generate Bitstream做Synthesis and Implementation

![Generate_Bitstream](./images/create_vivado/Generate_Bitstream.PNG)

#### _合成完成後確認沒有Error，Critical Warning和Warning需檢查是否會影響電路功能_

#### 確認 **Generate Bitstream** 完成

![Generate_Bitstream_Finish](./images/create_vivado/Generate_Bitstream_Finish.PNG)

### 2.3 Vivado SDK

#### 之後將 **Bitstream** 匯入至 **SDK**

> File &rarr; Export &rarr; Export Hardware...

![Export_to_SDK](./images/create_vivado/Export_to_SDK.PNG)

![Export_to_SDK_2](./images/create_vivado/Export_to_SDK_2.PNG)

#### 開啟**SDK**

> File &rarr; Launch SDK

![Launch_SDK](./images/create_vivado/Launch_SDK.PNG)

#### SDK

![SDK](./images/create_vivado/SDK.PNG)

#### 建立專案

> File &rarr; New &rarr; Application Project

![SDK_Create_Project](./images/create_vivado/SDK_Create_Project.PNG)

#### 設定Project Name

![SDK_Create_Project_2](./images/create_vivado/SDK_Create_Project_2.PNG)

#### 選擇空專案的模版

![SDK_Create_Project_3](./images/create_vivado/SDK_Create_Project_3.PNG)

#### 將2條 _Micro-USB to USB_ 的線分別插入 _USB Uart_ 以及 _USB JTAG_

![zedboard](./images/create_vivado/zed_board.jpg)

#### 將 **Bitstream** 檔燒入至 **Zedboard**

> Xilinx &rarr; Program FPGA

##### or

> Click Toolbar
> ![Program_ZYNQ_icon](./images/create_vivado/Program_ZYNQ_icon.PNG)

![Program_ZYNQ_2](./images/create_vivado/Program_ZYNQ_2.PNG)

#### 之後會跳出一個視窗，確認*Bitstream*無誤之後就可以按下*Program*

![Program_ZYNQ](./images/create_vivado/Program_ZYNQ.PNG)

#### 按下*Program*之後，會跳出一個視窗等到他跑完為止。

![Program_ZYNQ_3](./images/create_vivado/Program_ZYNQ_3.PNG)

#### 燒入成功之後，*Zedboard*會亮藍燈。

![Program_ZYNQ_4](./images/create_vivado/Program_ZYNQ_4.JPG)

#### 開啟*SDK Terminal*

![SDK_Terminal](./images/create_vivado/SDK_Terminal.PNG)

##### 若找不到可以從這邊開啟

> Window &rarr; Show View  &rarr; Other...

![SDK_Terminal_2](./images/create_vivado/SDK_Terminal_2.PNG)

#### 輸入*SDK Terminal*

![SDK_Terminal_3](./images/create_vivado/SDK_Terminal_3.PNG)

#### Setting Port and Baud Rate

![SDK_Terminal_5](./images/create_vivado/SDK_Terminal_5.PNG)

#### 在 _Windows_ 環境中，需要從 _裝置管理員_ 查看 _USB Serial Port_ 為多少。
##### 以圖片為例， _Port_ 需要設為 _COM4_ 。

![SDK_Terminal_4](./images/create_vivado/SDK_Terminal_4.PNG)

#### 設定完之後，運行Hello World程式碼。
>Right Click Project
>
>Run as &rarr; Launch on Hardware (System Debugger)
>
>or
>
>Click Toolbar 
![Print_Hello_World_icon](./images/create_vivado/Print_Hello_World_icon.PNG)

![Print_Hello_World](./images/create_vivado/Print_Hello_World.PNG)

#### 觀察*SDK Terminal*是否有印出Hello World。

![Print_Hello_World_2](./images/create_vivado/Print_Hello_World_3.PNG)

## 3. Petalinux

### 3.1 Requirement

- SSH to Server.
- Create a Petalinux project.
- HDF File(Vivado generate).

In this tutorial, I use：

- Xilinx Vivado 2018.3
- Xilinx Petalinux 2018.3
- Ubuntu 18.04

### 3.2 Petalinux Command

```sh
source <PATH_to_PETALINUX>/settings.sh
```
#### Note : 查看各指令的說明

``` sh
petalinux-XXX -h
```


### 3.3 Create Project

#### Create Petalinux Project

>> petalinux-create -t project -s avnet-digilent-zedboard-v2018.3-final
>> cd <Path_to_Petalinux_Project> 

#### Setting Petalinux Project
>> petalinux-config --get-hw-description=<存放HDF檔的路徑>

#### Setting Bootloader。
>> Image Packaging Configuration  &rarr; Root filesystem type 
>> Choose SD Card

![Setting_BootArg_1](./images/petalinux/Setting_BootArg_1.png)

![Setting_BootArg_3](./images/petalinux/Setting_BootArg_3.png)

![Setting_BootArg_4](./images/petalinux/Setting_BootArg_4.png)

>> DTG Settings &rarr; Kernel Bootargs

![Setting_BootArg_5](./images/petalinux/Setting_BootArg_5.png)

![Setting_BootArg_6](./images/petalinux/Setting_BootArg_6.png)

#### Check Option

![Setting_BootArg_7](./images/petalinux/Setting_BootArg_7.png)

#### Edit Argument

>> earlycon clk_ignore_unused earlyprintk root=/dev/mmcblk0p2 rw rootwait cma=512M

![Setting_BootArg_8](./images/petalinux/Setting_BootArg_8.png)

#### Save and Exit

![Setting_BootArg_9](./images/petalinux/Setting_BootArg_9.png)

#### Build
>> petalinux-build

#### Package
>> petalinux-package --boot --fpga images/linux/system.bit --fsbl images/linux/zynq_fsbl.elf --u-boot images/linux/u-boot.elf --force

#### Check File
##### BOOT.BIN & image.ub
>> ls image/linux/

![check_file](./images/petalinux/check_file.png)

## 4. ArchLinux

### 4.1 Requirement

- Ubuntu 18.04.
- Archlinux Arm-32bit.

### 4.2 Prepare SD Card

#### Check SD Card

##### 插入 SD Card 前
>> ls /dev/sd*

![make_sdcard_1](./images/make_sdcard/make_sdcard_1.png)

##### 插入 SD Card 後
>> ls /dev/sd*

![make_sdcard_2](./images/make_sdcard/make_sdcard_2.png)

##### Check Infomation
>> fdisk /dev/sdc

![make_sdcard_3](./images/make_sdcard/make_sdcard_3.png)

##### Get "/dev/sdc" Information
>> Input p

![make_sdcard_4](./images/make_sdcard/make_sdcard_4.png)

![make_sdcard_5](./images/make_sdcard/make_sdcard_5.png)

#### 清空 SD Card
>> Input d

![make_sdcard_6](./images/make_sdcard/make_sdcard_6.png)

#### 獨立切割100MB
>> Input n &rarr; Input 1 &rarr; Input 2048 &rarr; Input +100M &rarr; Y

![make_sdcard_7](./images/make_sdcard/make_sdcard_7.png)

#### 設定剩餘空間
>> Input n &rarr; Input 2 &rarr; Input Enter &rarr; Input Enter &rarr; Y

![make_sdcard_8](./images/make_sdcard/make_sdcard_8.png)

#### Change 100MB EXT4 to 100MB FAT32
##### Print Filesystem List
>> Input t &rarr; Input 1 &rarr; L

![make_sdcard_12](./images/make_sdcard/make_sdcard_12.png)
![make_sdcard_9](./images/make_sdcard/make_sdcard_9.png)

##### Choose FAT32 and Save
>> Input b &rarr; Input w

![make_sdcard_9](./images/make_sdcard/make_sdcard_11.png)

#### Setting SD Card Filesystem
>> sudo mkfs.fat /dev/sdc1
>> sudo mkfs.ext4 /dev/sdc2

### 4.3 Prepare Boot ArchLinux

#### Download ArchLinux
[Archlinux_Offical_ARM](https://archlinuxarm.org/about/downloads)

#### Copy ArchLinuxARM-zedboard to SD Card EXT4
>> mkdir ext4
>> sudo mount /dev/sdc2 ext4
>> sudo bsdtar -xpf /path/to/ArchLinuxARM-zedboard -C ext4
>> cd ext4
>> sync
>> sudo umount ext4

![make_sdcard_16](./images/make_sdcard/make_sdcard_16.png)

#### Copy BOOT.BIN and image.ub to SD Card FAT32
>> mkdir fat
>> sudo mount /dev/sdc1 fat
>> cp {path-to-petalinux_project}/images/linux/BOOT.BIN
>> cp {path-to-petalinux_project}/images/linux/image.ub
>> cd fat
>> sync
>> sudo umount fat

#### 將FPGA設定為SD Card開機模式，插入SD Card、Uart以及網路線並且開機。

![make_sdcard_16](./images/zedboard_SDCARD.jpg)

### 4.4 Print Hello World

#### Use Putty
- [請參考SDK Terminal](#setting-port-and-baud-rate)

#### Setting Network (Static)
>> ip addr add 140.117.176.70/24 dev eth0
>> ip route add default via 140.117.176.254
#### Setting Network (Dynamic)
>> dhcp
#### Using Pacman
>> pacman-key --init
>> pacman-key --populate archlinuxarm
>> pacman -Syy
>> pacman -Su
>> pacman  -S vim base-devel
#### Test : Print Hello World(Using C++)
