# Tìm hiểu về vCenter
Mô hình hoạt động của vCenter
![Alt](/thuctap/anh/Screenshot_971.png)
- vCenter là nền tảng quản lý cho vSphere
- vCenter server cho phép quản lý quản lý tập tring nhiều máy chủ ESXi và các máy ảo của chúng
- vCenter chỉ khả dụng với vSphere 7.0 trở lên
- VCSA là một máy ảo dựa trên linux được cấu hình sẵn, được tối ưu để chạy máy chủ vCenter và các thành phần trong vCenter Server
- Ta có thể triển khai VCSA trên bất kỳ một máy chủ ESXi của mình
- VCSA cung cấp các tính năng nâng cao như  : HA, DRS, vMotion, Storage vMotion ,...

vCenter package bao gồm
- VMware Photon OS
- PostgreSQL data base 
- vCenter server Service

# Kiến trúc của vCenter

![Alt](/thuctap/anh/Screenshot_973.png)

Nhìn vào hình ta thấy rằng cấu trúc hoạt động của vCenter sẽ gồm 3 thành phần 
- vSphere Client: giao diện quản lý vCenter
- vCenter Server Appliance : server cài triển khai cài đặt vCenter lên
- ESXi hosts : tất cả các host được ESXi quản lý


Mô hình hoạt động của vCenter và ESXi host client

![Alt](/thuctap/anh/Screenshot_974.png)

- Ta nhận thấy rằng vShere Client quản lý các ESXi host thông qua vCenter server mà không cần VMware host client và VMware host client không khả dụng trong trạng thái lockdown mode
- Ta có thể thông qua shell để quản lý các trạng thái hostd hoặc vpxa


Khi cài vCenter thì ta cũng sẽ tự động cài đặt một số service. Dưới đây là 8 service cần lưu ý:
- vCenter server :Được coi là "trái tim" của VMware vSphere, vCenter Server là một nền tảng quản lý trung tâm cho các môi trường ảo hóa VMware. Nó cung cấp các tính năng như quản lý máy chủ ảo (VM), tự động hóa, giám sát, quản lý tài nguyên, và nhiều tính năng quản lý khác
- VMware vSphere Clinet (html5): Đây là giao diện người dùng đồ họa được xây dựng dựa trên HTML5 cho phép quản trị viên tương tác với hệ thống VMware vSphere
- Vmware vCenter Single Sign On (SSO) : Dịch vụ này cho phép người dùng đăng nhập một lần (single sign-on) vào các ứng dụng và dịch vụ của VMware vSphere mà không cần phải nhập thông tin đăng nhập lại
- Lisence Service : Dịch vụ quản lý giấy phép cho phép quản trị viên quản lý và cấp phát giấy phép cho các sản phẩm VMware vSphere và các ứng dụng liên quan khác.
- vCenter lookup Service : Dịch vụ này cung cấp thông tin về các dịch vụ và các thành phần có sẵn trong môi trường vSphere. Nó được sử dụng để định vị các dịch vụ và cơ sở dữ liệu mà các ứng dụng VMware vSphere cần truy cập.
- Vmware Certificate Authority :Dịch vụ này tạo và quản lý chứng chỉ SSL để bảo vệ dữ liệu giao tiếp trong môi trường VMware vSphere.
- Content Library : Dịch vụ này cho phép quản trị viên lưu trữ, quản lý và chia sẻ các mẫu VM, hình ảnh ISO và các tài liệu khác trong một thư viện trung tâm trong môi trường vSphere
- VMware vSphere ESXi dump clollector : Dịch vụ này thu thập thông tin và báo cáo về lỗi và sự cố xảy ra trên máy chủ VMware ESXi. 

# Hướng dẫn cài đặt vCenter

