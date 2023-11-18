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
    - [Giao thức PPP](#giao-thức-ppp)
      - [Cấu trúc frame của gói tin PPP](#cấu-trúc-frame-của-gói-tin-ppp)
      - [Quá trình thiết lập kết nối PPP](#quá-trình-thiết-lập-kết-nối-ppp)
    - [NAT trong cisco](#nat-trong-cisco)
      - [Định nghĩa về NAT](#định-nghĩa-về-nat)
      - [Phân loại NAT](#phân-loại-nat)
      - [Cấu hình Static NAT](#cấu-hình-static-nat)
      - [Cấu hình dynamic Nat(over load)](#cấu-hình-dynamic-natover-load)
      - [Cấu hình PAT](#cấu-hình-pat)
      - [Load balancing](#load-balancing)
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
### Giao thức PPP
- PPP là giao thức lớp 2 phổ biến cho mạng WAN. Hai thành phần của PPP tồn tại: LCP (Link Control Protocol) đàm phán kết nối và NCP (Network Control Protocol) đóng gói lưu lượng
- LCP được sử dụng để thiết lập, định cấu hình và kiểm tra kết nối liên kết dữ liệu. Nó linh hoạt trong việc xử lý các kích cỡ khác nhau của các gói, phát hiện một liên kết ngược, lỗi cấu hình và chấm dứt liên kết.
- NCP được sử dụng để thiết lập và định cấu hình các giao thức lớp Mạng khác nhau. PPP cho phép sử dụng đồng thời nhiều giao thức lớp Mạng

#### Cấu trúc frame của gói tin PPP

![Alt](/thuctap/anh/Screenshot_105.png)
- FLAG : Có 1 byte với mẫu bit 01111110.
- ADDRESS : 1 byte được đặt thành 11111111 trong trường hợp phát sóng.
- CONTROL : 1 byte được đặt thành giá trị không đổi là 11000000.
- PROTOCOL : 1 hoặc 2 byte xác định loại dữ liệu có trong INFORMATION.
- INFORMATION :Mang dữ liệu từ lớp mạng. Độ dài tối đa là 1500 byte.
- FCS : Đây là một chuỗi kiểm tra khung 2 byte hoặc 4 byte để phát hiện lỗi. Mã tiêu chuẩn được sử dụng là CRC (mã dự phòng theo chu kỳ).

Nhìn vào hình trên ta phải hiểu rằng control và flag có giá trị bit không thay đổi
#### Quá trình thiết lập kết nối PPP

- Một phiên làm việc thông thường sử dụng PPP hoàn toàn tự động và không yêu cầu input của người dùng trong thời gian thực. Nó có bốn giai đoạn: Quá trình thiết lập kết nối PPP qua 4 bước: Thiết lập kết nối và thương lượng cấu hình; quyết định chất lượng kết nối; thương lượng cấu hình giao thức tầng mạng và kết thúc kết nối.
### NAT trong cisco
#### Định nghĩa về NAT
- NAT (Network Address Translation) là một công nghệ được sử dụng trong mạng máy tính để chuyển đổi địa chỉ IP của các thiết bị trong mạng nội bộ thành địa chỉ IP bên ngoài mạng. 
- NAT cho phép một mạng nội bộ sử dụng ít hoặc không có địa chỉ IP bên ngoài, và do đó giúp tăng cường an ninh mạng bằng cách ẩn danh địa chỉ IP thật sự của các thiết bị nội bộ. 
- NAT cũng cho phép chia sẻ kết nối internet với nhiều thiết bị trong mạng nội bộ thông qua việc chuyển đổi các địa chỉ IP cục bộ thành địa chỉ IP bên ngoài

#### Phân loại NAT
- Static NAT : Là loại nat mà 1 ip private tương đương với 1 ip public (one to one)
- Dynamic NAT : Là loại nat mà 1 dải 1 ip private tương đương với 1 dải ip public vẫn là one to one nhưng sau 1 thơi gian những ip nào không dùng sẽ tự động xóa đi và thay thế sao cho phù hợp và tiết kiệm nhất
- PAT :Là kỹ thuật nat mà nhiều ip private tương đương với 1 ip public
  - Kỹ thuật này không dựa vào ip mà dựa vào port để phân biệt session nòa đang làm việc để chuyển dữ đúng
  - Hãy nhìn vào bảng inside local và inside global ,nếu có 2 con ip sử dụng cùng 1 port là 1024 thì con ip sau sẽ tự động tăng port là 1025
  - Có tối đa 65355 port

![Alt](/thuctap/anh/Screenshot_106.png)

#### Cấu hình Static NAT
Các bước cần thực hiện để cấu hình static nat
- cáu hình chỉ định ip private nào chuyển đổi thành ip public nào

```
Router(config)#ip nat inside source static ip-private ip-public
```
- Cấu hình port nào nat inside

```
Router(config)#int f0/0
Router(config-if)#ip nat inside
```
- Cấu hình port nào là nat outside

```
Router(config)#int f0/2
Router(config-if)#ip nat outside 
```
- Để show bảng Nat 

```
Router#show ip nat translations
```

#### Cấu hình dynamic Nat(over load)
- thiết lập pool gồm các ip public sử dụng(sử dụng dải ip .2-.8)

```
Router(config)#ip nat pool test 103.102.20.2 103.102.20.8 netmask 255.255.255.0
```
- thiết lập list các ip private được phép ra ngoài: Cho phép dùng 7 ip private cùng lúc(do ta cấp có 7 ip public)

```
Router(config)#access-list 7 permit 10.10.10.0 0.0.0.255
```
- Thiết lập kết nối giữa chúng : cho 7 ip trong list được Nat ra tương ứng với pool có name là test

```
Router(config)#ip nat inside source list 7 pool test
```
- Định nghĩa các port in/out side

```
Router(config)#int f0/0
Router(config-if)#ip nat inside
Router(config)#int f0/2
Router(config-if)#ip nat outside 
```

#### Cấu hình PAT
- thiết lập list các ip private được phép ra ngoài: Cho phép dùng 10 ip private cùng lúc

```
Router(config)#access-list 10 permit 192.168.10.0 0.0.0.255
```
- thiết lập các ip private sẽ đi qua port nào (port này được gắn ip gì thì có nghĩa là list ip private vừa gắn đó sẽ sử dụng ip public đó)

```
Router(config)#ip nat inside source list 10 interface s0/0/1 overload
```
- Định nghĩa các port in/out side

```
Router(config)#int f0/0
Router(config-if)#ip nat inside
Router(config)#int f0/2
Router(config-if)#ip nat outside
```
#### Load balancing
- Khi tại một Router có 2 đường tới mạng đích thì ta có thể static route tới cùng 2 mạng đích này. Cụ thể là từ R1 muốn tới mạng 10.0.2.0 /24 thì có thể trỏ tới next hop là 10.0.12.2 /24 hoặc 10.0.21.2 /24, nghĩa là R1 có thể cấu hình 2 câu lệnh ip route tới cùng một mạng đích với IP next hop khác nhau.  
- Lúc này mọi dữ liệu từ R1 gửi tới mạng 10.0.2.0 /24 sẽ được cân bằng tải qua cả 2 hướng là f0/1 và f0/2. Ưu điểm của cơ chế cân bằng tải này là nếu một interface gặp sự cố thì các lưu lượng sẽ được đổ qua hướng còn lại

![Alt](/thuctap/anh/Screenshot_108.png)
-  Hoặc trong trường hợp từ R1 có 2 đường mạng 10.0.2.0 /24 thông qua 2 Router khác nhau

![Alt](/thuctap/anh/Screenshot_109.png)
- Khi R2 và R3 kết nối ra ngoài internet, nếu R1 muốn ra ngoài internet thì cần cấu hình 2 default route

![Alt](/thuctap/anh/Screenshot_110.png)

# Tài liệu tham khảo
https://viettelco.vn/cac-thanh-phan-linh-kien-co-ban-cua-server-vat-ly/

https://docs.google.com/document/d/1hDpw_DYmYLFAOZBukk5j8neCLjioeiGDOq66-s8UPWw/edit

https://www.youtube.com/watch?v=qCpTl6Hj0M4