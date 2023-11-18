- [Bổ xung những thứ còn thiếu khi tìm hiểu về OSI và CCNA](#bổ-xung-những-thứ-còn-thiếu-khi-tìm-hiểu-về-osi-và-ccna)
  - [Phần cứng trong server](#phần-cứng-trong-server)
    - [Mainboard](#mainboard)
    - [Chassis Server](#chassis-server)
    - [CPU](#cpu)
    - [Bộ nhớ máy chủ (RAM server)](#bộ-nhớ-máy-chủ-ram-server)
    - [Ổ cứng SAS/SATA](#ổ-cứng-sassata)
    - [Linh kiện Card RAID](#linh-kiện-card-raid)
    - [Bộ cung cấp nguồn (PSU)](#bộ-cung-cấp-nguồn-psu)
  - [Raid (các loại Raid)](#raid-các-loại-raid)
    - [Điều kiện cần khi chạy Raid](#điều-kiện-cần-khi-chạy-raid)
    - [Các RAID phổ biến](#các-raid-phổ-biến)
      - [RAID 0](#raid-0)
      - [RAID 1](#raid-1)
      - [RAID 10](#raid-10)
      - [RAID 5](#raid-5)
      - [RAID 6](#raid-6)
    - [Wlan](#wlan)
      - [Wlan là gì?](#wlan-là-gì)
      - [Ưu điểm và nhược điểm của Wlan](#ưu-điểm-và-nhược-điểm-của-wlan)
      - [Các chuẩn mạng wlan](#các-chuẩn-mạng-wlan)
    - [Kỹ thuật AAA](#kỹ-thuật-aaa)
      - [Định nghĩa](#định-nghĩa)
      - [Cấu hình Authencation](#cấu-hình-authencation)
      - [Authorization](#authorization)
      - [Cơ chế Accounting](#cơ-chế-accounting)
      - [Giới hạn số lần truy cập thất bại bằng Login Block-For](#giới-hạn-số-lần-truy-cập-thất-bại-bằng-login-block-for)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Bổ xung những thứ còn thiếu khi tìm hiểu về OSI và CCNA
## Phần cứng trong server
### Mainboard
- Đây có thể coi là main của máy tính hay server ,nó là thứ kết nối và truyền dẫn các linh kiện điện tử lại với nhau để tạo thành 1 thể thống nhất giúp các link kiện trao đổi được với nhau

![Alt](/thuctap/anh/Screenshot_93.png)
### Chassis Server
- Nó được coi như là vỏ của máy chủ ,có tác dụng bảo vệ các linh kiện điện tử bên trong khỏi các tác hại bên ngoài, ngoài ra nó còn có tác dụng cố định vị trí của server

![Alt](/thuctap/anh/Screenshot_94.png)

### CPU
- được gọi là bộ xử lý trung tâm ,được xem là bộ não của máy chủ . Nó tích hợp hàng triệu transitor trên đó.

![Alt](/thuctap/anh/Screenshot_95.png)

### Bộ nhớ máy chủ (RAM server)
- Đây là một linh kiện quan trọng của máy chủ nó quyết định số lượng chương trình có thể chạy đồng thời 1 lúc trên máy chủ
- Khi tắt nguồn thì các dữ liệu ghi trên thanh ghi ram sẽ mất hết
- Do tính chất hoạt động liên tục và ổn định nên RAM máy chủ cần có hỗ trợ ECC (Error Checking and Correction)hoặc gọi tắt là RAM ECC vì bản thân loại RAM này có khả năng kiểm tra và sửa lỗi cho từng bit riêng lẻ giúp cho máy chủ phát hiện và xử lý kịp thời các lỗi xảy ra cho bộ nhớ để cho máy chủ hoạt động ổn định và liên tục

![Alt](/thuctap/anh/Screenshot_96.png)

### Ổ cứng SAS/SATA
- Máy chủ là một thiết bị lưu trữ dữ liệu có du ng lượng lớn. Ổ cứng của máy chủ không khác nhiều so với ở cứng máy PC bình thường nhưng do nhu cầu sử dụng cho máy chủ đòi hỏi khả năng truy suất cao nên ổ cứng dành cho máy chủ sẽ có những tính năng và chuẩn riêng cho những ổ cứng máy chủ như số vòng quay nhiều hơn chẳng hạn

![Alt](/thuctap/anh/Screenshot_97.png)

- Ổ cứng ssd sử dụng chip nhớ thay vì các đĩa quay để ghi nhớ ở hdd nên sẽ có hiệu năng cao kèm theo giá thành đắt hơn

### Linh kiện Card RAID
- Card RAID là một bo điều khiển với chức năng là kết hợp các ổ cứng thành một hệ thống ổ cứng thống nhất với những cơ chế lưu trữ và sao lưu khác nhau nhằm giúp cho tốc độ truy suất dữ liệu cao và đảm bảo an toàn cho dữ liệu được lưu trữ.

![Alt](/thuctap/anh/Screenshot_98.png)

### Bộ cung cấp nguồn (PSU)
- Thành phần cung cấp năng lượng cho các thiết bị bên trong giữ vai trò quan trọng trong quá trình hoạt động của máy chủ, chính vì thế các dòng máy chủ chuyên dùng thường đi theo những bộ nguồn công suất thực cao có khả năng thay thế hay dự phòng khi bộ nguồn chính bị lỗi.

![Alt](/thuctap/anh/Screenshot_99.png)

## Raid (các loại Raid)
- là hình thức ghép nhiều ổ đĩa cứng vật lý thành một hệ thống ổ đĩa cứng có chức năng gia tăng tốc độ đọc/ghi dữ liệu hoặc nhằm tăng thêm sự an toàn của dữ liệu chứa trên hệ thống đĩa hoặc kết hợp cả hai chức năng trên.
### Điều kiện cần khi chạy Raid
- Để chạy raid cần tối thiểu một card điều kiển và ít nhất 2 ổ đĩa cứng giống nhau về dung lượng
- Ổ đĩa cứng có thể tuân theo bất kỳ chuẩn nào, ATA,SCSI

### Các RAID phổ biến
- Theo RAD thì RAID được chia làm 7 cấp độ và nó là biến thể kết hợp của RAID 0,1

#### RAID 0

![Alt](/thuctap/anh/Screenshot_100.png)

- Theo chế độ này thì dữ liệu sẽ chia thành n phần bằng nhau tương ứng với n ổ đĩa và mỗi ổ đĩa  đều chứ 1/n dữ liệu. Ví dụ ta có dữ liệu 40G được lưu lại trên Raid 0 có 4 ổ đĩa thì mỗi ổ đĩa sẽ chịu trách nghiệm 10G 
- Nhược điểm của loại này là nếu dữ kiệu ở 1 ổ đĩa hỏng thì dữ liệu ở các ổ khác sẽ không dùng được

#### RAID 1

![Alt](/thuctap/anh/Screenshot_101.png)

- Theo chế độ này thì dữ liệu sẽ lưu trên 1 ổ cứng và 1 ổ kia làm backup.Ví dụ có 2 ổ cứng 80G được ghép theo kiểu RAID 1 thì máy sẽ chỉ hiểu ta có ổ cứng là 80G chứ không phải 160G
- Ưu điểm : An toàn về dữ liệu khả năng liên tục cao
- Nhược điểm :Hiệu suất không cao ,chi phí cao

#### RAID 10

![Alt](/thuctap/anh/Screenshot_102.png)
- Là sự kết hợp giữa Raid 1 và Raid 0, do đó nó có tốc độ đọc dữ liệu cao và khả năng an toàn tốt nhứng chi phí lại đắt lên gấp đôi và nếu chết 2 ổ cùng 1 nhóm sẽ hỏng hết dữ liệu

#### RAID 5

![Alt](/thuctap/anh/Screenshot_103.png)

- Ta hãy hiểu như này disk 1-2-3 hàng 1 sẽ lưu dư liệu bình thường còn disk 4 sẽ tạo ra parity lưu trữ backup của 1-2-3 và trải dài cho đến hàng 2 thì disk 3 sẽ back up cho disk 1-2-4 ... Khi 1 disk bị hỏng thì ta có thể dựa vào các disk còn lại để khôi phục dữ liệu
- do có 1 phân vùng làm parity nên dữ liệu thật trên ổ cứng được tính bằng `Tổng dung lượng= Dung lượng của 1 ổ cứng x (Số lượng các ổ cứng tham gia -1)
`
- Ưu điểm: 
  - Khả năng chịu lỗi tốt
  - Đọc dữ liệu nhanh
  - Giá cả phù hợp
  - Hiệu quả lưu trữ và hiệu suất

- Nhược điểm
  - Phục hồi dữ liệu từ các lỗi chậm
  - Chỉ được phép lỗi 1 ổ cứng

#### RAID 6 

![Alt](/thuctap/anh/Screenshot_104.png)

- Là bản cải tiến của raid 5 ,điều thay đổi là cấn tối thiểu 4 disk và các parity được trải đều 2 lần trên mỗi ổ cứng ,nhìn vào hình ta thấy các parity của hàng 1 được lặp lại trên disk 3 và disk 4,còn hàng 2 trên disk 2 và disk 3
- Vì là bản cải tiến của Raid 5 nên nó có thể chịu được 2 disk hỏng cùng lúc mà vẫn đủ khả năng khôi phục được

### Wlan
#### Wlan là gì?
- Wlan là viết tắt của wireless local area network hay còn được gọi là mạng Lan không đây 
- Các mạng Lan thay vì được kết nối bằng carb nối thì bây giờ nó dùng tín hiệu radio hay hồng ngoại để truyền dữ liệu

#### Ưu điểm và nhược điểm của Wlan
- Ưu điểm:
  - Các thiết bị kết nối không dây bỏ qua dây carb giúp giảm thiểu chi phí 
  - Không bị giới hạn cổng kết nối như kết nối vật lý
  - Dễ dàng nâng cấp bộ định tuyến bằng cách thay thế router,không cần thay thế carb như cách truyền thống

- Nhược điểm:
  - Kém an toàn hơn so với kết nối vật lý
  - Dễ bị ảnh hưởng bởi các rào cản vật lý

#### Các chuẩn mạng wlan
- Chuẩn WIFI 802.11(Gen 1): Được giới thiệu 1997. Chỉ hỗ trợ cho bằng tần mạng max lên đến 2Mbps - vô cùng chậm so với các ứng dụng hiện nay và chuẩn này hiện nay không còn được sản xuất nữa.
- Chuẩn WIFI 802.11b(Gen 2): Mở rộng trên chuẩn gốc 802.11 và được tạo ra vào 1999. Chuẩn này hỗ trợ băng thông lên đến 11Mbps, sử dụng tần số tín hiệu vô tuyến không được kiểm soát (2.4GHz) cho nên có thể bị xuyên nhiễu từ các thiết bị điện thoại không dây (kéo dài), lò vi sóng hoặc các thiết bị khác sử dụng cùng dải tần 2.4 GHz
- Chuẩn WIFI 802.11a(Gen 2): Vẫn đang được phát triển, hỗ trợ băng thông lên đến 54 Mbps, tín hiệu trong một phổ tần số quy định quanh mức 5GHz nên khó xuyên qua các vách tường và phạm vi hẹp
- Chuẩn WIFI 802.11g(Gen 3): Hỗ trợ băng thông lên đến 54Mbps và sử dụng tần số 2.4 Ghz để có phạm vi rộng.
- Chuẩn WIFI 802.11n(Gen 4): hỗ trợ băng thông mạng tối đa trên lý thuyết lên tới 300Mbps và hoạt động ở cả băng tần 2.4 GHz và 5 GHz

### Kỹ thuật AAA
#### Định nghĩa
- AAA là viết tắt của authencation(xác thực), authorization (phân quyền) ,accounting(kiểm toán) 
  - Authencation(xác thực) :bằng cách cung câp cơ chế xác thực bằng user và password
  - Authorization :Giới hạn câu lệnh với user
  - Accountting : Ghi lại nhật ký ai đã đăng nhập và dùng câu lệnh gì

#### Cấu hình Authencation
```
Router(config)#aaa new-model
Router(config)#aaa authentication login thanhquang local
Router(config)#username thanhquang password 123456
Router(config)#line vty 0 4
Router(config-line)#login authentication thanhquang
```
#### Authorization
- Trên Cisco router hỗ trợ 16 cấp độ bảo mật khác nhau từ level 0 - level 15. Level 15 là đặc quyền cao nhất, còn level 0 là đặc quyền thấp nhất
- Tạo mật khẩu enable cho level 8
```
Router(config)#enable secret level 8 123456
```
- Phân quyền cho level 8 : Nhìn vào cáu trúc câu lệnh ta dùng từ privilege để xác nhận đặc quyền rồi mới đến tên quyền được cấp còn từ interface hay ip addr ta sẽ không dùng tab để viết tắt được mà phải hiểu các mode gì dùng được cái gì

![Alt](/thuctap/anh/Screenshot_105.png)

```
Router(config)#privilege exec level 8 configure terminal
Router(config)#privilege configure level 8 interface
Router(config)#privilege interface level 8 ip address
```

- Đăng nhập với level 8: `Router>enable 8`
- Xem level mình đang đứng: `Router#show privilege `

#### Cơ chế Accounting
- Bật cơ chế kiểm toán bằng câu lệnh
```
Router(config)#archive
Router(config-archive)#log config
Router(config-archive-log-cfg)#logging enable

```

- Khi user thực hiện bất kỳ câu lệnh nào trên router thì sẽ được log ghi lại. Để xem được các log đó sử dụng câu lệnh
```
Router#show archive log config all
```

#### Giới hạn số lần truy cập thất bại bằng Login Block-For
- Câu lệnh giới hạn 60s chỉ được nhập thất bại 2 lần lần 3 phải đúng
```
Router(config)#login block-for 600 attempts 3 within 60 
```
- Để kiểm tra tham số giới hạn đăng nhập thất bại bằng câu lệnh 

```
Router#show login
```

- Kiểm tra địa chỉ IP đang cố gắng đăng nhập thất bại tới router bằng câu lệnh 

```
Router#show login failures
```






# Tài liệu tham khảo
https://viettelco.vn/cac-thanh-phan-linh-kien-co-ban-cua-server-vat-ly/

https://docs.google.com/document/d/1hDpw_DYmYLFAOZBukk5j8neCLjioeiGDOq66-s8UPWw/edit

https://www.youtube.com/watch?v=qCpTl6Hj0M4