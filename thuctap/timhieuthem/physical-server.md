- [1. Tìm hiểu về phần cứng trong server](#1-tìm-hiểu-về-phần-cứng-trong-server)
- [2. Các thành phần chính của máy chủ](#2-các-thành-phần-chính-của-máy-chủ)
  - [2.1 Nơi cắm ổ cứng của server](#21-nơi-cắm-ổ-cứng-của-server)
  - [2.2 Quạt tản nhiệt](#22-quạt-tản-nhiệt)
  - [2.3 CPU và Ram](#23-cpu-và-ram)
  - [2.4 Card RAID](#24-card-raid)
  - [2.5 Card mạng](#25-card-mạng)
  - [2.6 Nguồn (PSU)](#26-nguồn-psu)
  - [2.7 black plane](#27-black-plane)
- [3.Tìm hiểu thêm](#3tìm-hiểu-thêm)
  - [3.1 PCI](#31-pci)
  - [3.2 IDRAC](#32-idrac)
  - [3.3 Main BIOS là gì](#33-main-bios-là-gì)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# 1. Tìm hiểu về phần cứng trong server
![Alt](/thuctap/anh/Screenshot_512.png)

![Alt](/thuctap/anh/Screenshot_435.png)

- Đây là hình ảnh thực tế của server

# 2. Các thành phần chính của máy chủ
## 2.1 Nơi cắm ổ cứng của server 
- Có rất nhiều ổ cứng sẽ được gắn vào các giá rồi được gắn vào server
- Các giá ổ cứng thường có độ dày là 2,5 inch và 3,5 inch

## 2.2 Quạt tản nhiệt
- Do server phải hoạt động liên tục nên cần phải liên tục làm mát và quạt tản nhiệt phụ trách việc đó

## 2.3 CPU và Ram
- CPU chính là bộ xử lý trung tâm của server
- Ở server này có 2 chỗ cắm CPU và trên mặt CPU có dính thêm tản nhiệt
- Ram được gắn bên cạnh CPU và trên vỏ máy có quy định về các cắm RAM ứng với 2 CPU như nào 
- `Lưu ý`: 
  - không quét bụi chỗ mặt CPU gắn với mainbroad vì chỉ cần dính rác nhỏ vào thì có thể bị hỏng
  - Nhìn vào ký hiệu tam giác để gắn CPU cho đúng vị trí 
  - VÍ dụ có 6 RAM thì sẽ cắm 3 RAM cho CPU1 và 3 RAM cho CPU ứng với các số 1,2,3 (xem ở vỏ để biết về sơ đồ)


- Một số thông tin cần biết về CPU:
  - Tốc độ CPU có đơn vị GHz biểu thị số chu kỳ mà mỗi giây CPU thực hiện được. Ví dụ 2,8 GHz có nghĩa CPU thực hiện được 2,8*10^9 chu kỳ mỗi giây
  - số nhân/lõi (Core): mỗi nhân của CPU chính là một CPU vật lý riêng biệt với các nhân khác
  - Số luồng (Threads):  thông số này cho ta biết có bao nhiêu đường (luồng) đưa dữ liệu cho CPU xử lý
  -  Bộ nhớ đệm (Cache): là nơi lưu trữ các dữ liệu và lệnh chờ để phần cứng máy tính xử lý. Mục đích của nó là để tăng tốc độ xử lý, nó giống như một trạm trung chuyển hay cảng tập kết hàng hóa.
  -  socket : chính là giá đõ để lắp gắn CPU vào. Socket được gắn cố định , khi chọn CPU ta phải chọn CPU có thể gắn phù hợp với socket
     -  ![Alt](/thuctap/anh/Screenshot_516.png)

- Một số thông số cần biết về RAM
  - Bus Ram :
    - Bus RAM là tốc độ truyền dữ liệu giữa RAM và các thành phần khác trong hệ thống máy tính, máy chủ như CPU hay bo mạch chủ
    - Mức bus RAM càng cao, tốc độ truyền dữ liệu càng nhanh.
    - Thông số bus RAM được đo bằng MHz (Megahertz)
    - ![Alt](/thuctap/anh/Screenshot_517.png)
  - Không phải Ram nào cũng tương thích với CPU và hay mainbroad. Ta có thể kiểm tra bằng phần mền cpu-z. 
    - ![Alt](/thuctap/anh/Screenshot_513.png)
  - DDR3 và DDR4: Đây là hai chuẩn RAM được sử dụng nhiều nhất
    - ![Alt](/thuctap/anh/Screenshot_514.png)
    - DDR3 :truyền tải dữ liệu thấp ,băng thông hạn chế,tương thích với nhiều mainbroad cũ nhưng giá thành rẻ
    - DDR4 :Tốc độ truyền tải cao ,băng thông rộng ,tiết kiệm điện năng ,nhưng giá thành cao hơn DDR3
    - DDR3 thông thường có tốc độ từ 800 MHz đến 2133 MHz, trong khi DDR4 có thể đạt tốc độ từ 2133 MHz đến 3200 MHz hoặc cao hơn.
    - RAM DDR4 cung cấp khả năng tạo ra các mô-đun bộ nhớ đơn dung lượng vô cùng lớn lên tới 512 GB so với dòng RAM DDR3 hiện tại chỉ có khả năng lưu trữ tối đa 128 GB
  -  RAM ECC và RAM Non-ECC:
     -  RAM ECC có khả năng phát hiện và sửa chữa lỗi bit, giúp bảo vệ dữ liệu khỏi các sai sót ngẫu nhiên
     -  RAM ECC giúp đảm bảo tính toàn vẹn của dữ liệu trong quá trình ghi và đọc, ngăn chặn hiện tượng bit bị mất hoặc bị thay đổi.
     -   RAM ECC thường có giá cao hơn so với RAM không ECC do tính năng bổ sung của nó
     -   Việc thực hiện mã hóa và giải mã trong RAM ECC có thể làm giảm hiệu suất so với RAM không ECC. Tuy nhiên, sự giảm thiểu này thường không đáng kể đối với hầu hết các ứng dụng thông thường
     - Ta cần phải kiểm tra các thông số kỹ thuật của thiết bị xem có hỗ trợ Ram ECC không
     - ![Alt](/thuctap/anh/Screenshot_515.png)
     - RDIMM và UDIMM: RDIMM (Registered DIMM) và UDIMM (Unbuffered DIMM) là hai dạng RAM ECC khác nhau. RDIMM sử dụng bộ đệm để giảm tải cho bộ điều khiển bộ nhớ, trong khi UDIMM không có bộ đệm và thích hợp cho các ứng dụng yêu cầu độ trễ thấp
     - ![Alt](/thuctap/anh/Screenshot_518.png)

## 2.4 Card RAID
- Đây là thiết bị được gắn thêm vào server nhằm tạo ra các RAID với mục đích backup dữ liệu
- Ta có thể tham khảo thêm về RAID [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/bo-xung-ccna/boxung.md#c%C3%A1c-raid-ph%E1%BB%95-bi%E1%BA%BFn)

## 2.5 Card mạng
- Card mạng được gắn vào Rezer rồi mới gắn vào mainbroad nhằm mục đích chuyển vị trí card mạnh từ nằm dọc sang nằm ngang để phù hợp với kích thước vỏ 
- Cáp Ethernet được phân loại là Cat5, Cat 5e, Cat6 và UTP
- những loại Ethernet được sử dụng nhiều nhất:
  
|Tốc độ|Tên gọi chung|Tiêu chuẩn IEEE(không chính thức)|Tiêu chuẩn IEEE(chính thức)|
|---|----|-----|--------|
|10 Mbps|Ethernet|10BASE-T|802.3|
|100 Mbps|FastEthernet|100BASE-T|802.3u|
|1 Gbps|GigabitEthernet|1000BASE-T|802.3ab|
|10 Gbps|10 GE|10GBASE-T|802.3an|

|Tên|Cấu trúc|Ứng dụng|
|----|------|--------|
|Cat5|UTP|Cáp Ethernet 100BASE-TX & 1000BASE-T|
|Cat5e|UTP|Cáp Ethernet 100BASE-TX & 1000BASE-T|
|Cat6|STP|Cáp Ethernet 10GBASE-T|
|Cat6a|STP|Cáp Ethernet 10GBASE-T|


![Alt](/thuctap/anh/Screenshot_440.png)
![Alt](/thuctap/anh/Screenshot_441.png)
![Alt](/thuctap/anh/Screenshot_442.png)
![Alt](/thuctap/anh/Screenshot_443.png)

## 2.6 Nguồn (PSU)
- Trên máy có 2 nguồn dùng để cung cấp điện liên tục cho server nhằm mục đích lỡ không máy mất điện đột ngột
- Công suất của thiết bị là 550W

## 2.7 black plane
- Là phần kết nối vào mainbroad của server
- Nó cung cấp các đầu nối dữ liệu và tín hiệu điều khiển cho các ổ đĩa cứng
- Nó cũng cung cấp kết nối cho bo mạch I/O phía trước, nút nguồn và định vị cũng như đèn LED trạng thái hệ thống/thành phần

# 3.Tìm hiểu thêm

## 3.1 PCI
- PCI được viết tắt từ cụm từ Peripheral Component Interconnect là khái niệm để chỉ chuẩn giao tiếp giữa các linh kiện phần cứng máy tính với nhau.
- Các chuẩn PCI khác nhau thì cho tốc độ truyền tải dữ liệu khác nhau

## 3.2 IDRAC
![Alt](/thuctap/anh/Screenshot_438.png)

-  là một phần cứng được tích hợp sẵn trên bo mạch chủ (mainboard) của các dòng máy chủ server Dell.
-  Nó cung cấp quyền truy cập từ xa vào console (bàn phím và màn hình), cho phép truy cập giao diện BIOS hệ thống qua Internet
-  hỗ trợ cho người quản trị có thể quản lý máy chủ một cách linh động hơn từ xa mà không cần phải ngồi bên cạnh các server
-  Cấu hình [theo](https://maychuviet.vn/idrac-la-gi-huong-dan-cai-dat-va-su-dung-idrac/) 

![Alt](/thuctap/anh/Screenshot_439.png)
- Ta cần làm gì với IDRAC khi bắt đầu khỏi động lại máy
  - Đặt địa chỉ IP
  - Thiết lập mật khẩu root
  - login vào iDRAC thông qua địa chỉ ip và username/pass đã được thiết lập ở trên trình duyệt
## 3.3 Main BIOS là gì

- BIOS là viết tắt của từ Basic Input/Output System hay còn gọi là hệ thống đầu vào/ra cơ bản
- BIOS kiểm soát những chức năng cơ bản của máy tính
  - Kết nối và chạy driver cho cho các thiết bị ngoại vi như chuột ,máy tính
  - Đọc thứ tự ổ cứng để khởi động các hệ điều hành, hiển thị tín hiệu lên màn hình
  - thay đổi thứ tự ổ đĩa khi khởi động
  - nhiệm vụ của BIOS là “đánh thức” từng linh kiện và kiểm tra xem linh kiện này có hoạt động hay không

- Nhấn F2 hoặc F12 để vào BIOS


# Tài liệu tham khảo
https://maychuviet.vn/idrac-la-gi-huong-dan-cai-dat-va-su-dung-idrac/

https://vnpro.vn/thu-vien/tong-quan-ve-lop-vat-ly-cua-cac-chuan-ethernet-4308.html

https://docs.google.com/document/d/1v83RzwSF6YQ82fGN53j3dub-V4SvZ9mfpXghznM3XOk/edit

https://docs.oracle.com/cd/E22985_01/html/E22986/z40004a51401174.html#