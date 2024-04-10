# Cái nhìn tổng quan về vsphere vè virtual machine
## 1. Hypervisor là gì
- Hypervisor là một phần mềm máy tính , nó cho phép các phần cứng server có thể tạo và chạy các máy ảo
- Hypervisor cho phép tạo một lớp ảo hóa RAM, CPU,... để máy ảo sử dụng 
- Có 2 loại hypervisor
  - Hypervisor type 1: thường được cài đặt trực tiếp trên phần cứng vật lý của server
  - Hypervisor type 2: Hypervisor loại này chạy trên một hệ điều hành chủ (host OS) thông thường. Nó cung cấp một lớp trung gian giữa hệ điều hành và các máy ảo.

![Alt](/thuctap/anh/Screenshot_992.png)

## 2. Các thuật ngữ
|Thuật ngữ |Định nghĩa|Ví dụ|
|---|---|---|
|OS(hệ điều hành)|được thiết kế để phân bổ tài nguyên vật lý và ứng dụng|Linux, Windows|
|Application| Phần mềm chạy trên HĐH tiêu tốn tài nguyên vật lý|Chrome, Office|
|Virtual machine| Ứng dụng đặc biệt sử dụng tài nguyên đã được ảo hóa||
|Guest| Hệ điều hành khách chạy trên máy ảo||
|Hypervisor| Là 1 OS đặc biệt dùng để tạo ra các VM|ESXi, Workstation, Fusion|
|Host| Máy vật lý cung cấp tài nguyên cho ESXi||
|vSphere| Sản phẩm ảo hóa của VMware||
|Cluster| Nhóm máy chủ ESXi có tài nguyên được chia sẻ cho máy ảo||


# Tài liệu tham khảo
https://www.youtube.com/watch?v=AlaG93w723Q&list=PLcRhfKiWZmM8BitVLZXxxgbppci9yBm3K&index=2
