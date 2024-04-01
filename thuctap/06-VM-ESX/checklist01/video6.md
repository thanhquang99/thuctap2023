- [Giải thích kiến trúc của ESXi Switch](#giải-thích-kiến-trúc-của-esxi-switch)
  - [1. Networking basic](#1-networking-basic)
  - [2. Mô hình Network đối với ESXi](#2-mô-hình-network-đối-với-esxi)
  - [3. Cấu trúc virtual standard switch](#3-cấu-trúc-virtual-standard-switch)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Giải thích kiến trúc của ESXi Switch
## 1. Networking basic 
Yêu cầu cơ bản hình thành Network
- Network adapter (LAN card / nics) : card mạng vật lý mà mọi máy chủ cần để có thể kết nối mạng. Mỗi Network adapter đều sẽ có địa chỉ MAC 
- Media (Wire /wire less) : Phương tiện truyền có dây hoặc không dây, ám chỉ đến dây mạng hay đường truyền không dây nếu là wifi
  - CAT 5: 100 mbps chuẩn RJ45
  - CAT 6: 1Gbps chuẩn RJ45
- Network device: là các thiết bị định tuyến, chuyển mạch như router, switch, WAP,...
- Protocol : Là các giao thức mạng được sử dụng như: IP, TCP, UDP, ssh, ...
- IP address: là địa chỉ mạng dùng để định nghĩa địa chỉ của các thiết bị có thể là IPv4 và IPv6

## 2. Mô hình Network đối với ESXi
- Phần này tôi đã tìm hiểu rồi các bạn có thể xem [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/06-VM-ESX/Ly-thuyet/02.networking.md)

Một vài kiến thức tìm hiểu thêm
- Physical NIC : 
  - Loại 1Gib : tối đa 32 
  - Loại 10Gib : tối đa 16
- Standard switch và distributed switch 
  - Tối đa 4095 port/host
## 3. Cấu trúc virtual standard switch
![Alt](/thuctap/anh/Screenshot_965.png)
- Trong virtual switch sẽ mặc định tạo ra 2 group port Management và vMotion với 2 chức năng quản lý các host
- các group port khác ta sẽ tạo ra với mục đích dùng và được găn gắn cho máy ảo
- Các uplink port sẽ được gắn vào virtual standard switch 
- các VM từ port group được gắn với vSS rồi từ uplink port kết nối physical sswitch rồi ra ngoài Internet

# Tài liệu tham khảo
https://www.youtube.com/watch?v=UsGnF0FFnjM&list=PLjsBan7CwUQAFA9m2dYEL2FmeRdRiyWBD&index=7
