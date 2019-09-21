#Lab2

```
Author : 
    Jyun-Liang, Chen
    Pin-Lun, Lin
```

## 1. Outline
- [1. Outline](#1-outline)
- [2. Package Adder Wrapper](#2-package-adder-wrapper)
  - [2.1 Requirement](#21-requirement)
  - [2.2 Create New IP](#22-create-new-ip)
    - [2.2.1 Open Lab1 Project](#221-open-lab1-project)
    - [2.2.2 Create and Package New IP](#222-create-and-package-new-ip)
    - [2.2.3 Next](#223-next)
    - [2.2.4 Choose Create a newe AXI4 peripheral](#224-choose-create-a-newe-axi4-peripheral)
    - [2.2.5 Name Your IP](#225-name-your-ip)
    - [2.2.6 Input Number of Registers (Not 4)](#226-input-number-of-registers-not-4)
    - [2.2.7 Choose Edit IP](#227-choose-edit-ip)
  - [2.3 Package IP](#23-package-ip)
    - [2.3.1 Right-Click Design Sources and Click Add Sources](#231-right-click-design-sources-and-click-add-sources)
    - [2.3.2 Click Adder\_v1\_0\_S00\_AXI\.v](#232-click-adderv10s00axiv)
    - [2.3.3 Edit Adder\_v1\_0\_S00\_AXI\.v](#233-edit-adderv10s00axiv)
    - [2.3.4 Edit Adder\_v1\_0\.v](#234-edit-adderv10v)
    - [2.3.5 Click Merge changes from File Groups Wizard](#235-click-merge-changes-from-file-groups-wizard)
    - [2.3.6 Click Merge changes from Customization Parameters Wizard](#236-click-merge-changes-from-customization-parameters-wizard)
    - [2.3.7 Check and Click Re-Package IP](#237-check-and-click-re-package-ip)
    - [2.3.8 Click Settings](#238-click-settings)
    - [2.3.9 Check Custom IP](#239-check-custom-ip)
    - [2.3.10 Add Custom IP and Click Run Connection Automation](#2310-add-custom-ip-and-click-run-connection-automation)
    - [2.3.11 Click OK](#2311-click-ok)
    - [2.3.12 Finish](#2312-finish)
    - [2.3.13 Generate Bitstream and Launch SDK](#2313-generate-bitstream-and-launch-sdk)
- [3. Standalone Development](#3-standalone-development)
  - [3.1 Requirement](#31-requirement)
  - [3.2 Vivado SDK](#32-vivado-sdk)
    - [3.2.1 Launch SDK](#321-launch-sdk)
    - [3.2.2 Create Project](#322-create-project)
- [4. ILA and SDK Debug](#4-ila-and-sdk-debug)
  - [4.1 Requirement](#41-requirement)
  - [4.2 Use Vivado](#42-use-vivado)
  - [4.3 Vivado SDK](#43-vivado-sdk)

## 2. Package Adder Wrapper
### 2.1 Requirement

- Finish Lab1.

In this tutorial, I use :

- Xilinx Vivado 2018.3

### 2.2 Create New IP

#### 2.2.1 Open Lab1 Project

#### 2.2.2 Create and Package New IP

> Tools &rarr; Create and Package New IP ...

![New_IP](./images/Package_Wrapper/NEW_IP.PNG)

#### 2.2.3 Next

![New_IP_2](./images/Package_Wrapper/NEW_IP_2.PNG)

#### 2.2.4 Choose Create a newe AXI4 peripheral

![New_IP_3](./images/Package_Wrapper/NEW_IP_3.PNG)

#### 2.2.5 Name Your IP

![New_IP_4](./images/Package_Wrapper/NEW_IP_4.PNG)

#### 2.2.6 Input Number of Registers (Not 4)

![New_IP_5](./images/Package_Wrapper/NEW_IP_5.PNG)

#### 2.2.7 Choose Edit IP

![New_IP_6](./images/Package_Wrapper/NEW_IP_6.PNG)


### 2.3 Package IP

#### 2.3.1 Right-Click Design Sources and Click Add Sources
![Edit_IP_2](./images/Package_Wrapper/EDIT_IP_2.PNG)

#### 2.3.2 Click Adder\_v1\_0\_S00\_AXI\.v

![Edit_IP](./images/Package_Wrapper/EDIT_IP.PNG)

#### 2.3.3 Edit Adder\_v1\_0\_S00\_AXI\.v

```verilog
7   parameter ADDRESS_SIZE = 10,
8   parameter WORD_SIZE = 32,
9   parameter WORD_NUMBER = 1024,
```

![Edit_IP_3](./images/Package_Wrapper/EDIT_IP_3.PNG)

```verilog
126 wire finish;
127 wire busy;
128 wire [WORD_SIZE-1 : 0] OUT_DATA;
```

![Edit_IP_4](./images/Package_Wrapper/EDIT_IP_4.PNG)

```verilog
Adder #(.ADDRESS_SIZE(ADDRESS_SIZE), .WORD_SIZE(WORD_SIZE), .WORD_NUMBER(WORD_NUMBER)) M0 (
    .IN_DATA(slv_reg0),
    .OUT_DATA(OUT_DATA),
    .IN_ADDR(slv_reg1[ADDRESS_SIZE-1 : 0]),
    .OUT_ADDR(slv_reg2[ADDRESS_SIZE-1 : 0]),
    .IN_WEN(slv_reg3[0]),
    .OUT_CEN(slv_reg4[0]),
    .RAM_SEL(slv_reg5[0]),
    .start(slv_reg6[0]),
    .finish(finish),
    .busy(busy),
    .CLK(S_AXI_ACLK),
    .RST_N(S_AXI_ARESETN&&slv_reg7[0])
);
```

![Edit_IP_5](./images/Package_Wrapper/EDIT_IP_5.PNG)

![Edit_IP_6](./images/Package_Wrapper/EDIT_IP_6.PNG)

#### 2.3.4 Edit Adder\_v1\_0\.v

```verilog
7   parameter ADDRESS_SIZE = 10,
8   parameter WORD_SIZE = 32,
9   parameter WORD_NUMBER = 1024,
```

![Edit_IP_7](./images/Package_Wrapper/EDIT_IP_7.PNG)

```verilog
51  .ADDRESS_SIZE(ADDRESS_SIZE), 
52  .WORD_SIZE(WORD_SIZE), 
53  .WORD_NUMBER(WORD_NUMBER),
```

![Edit_IP_8](./images/Package_Wrapper/EDIT_IP_8.PNG)

#### 2.3.5 Click Merge changes from File Groups Wizard

![Package_IP_1](./images/Package_Wrapper/Package_IP_1.PNG)

#### 2.3.6 Click Merge changes from Customization Parameters Wizard

![Package_IP_2](./images/Package_Wrapper/Package_IP_2.PNG)

#### 2.3.7 Check and Click Re-Package IP

![Package_IP_3](./images/Package_Wrapper/Package_IP_3.PNG)

#### 2.3.8 Click Settings

![ADDER_IP_1](./images/Package_Wrapper/ADDER_IP_1.PNG)

#### 2.3.9 Check Custom IP 

![ADDER_IP_2](./images/Package_Wrapper/ADDER_IP_2.PNG)

#### 2.3.10 Add Custom IP and Click Run Connection Automation

![ADDER_IP_3](./images/Package_Wrapper/ADDER_IP_3.PNG)

#### 2.3.11 Click OK

![ADDER_IP_4](./images/Package_Wrapper/ADDER_IP_4.PNG)

#### 2.3.12 Finish

![ADDER_IP_5](./images/Package_Wrapper/ADDER_IP_5.PNG)

#### 2.3.13 Generate Bitstream and Launch SDK

[Lab1](../lab1/Lab1.md)

## 3. Standalone Development
### 3.1 Requirement

- Finish [2.1 Package Adder Wrapper](#2-package-adder-wrapper).
- Generate Bitsream.

In this tutorial, I use :

- Xilinx Vivado SDK 2018.3
- Zedboard
- 2 x Micro USB

### 3.2 Vivado SDK

#### 3.2.1 Launch SDK

[Lab1](../lab1/Lab1.md)

#### 3.2.2 Create Project
```markdown
File &rarr; 
```

## 4. ILA and SDK Debug
### 4.1 Requirement
### 4.2 Use Vivado
### 4.3 Vivado SDK