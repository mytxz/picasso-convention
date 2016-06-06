# 公共治安综合平台设计规范

本文档适合《公共治安综合平台》项目团队的开发人员阅读。



## 1. 主服务、微服务和微能力

主系统和各个业务子系统均采用微服务的架构。
- __主服务__：主服务负责处理用户体系、权限管理、备案等基础和核心的业务流程。
- __微服务__：主服务之外的各个业务子系统都是微服务。
- __微能力__：在整体架构中，从主系统中拆分出来了部分功能。这些功能和具体的业务功能无关，例如位置跟踪。这些独立的功能称为微能力。



## 2. 子平台

综合平台分为3个子平台：
- __系统管理平台 Administration__： 系统管理员、运营人员、客户服务人员、数据维护人员使用的平台。
- __行政管理平台 Governance__：     行政机构的管理人员、执法人员使用的平台。
- __从业人员平台 Practition__：     特殊行业、特殊场所的从业人员使用的平台。
无论是主服务、微服务还是微能力，都分为以上3个平台。



## 3. 环境变量

在系统中，如果需要配置环境变量，则应遵循以下的规则：
- 所有单词大写
- 单词之间用下划线连接
- 本系统的代号放在第一位



## 3. 用户界面 UI

### 1. 路由 Route
3个子平台的用户界面，遵循以下的路由设置 (config/routes.rb)：

```ruby
namespace :administration do
  resources :dashboards, only: :show
end

namespace :governance do
  resources :dashboards, only: :show
end

namespace :practition do
  resources :dashboards, only: :show
end
```

### 2. 控制器 Controller
3个子平台的控制器，必须按照以下的方式实现：

1. PriviledgeProtection Concern  
__授权保护的关注模块__ (app/controllers/concerns/priviledge_protection.rb) 负责实现控制器层的会话安全控制。

2. 系统管理平台控制器  
__系统管理平台特权控制器__是 app/controllers/administration/ 下的所有控制器——会话相关的控制器除外——的基类。
(app/controllers/administration/privileged_controller.rb)

```ruby
class Administration::PrivilegedController < ::ApplicationController

  layout 'administration'

  include PriviledgeProtection

  helper :administration

end
```

__系统管理平台控制板控制器__是整个子平台的入口。如果不需要控制板，则直接在 #show 方法中重定向到对应的页面。
(app/controllers/administration/dashboards_controller.rb)

```ruby
class Administration::DashboardsController < Administration::PrivilegedController

  def show
    redirect_to administration_profiles_path(Unidom::Common::SELF)
  end

end
```

3. 行政管理平台控制器  
__行政管理平台特权控制器__是 app/controllers/governance/ 下的所有控制器——会话相关的控制器除外——的基类。
(app/controllers/governance/privileged_controller.rb)

```ruby
class Governance::PrivilegedController < ::ApplicationController

  layout 'governance'

  include PriviledgeProtection

  helper :governance

end
```

__行政管理平台控制板控制器__是整个子平台的入口。如果不需要控制板，则直接在 #show 方法中重定向到对应的页面。
(app/controllers/governance/dashboards_controller.rb)

```ruby
class Governance::DashboardsController < Governance::PrivilegedController

  def show
    redirect_to governance_profiles_path(Unidom::Common::SELF)
  end

end
```

4. 从业人员平台控制器  
__从业人员平台特权控制器__是 app/controllers/practition/ 下的所有控制器——会话相关的控制器除外——的基类。
(app/controllers/practition/privileged_controller.rb)

```ruby
class Practition::PrivilegedController < ::ApplicationController

  layout 'practition'

  include PriviledgeProtection

  helper :practition

end
```

__从业人员平台控制板控制器__是整个子平台的入口。如果不需要控制板，则直接在 #show 方法中重定向到对应的页面。
(app/controllers/practition/dashboards_controller.rb)

```ruby
class Practition::DashboardsController < Practition::PrivilegedController

  def show
    redirect_to practition_profiles_path(Unidom::Common::SELF)
  end

end
```

### 3. 视图 View
3个子平台的视图，必须按照以下的方式实现：

1. 布局 Layout

每个子平台都必须有自己的独立的布局文件。3个子平台的布局文件分别为：
- app/views/layouts/administration.html.erb
- app/views/layouts/governance.html.erb
- app/views/layouts/practition.html.erb


2. 共享视图片段 Shared

每个子平台都必须建立自己的独立的 shared 目录：
- app/views/administration/shared/
- app/views/governance/shared/
- app/views/practition/shared/

除此之外，还可以维护一个公共的 shared 目录： app/views/shared/

在以上的几个 shared 目录中，应维护多个代码片段。如：
- _banner.html.erb
- _navigation_bar.html.erb
- _script.html.erb
- _side_menu.html.erb
- _style.html.erb

### 4. 视图帮助模块 Helper

每个子平台都必须建立自己的独立的 helper 模块：
- app/helpers/administration_helper.rb
- app/helpers/governance_helper.rb
- app/helpers/practition_helper.rb

### 5. 图片 Image

每个子平台都必须建立自己的独立的图片目录：
- app/assets/images/administration/
- app/assets/images/governance/
- app/assets/images/practition/

除此之外，还可以维护一个公共的 shared 目录： app/assets/images/shared/

### 6. 样式 CSS

每个子平台都必须建立自己的独立的 CSS 目录：
- app/assets/stylesheets/administration/
- app/assets/stylesheets/governance/
- app/assets/stylesheets/practition/

TODO: 进一步定义清单文件和库文件的规范。

### 7. 脚本 JavaScript

每个子平台都必须建立自己的独立的 JavaScript 目录：
- app/assets/javascripts/administration/
- app/assets/javascripts/governance/
- app/assets/javascripts/practition/

TODO: 进一步定义清单文件和库文件的规范。

### 8. 超链接相关的环境变量

如果在系统中，需要通过环境变量配置指向其他系统的超链接，除了遵循[通用的环境变量命名规则](#3-环境变量)外，还需要遵循以下的规则：
- 目标系统的代号放在第二位
- 目标系统的子平台代号放在第三位
- 目标系统的资源名称放在第四位
- 单词 LINK 放在第五位

如： PICASSO_RORAIMA_ADMINISTRATION_DASHBOARD_LINK
- Picasso 是本系统的代号
- Roraima 是目标系统的代号
- Administration 是目标系统的子平台代号，还可以有 Governance、Practition 等子平台
- Dashboard 是目标系统的资源名称
- 最后是 Link

### 9. 分页相关的环境变量

如果在系统中，需要配置分页相关的环境变量，除了遵循[通用的环境变量命名规则](#3-环境变量)外，还需要遵循以下的规则：
- 子平台代号放在第二位
- 资源名称放在第三位
- 单词 PER_PAGE 放在第四位

如：PICASSO_GOVERNANCE_PLACE_FILING_PER_PAGE
- Picasso 是系统的代号
- Governance 是子平台代号，还可以有 Administration、Practition 等子平台
- Place Filing 是资源名称
- 最后是 Per Page

除了基于具体资源的分页环境变量外，还有一个用于本系统所有 Web UI 的分页环境变量： PICASSO_PER_PAGE，缺省值应该为 10。



## 4. Web API

### 1. 路由 Route
3个子平台的用户界面，遵循以下的路由设置 (config/routes.rb)：

```ruby
scope '/administration-api/v1', module: 'administration/dosser/v1', as: 'administration_dosser_v1' do
  resources :portals, only: :show
end

scope '/governance-api/v1', module: 'governance/dosser/v1', as: 'governance_dosser_v1' do
  resources :portals, only: :show
end

scope '/practition-api/v1', module: 'practition/dosser/v1', as: 'practition_dosser_v1' do
  resources :portals, only: :show
end
```

### 2. 控制器 Controller

假设目前的 Web API 版本是 v1。根据实际情况，可以是 v 后面加任何自然数，如：v2、v3 等。
3个子平台的控制器，必须按照以下的方式实现：

1. 系统管理平台 Web API 控制器
__系统管理平台 Web API 表现控制器__是 app/controllers/administration/dosser/v1 下的所有控制器的基类。
(app/controllers/administration/dosser/v1/presentation_controller.rb)

```ruby
class Administration::Dosser::V1::PresentationController < ::ApplicationController

  clear_helpers

  include Repres::Dosser::Concerns::ResourcePresentation

  layout nil

end
```

__系统管理平台 Web API 门户控制器__是整个子平台的入口。它在响应中提供系统名称，以及指向所有 Web API 的链接。
(app/controllers/administration/dosser/v1/portals_controller.rb)

```ruby
class Administration::Dosser::V1::::PortalsController < Administration::Dosser::V1::PresentationController

  def show

    self.criteria = { id: params[:id] }

    render_ok collection: [
      {
        name:  'XX系统',
        links: [
          { rel: 'self',                       href: administration_dosser_v1_portal_url(     Unidom::Common::SELF, format: request.format.symbol) },
          { rel: 'canonial',                   href: administration_dosser_v1_portal_url(     Unidom::Common::SELF, format: :json                ) },
          { rel: 'alternate',                  href: administration_dosser_v1_portal_url(     Unidom::Common::SELF, format: :xml                 ) },
          { rel: 'dosser/{action}/{resource}', href: administration_dosser_v1_{resources}_url(                      format: request.format.symbol) }
        ]
      }
    ]
  end

end
```

2. 行政管理平台 Web API 控制器
__行政管理平台 Web API 表现控制器__是 app/controllers/governance/dosser/v1 下的所有控制器的基类。
(app/controllers/governance/dosser/v1/presentation_controller.rb)

```ruby
class Governance::Dosser::V1::PresentationController < ::ApplicationController

  clear_helpers

  include Repres::Dosser::Concerns::ResourcePresentation

  layout nil

end
```

__行政管理平台 Web API 门户控制器__是整个子平台的入口。它在响应中提供系统名称，以及指向所有 Web API 的链接。
(app/controllers/governance/dosser/v1/portals_controller.rb)

```ruby
class Governance::Dosser::V1::::PortalsController < Governance::Dosser::V1::PresentationController

  def show

    self.criteria = { id: params[:id] }

    render_ok collection: [
      {
        name:  'XX系统',
        links: [
          { rel: 'self',                       href: governance_dosser_v1_portal_url(     Unidom::Common::SELF, format: request.format.symbol) },
          { rel: 'canonial',                   href: governance_dosser_v1_portal_url(     Unidom::Common::SELF, format: :json                ) },
          { rel: 'alternate',                  href: governance_dosser_v1_portal_url(     Unidom::Common::SELF, format: :xml                 ) },
          { rel: 'dosser/{action}/{resource}', href: governance_dosser_v1_{resources}_url(                      format: request.format.symbol) }
        ]
      }
    ]
  end

end
```

3. 从业人员平台 Web API 控制器
__从业人员平台 Web API 表现控制器__是 app/controllers/practition/dosser/v1 下的所有控制器的基类。
(app/controllers/practition/dosser/v1/presentation_controller.rb)

```ruby
class Practition::Dosser::V1::PresentationController < ::ApplicationController

  clear_helpers

  include Repres::Dosser::Concerns::ResourcePresentation

  layout nil

end
```

__从业人员平台 Web API 门户控制器__是整个子平台的入口。它在响应中提供系统名称，以及指向所有 Web API 的链接。
(app/controllers/practition/dosser/v1/portals_controller.rb)

```ruby
class Practition::Dosser::V1::::PortalsController < Practition::Dosser::V1::PresentationController

  def show

    self.criteria = { id: params[:id] }

    render_ok collection: [
      {
        name:  'XX系统',
        links: [
          { rel: 'self',                       href: practition_dosser_v1_portal_url(     Unidom::Common::SELF, format: request.format.symbol) },
          { rel: 'canonial',                   href: practition_dosser_v1_portal_url(     Unidom::Common::SELF, format: :json                ) },
          { rel: 'alternate',                  href: practition_dosser_v1_portal_url(     Unidom::Common::SELF, format: :xml                 ) },
          { rel: 'dosser/{action}/{resource}', href: practition_dosser_v1_{resources}_url(                      format: request.format.symbol) }
        ]
      }
    ]
  end

end
```

4. 超链接的说明

在以上的示例代码中，
- {action} 表示行为，只能是：index（列表）、load（详情）、destroy（销毁）、update（更新）、create（创建）这5个词汇之一。
- {resource} 表示资源名称，英文单数，小写字母，单词间用下划线连接。

如果有需要指向外部系统的链接，则 rel 的格式为 {system}/dosser/{action}/{resource} 。其中system是外部系统的代码。

### 3. Swagger 文档

Swagger 文档应改按照以下路径规则保存：
- lib/swagger/administration_api_v1.json
- lib/swagger/governance_api_v1.json
- lib/swagger/practition_api_v1.json

其中 v1 可以是其他的版本号，如：v2、v3 等。

Swagger文档的书写，应该遵守[Swagger文档规范](https://www.gitbook.com/book/topbitdu/swagger-document-convention/details)。
通过 Swagger UI 呈现的API文档，应该通过安全措施保护，如：HTTP Basic Authentication。

### 4. 超链接相关的环境变量

如果在本系统中，需要通过环境变量配置指向其他系统的超链接，除了遵循[通用的环境变量命名规则](#3-环境变量)外，还需要遵循以下的规则：
- 所有单词大写
- 单词之间用下划线连接
- 本系统的代号放在第一位
- 目标系统的代号放在第二位
- 目标系统的子平台代号放在第三位
- 目标系统的资源名称放在第四位
- 单词 DOSSER_LINK 放在第五位

如： PICASSO_RORAIMA_ADMINISTRATION_PORTAL_DOSSER_LINK
- Picasso 是本系统的代号
- Roraima 是目标系统的代号
- Administration 是目标系统的子平台代号，还可以有 Governance、Practition 等子平台
- Portal 是目标系统的资源名称

### 5. 分页相关的环境变量

如果在系统中，需要配置分页相关的环境变量，除了遵循[通用的环境变量命名规则](#3-环境变量)外，还需要遵循以下的规则：
- 子平台代号放在第二位
- 资源名称放在第三位
- 单词 DOSSER_PER_PAGE 放在第四位

如：PICASSO_GOVERNANCE_PLACE_FILING_DOSSER_PER_PAGE
- Picasso 是系统的代号
- Governance 是子平台代号，还可以有 Administration、Practition 等子平台
- Place Filing 是资源名称
- 最后是 Dosser Per Page

除了基于具体资源的分页环境变量外，还有一个用于本系统所有 Web API 的分页环境变量： PICASSO_DOSSER_PER_PAGE，缺省值应该为 5。



## 5. 项目文档

1. 线路图
文件：ROADMAP.md
格式：Markdown
作用：描述预计在每个版本中提供的功能，由主程序员负责维护。

2. 变更日志
文件：CHANGELOG.md
格式：Markdown
作用：描述每个版本的变更，由主程序员负责维护。

3. 部署指南
文件：DEPLOYMENT.md
格式：Markdown
作用：描述所有的环境变量和每个版本的发布步骤，由主程序员负责维护。
