# contracts.staking



## 介绍

基于etherum智能合约，由solidity语言编写，实现了s-eth、s-btc、s-elf代币的挂单、成单、撤单等功能。





##主要功能

#### 1.orderCreate

挂单方法，需传入_creater（挂单者地址），_value（挂单金额），_message（挂单附加信息）。

#### 2.orderCancel

撤单方法，需传入_message（撤单附加信息）。

#### 3.orderExecute

成单方法，需传入_receiver（接收者地址），_value（成单金额），_tokenAddress（代币合约地址），_message（成单附加信息）。





## 部署方式

使用etherum的solidity官方IDE：http://remix.ethereum.org/

