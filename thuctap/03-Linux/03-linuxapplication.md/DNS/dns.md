# Cấu hình DNS Server cho Windows Server 2019
## 1. Mô hình 
![Alt](/thuctap/anh/Screenshot_1116.png)
IP Planning
|Máy chủ|IP|
|---|-----|
|Web-Client|172.16.66.54|
|Web-Server|172.16.66.53<br>thanhquang.dns.local|
|DNS-Server|172.16.66.51 <br>NAT(Internet)|
## 2. Cấu hình DNS Server
### 2.1 Cấu hình DNS Server
![Alt](/thuctap/anh/Screenshot_794.png)
- Ta sẽ Next đến bước Server Roles và tích vào DNS Server
![Alt](/thuctap/anh/Screenshot_795.png)

Chọn Add Features:

- ô ta cần phải tích `Active Directory Domain Service` , Next
  ![Alt](/thuctap/anh/Screenshot_796.png)

- Tiếp tục Next
  ![Alt](/thuctap/anh/Screenshot_797.png)

- Next đến khi cài đặt xong

![Alt](/thuctap/anh/Screenshot_798.png)
![Alt](/thuctap/anh/Screenshot_799.png)
![Alt](/thuctap/anh/Screenshot_800.png)
![Alt](/thuctap/anh/Screenshot_801.png)
![Alt](/thuctap/anh/Screenshot_802.png)
![Alt](/thuctap/anh/Screenshot_803.png)
![Alt](/thuctap/anh/Screenshot_804.png)
![Alt](/thuctap/anh/Screenshot_805.png)
![Alt](/thuctap/anh/Screenshot_806.png)

Restart lại server 

### 2.2Thay đổi thông tin máy chủ ADDC
![Alt](/thuctap/anh/Screenshot_807.png)
![Alt](/thuctap/anh/Screenshot_808.png)
![Alt](/thuctap/anh/Screenshot_809.png)
![Alt](/thuctap/anh/Screenshot_811.png)
Restart lại dịch vụ
### 2.3 Cấu hình bản ghi A
![Alt](/thuctap/anh/Screenshot_1117.png)
![Alt](/thuctap/anh/Screenshot_1118.png)
### 2.4 Cấu hình DNS cho Client
![Alt](/thuctap/anh/Screenshot_1119.png)
## 3. Kiểm tra bằng nslookup
![Alt](/thuctap/anh/Screenshot_1120.png)
![Alt](/thuctap/anh/Screenshot_1121.png)