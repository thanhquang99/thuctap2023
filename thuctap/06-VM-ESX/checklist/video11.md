# Tìm hiểu về vCenter
Mô hình hoạt động của vCenter
![Alt](/thuctap/anh/Screenshot_970.png)
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
