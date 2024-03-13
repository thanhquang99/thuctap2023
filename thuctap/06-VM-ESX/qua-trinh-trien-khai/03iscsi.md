# Thêm host và thiết lập ISCSI server
Mô hình triển khai
![Alt](/thuctap/anh/Screenshot_864.png)

IP Planning
|Tên máy|Ethernet|IP|Vlan |
|-------|--------|--|-----|
|ESXi 01|vmkenal1|192.168.10.91|Vlan 10|
|ESXi 02|vmkenal1|192.168.10.92|Vlan 10|
|ADDC <br/> Windows Server 2019|Ethernet|192.168.10.93|Vlan 10|
|Vcenter|Ethernet|192.168.10.94|Vlan 10|
|ISCSI storage<br/>Windows Server 2019|Ethernet|192.168.10.95|Vlan 10|
## 1. Thêm host vào vcenter
- Ta tiến hành đăng nhập với tài khoản ta vừa tạo
- Tiến hành đặt tên data center
  ![Alt](/thuctap/anh/Screenshot_836.png)
  ![Alt](/thuctap/anh/Screenshot_837.png)
- Thêm địa chỉ IP máy ESXi 
  ![Alt](/thuctap/anh/Screenshot_838.png)
- Đăng nhập tài khoản root
  ![Alt](/thuctap/anh/Screenshot_839.png)
  ![Alt](/thuctap/anh/Screenshot_840.png)
  ![Alt](/thuctap/anh/Screenshot_841.png)
  ![Alt](/thuctap/anh/Screenshot_842.png)
  ![Alt](/thuctap/anh/Screenshot_843.png)
  ![Alt](/thuctap/anh/Screenshot_844.png)
  ![Alt](/thuctap/anh/Screenshot_845.png)
- Ta làm tương tự với ESXi 02 và đây là kết quả
  ![Alt](/thuctap/anh/Screenshot_846.png)

## 2. Thêm ISCSI server
- iscsi là một dạng share storage. Ta có thể cài đặt ISCSi lên bất kỳ một máy nào và sử dụng disk của máy đó để sử dụng cho bất kỳ ESXi nào mà ta thiết lập
- Trong bài này sẽ sử dụng Window server 2019 để làm Iscsi server
### 2.1 Cấu hình trên Window server 2019
- Ta chỉ cần add role iscsi để có thể sử dụng Window server 2019 như là iscsi server
  ![Alt](/thuctap/anh/Screenshot_847.png)
  ![Alt](/thuctap/anh/Screenshot_848.png)
  ![Alt](/thuctap/anh/Screenshot_849.png)
  ![Alt](/thuctap/anh/Screenshot_850.png)
  ![Alt](/thuctap/anh/Screenshot_851.png)
  ![Alt](/thuctap/anh/Screenshot_852.png)
  ![Alt](/thuctap/anh/Screenshot_853.png)
  ![Alt](/thuctap/anh/Screenshot_854.png)

- Đây là tất các các bước ta cần để có thể cấu hình iscsi server
### 2.2 Cấu hình trên ESXi cần share storage
- Đầu tiên ta cần add vmkernal NIC để sử dụng cho dịch vụ này
  ![Alt](/thuctap/anh/Screenshot_855.png)
- Tiến hành tạo vmkernal nic
  ![Alt](/thuctap/anh/Screenshot_856.png)

- Tiến hành cấu hình storage 
  ![Alt](/thuctap/anh/Screenshot_857.png)
  ![Alt](/thuctap/anh/Screenshot_858.png)

- Tiến hành add vào storage
  ![Alt](/thuctap/anh/Screenshot_859.png)
  ![Alt](/thuctap/anh/Screenshot_860.png)
  ![Alt](/thuctap/anh/Screenshot_861.png)
  ![Alt](/thuctap/anh/Screenshot_862.png)
  ![Alt](/thuctap/anh/Screenshot_863.png)

## 3. Hướng dẫn thêm File chứa OS vào ESCSI
- Để có thể thêm OS vào disk ảo do ESCSI tạo ra thì ta chỉ cần lên máy ESXi 01 hoặc ESXi 02 để tải file từ máy tính mình lên storage là xong

![Alt](/thuctap/anh/Screenshot_868.png)

Tiếp theo ta cần tạo ra một thư mục chứa OS rồi mới upload file lên
![Alt](/thuctap/anh/Screenshot_869.png)

Bây giờ ta tiến hành chọn vào thư mục đã tạo và upload file
![Alt](/thuctap/anh/Screenshot_870.png)

