# 阿里云 RAM 规范



## 1. RAM 初始设置

- 企业别名：__vdin__
- RAM用户登录密码强度：
  - 密码长度：__12位以上__
  - 密码中必须包含：__小写字母、大写字母、数字、特殊字符__
- RAM用户的MFA登录配置：__否__（由于没有专用的MFA设备，所以暂不开启）



## 2. 创建 RAM 群组

<table class='table table-hover table-striped'>
  <caption>表 1：RAM 群组表</caption>
  <thead>
    <tr>
      <th>组名称</th>
      <th>备注</th>
      <th>权限</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>administrators</td>
      <td>管理员</td>
      <td>AdministratorAccess 管理所有阿里云资源的权限</td>
    </tr>
    <tr>
      <td>system engineers</td>
      <td>系统工程师</td>
      <td>
        <ul>
          <li>ReadOnlyAccess 只读访问所有阿里云资源的权限</li>
          <li>AliyunCDNFullAccess 管理CDN的权限</li>
          <li>AliyunOSSFullAccess 管理对象存储服务(OSS)权限</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>



## 3. 为员工创建 RAM 账号

以下的项目对所有的员工 RAM 账号都一样：

- 为该用户自动生成 Access Key：__是__
- 必须开启多因素认证：__关闭__
- 控制台登录：__启用__
- 初始密码：__zdht2016Vd!n__
- 要求账号下次登录成功后重置密码：__是__

<table class='table table-hover table-striped'>
  <caption>表 2：员工 RAM 账号表</caption>
  <thead>
    <tr>
      <th>登录名</th>
      <th>显示名</th>
      <th>备注</th>
      <th>邮箱</th>
      <th>电话</th>
      <th>群组</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>xu.qing</td>
      <td>徐青</td>
      <td>研发部经理</td>
      <td>kevin.xu@vdin.net</td>
      <td>18608038051</td>
      <td>administrators 管理员</td>
    </tr>
    <tr>
      <td>ran.hongliang</td>
      <td>冉弘亮</td>
      <td>系统工程师</td>
      <td>hongliang.ran@vdin.net</td>
      <td>13558715283</td>
      <td>system engineers 系统工程师</td>
    </tr>
  </tbody>
</table>



## 4. 为应用系统创建 RAM 账号

__以下的所有步骤，可以由 administrators 管理员 群组的用户负责配置。__

以下的项目对所有的员工 RAM 账号都一样：

- 为该用户自动生成 Access Key：__是__
- 必须开启多因素认证：__关闭__
- 控制台登录：__关闭__
- 邮箱：__不填写__
- 电话：__不填写__

<table class='table table-hover table-striped'>
  <caption>表 3：应用系统 RAM 账号表</caption>
  <thead>
    <tr>
      <th>登录名</th>
      <th>显示名</th>
      <th>备注</th>
      <th>权限</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>picasso-dev</td>
      <td>社会治安综合平台（开发）</td>
      <td>社会治安综合平台开发、测试、试运行、演示用的资源账户</td>
      <td>定制OSS权限</td>
    </tr>
    <tr>
      <td>picasso-live</td>
      <td>社会治安综合平台（正式）</td>
      <td>社会治安综合平台正式的资源账户</td>
      <td>定制OSS权限</td>
    </tr>
  </tbody>
</table>
