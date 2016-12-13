# 服务定义



## 1. 主服务和框架

### 1. 主服务
- 名称：公共治安综合平台
- 代号：picasso
- 简介：基础功能（用户、权限体系）和核心功能（场所备案、从业人员备案），从业人员子平台 Web API 和 行政管理子平台 Web API。
- 文档仓库：picasso-design
- 代码仓库：picasso-source
- 部署仓库：picasso-deploy

### 2. 微服务伴侣
- 名称：微服务伴侣
- 代号：pavilion
- 简介：各个业务子系统可复用逻辑的代码库，以 Rails Engine 的形式发布成 Ruby Gem。
- 文档仓库：pavilion-design
- 代码仓库：pavilion-source
- 部署仓库：pavilion-deploy



## 2. 微服务

### 1. 昆山无证入住系统
- 名称：昆山无证入住系统
- 代号：walrus
- 简介：从业人员子平台提交身份信息 Web UI 和 Web API，行政管理子平台审核身份信息的 Web UI。
- 文档仓库：walrus-design
- 代码仓库：walrus-source
- 部署仓库：walrus-deploy
- 行业代码：LODG

### 2. 住宿
- 名称：住宿（连云港）
- 代号：sumava
- 简介：从业人员子平台提交住宿备案信息 Web API，行政管理子平台查询住宿备案信息的 Web UI。
- 文档仓库：sumava-design
- 代码仓库：sumava-source
- 部署仓库：sumava-deploy
- 行业代码：

### 3. 民宿
- 名称：民宿
- 代号：saltee
- 简介：从业人员子平台提交入住信息 Web API，行政管理子平台查询身份信息的 Web UI。
- 文档仓库：saltee-design
- 代码仓库：saltee-source
- 部署仓库：saltee-deploy
- 行业代码：HMST

### 4. 娱乐场所
- 名称：娱乐场所
- 代号：shasta
- 简介：从业人员子平台提交考勤 Web API，行政管理子平台审核身份信息的 Web UI。
- 文档仓库：shasta-design
- 代码仓库：shasta-source
- 部署仓库：shasta-deploy
- 行业代码：ENTR

### 5. 开锁
- 名称：开锁
- 代号：ladakh
- 简介：从业人员子平台提交开锁备案信息 Web API，行政管理子平台查询开锁备案信息的 Web UI。
- 文档仓库：ladakh-design
- 代码仓库：ladakh-source
- 部署仓库：ladakh-deploy
- 行业代码：LOCK

### 6. 快递
- 名称：快递
- 代号：cirrus
- 简介：从业人员子平台提交揽件信息 Web API，行政管理子平台查询身份信息的 Web UI。
- 文档仓库：cirrus-design
- 代码仓库：cirrus-source
- 部署仓库：cirrus-deploy
- 行业代码：EXPR

### 7. 废品回收
- 名称：废品回收
- 代号：rakotz
- 简介：从业人员子平台提交废品回收信息 Web API，行政管理子平台查询废品回收信息的 Web UI。
- 文档仓库：rakotz-design
- 代码仓库：rakotz-source
- 部署仓库：rakotz-deploy
- 行业代码：RCCL

### 8. 印刷
- 名称：印刷
- 代号：penang
- 简介：从业人员子平台提交维修备案信息 Web API，行政管理子平台查询维修备案信息的 Web UI。
- 文档仓库：penang-design
- 代码仓库：penang-source
- 部署仓库：penang-deploy
- 行业代码：PRNT

### 9. 刻章

### 10. 暂缺

### 11. 寄卖
- 名称：寄卖
- 代号：mosier
- 简介：从业人员子平台提交住宿备案信息 Web API，行政管理子平台查询住宿备案信息的 Web UI。
- 文档仓库：mosier-design
- 代码仓库：mosier-source
- 部署仓库：mosier-deploy
- 行业代码：CSGN

### 12. 典当
- 名称：典当
- 代号：moscow
- 简介：从业人员子平台提交住宿备案信息 Web API，行政管理子平台查询住宿备案信息的 Web UI。
- 文档仓库：moscow-design
- 代码仓库：moscow-source
- 部署仓库：moscow-deploy
- 行业代码：PBRK

### 13. 金银加工置换
- 名称：金银加工置换
- 代号：munich
- 简介：从业人员子平台提交维修备案信息 Web API，行政管理子平台查询维修备案信息的 Web UI。
- 文档仓库：munich-design
- 代码仓库：munich-source
- 部署仓库：munich-deploy
- 行业代码：GSPR

### 14. 二手交易
- 名称：二手交易
- 代号：museum
- 简介：从业人员子平台提交维修备案信息 Web API，行政管理子平台查询维修备案信息的 Web UI。
- 文档仓库：museum-design
- 代码仓库：museum-source
- 部署仓库：museum-deploy
- 行业代码：SCDT

### 15. 暂缺

### 16. 机动车维修
- 名称：机动车维修
- 代号：albert
- 简介：从业人员子平台提交维修备案信息 Web API，行政管理子平台查询维修备案信息的 Web UI。
- 文档仓库：albert-design
- 代码仓库：albert-source
- 部署仓库：albert-deploy
- 行业代码：MVMT

### 17. 机动车拆解
- 名称：机动车拆解
- 代号：andres
- 简介：从业人员子平台提交维修备案信息 Web API，行政管理子平台查询维修备案信息的 Web UI。
- 文档仓库：andres-design
- 代码仓库：andres-source
- 部署仓库：andres-deploy
- 行业代码：SMVR

### 18. 二手机动车交易
- 行业代码：OMVT

### 19. 机动车租赁
- 名称：机动车租赁
- 代号：autumn
- 简介：从业人员子平台提交维修备案信息 Web API，行政管理子平台查询维修备案信息的 Web UI。
- 文档仓库：autumn-design
- 代码仓库：autumn-source
- 部署仓库：autumn-deploy
- 行业代码：CRNT

### 20. 民用爆破工程
- 名称：民用爆破工程
- 代号：basalt
- 简介：从业人员子平台提交爆破作业信息 Web API，行政管理子平台查询爆破作业信息的 Web UI。
- 文档仓库：basalt-design
- 代码仓库：basalt-source
- 部署仓库：basalt-deploy
- 行业代码：BLST



## 3. 微能力

### 1. 位置跟踪微能力
- 名称：位置跟踪微能力
- 代号：roraima
- 简介：Practition API v1
- 文档仓库：roraima-design
- 代码仓库：roraima-source
- 部署仓库：roraima-deploy

### 2. 协查通报微能力
- 名称：协查通报微能力
- 代号：frisian
- 简介：Governance API v1, Practition API v1
- 文档仓库：frisian-design
- 代码仓库：frisian-source
- 部署仓库：frisian-deploy

### 3. 身份通微能力
- 名称：身份通微能力
- 代号：kastrup
- 简介：Governance API v1, Practition API v1
- 文档仓库：kastrup-design
- 代码仓库：kastrup-source
- 部署仓库：kastrup-deploy

### 4. 实名通微能力
- 名称：实名通微能力
- 代号：kericho
- 简介：Governance API v1, Practition API v1
- 文档仓库：kericho-design
- 代码仓库：kericho-source
- 部署仓库：kericho-deploy

### 5. QCloud IM 微能力
- 名称：QCloud IM 微能力
- 代号：meteora
- 简介：Governance API v1, Practition API v1
- 文档仓库：meteora-design
- 代码仓库：meteora-source
- 部署仓库：meteora-deploy
