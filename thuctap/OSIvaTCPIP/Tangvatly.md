Lớp vật lý là lớp đầu tiên của mô hình OSI ,nó nhận thông tin từ tầng data link chuyển thành tín hiệu điện và truyền qua đường truyền vật lý
## Một số môi trường hoạt động của tầng vật lý
### Hub 
Là thiết bị dùng để kết nối nhiều máy tính hay các thiết bị mạng khác lại với nhau. Hub được coi là một điểm kết nối chung cho các thiết bị trong mạng và thường được sử dụng để kết nối các phân đoạn của mạng LAN. Khi một gói dữ liệu đến một cổng, nó được sao chép và gửi tới tất cả các cổng khác.

![Alt](/thuctap/anh/Screenshot_1.png)

### Repeater
Là bộ khuếch đại giúp tín hiệu truyền xa và ổn định hơn

![Alt](/thuctap/anh/Screenshot_2.png)

### Converter
Là một thiết bị chuyển đổi dạng tín hiệu này sang dạng tín hiệu khác để phù hợp với môi trường truyền. Converter được biết đến nhiều trong mô hình mạng đó là Converter quang.

![Alt](/thuctap/anh/Screenshot_3.png)

### Network Adapter

Được gọi là bộ điều hợp mạng hay card mạng(NIC), chúng bao gồm card Ethernet, chip Wifi bên trong và bộ phát Wifi không dây bên ngoài. 

![Alt](/thuctap/anh/Screenshot_4.png)

### Host Bus Adapter (HBA)

Là bảng mạch hay bộ điều hợp mạch tích hợp kết nối hệ thống chủ với thiết bị lưu trữ hoặc mạng. HBA cũng cung cấp xử lý đầu vào/ra để giảm tải cho bộ xử lý của máy chủ khi lưu trữ và truy xuất dữ liệu, giúp cải thiện hiệu xuất tổng thể của máy chủ

![Alt](/thuctap/anh/Screenshot_5.png)

## Các chuẩn đấu nối

### 10Base2
Còn được gọi là cheapernet, thin Ethernet, thinnet và thinwire là một chuẩn của Ethernet có tốc độ băng thông là 10Mbps. “10” có nghĩa là tốc độ truyền 10Mbps, “2” có nghĩa là khoảng cách tối đa giữa hai trạm không có repeater ở giữa không vượt quá 200m

### 10BaseT (Cat3 và Cat5)
Là một chuẩn cáp xoắn đôi có tốc độ truyền dẫn 10Mbit/s, trong đó 10 tương ứng với tốc độ truyền tối đa 10 [Megabit] trên giây (Mb/s), BASE là viết gọn của [baseband], T là loại cáp xoắn đôi (Twisted Pairs)

### 100BaseTX
Là một chuẩn thông dụng của Fast Ethernet, hoạt động trên 2 đôi dây của cáp xoắn đôi Cat5.

### 1000BaseT
Là chuẩn Ethernet cho tốc độ truyền dẫn lên đến 1Gbps, để đạt được tốc độ truyền dẫn lên 1Gbps cần phải hoạt động trên 4 đôi dây, xoắn, yêu cầu của loại này phải sử dụng module SFP.

### 1000BaseLX
Là chuẩn Ethernet sử dụng cáp quang cho phép khoảng cách truyền dẫn lên tới 10km “LX” trong 1000BASE-LX là viết tắt của long wavelength, chỉ ra rằng phiên bản Gigabit Ethernet này được thiết kế để sử dụng với các đường truyền có bước sóng dài (1270–1355 nm) qua các đường cáp dài của hệ thống cáp quang.
### 1000BASE SX
Là một tiêu chuẩn Gigabit Ethernet cáp sợi quang sử dụng bước sóng 770 đến 860 nm, khoảng cách hoạt động từ 220m đến 550m phù hợp cho thiết kế mạng Lan trong các tòa nhà, văn phòng , trường học,...
##  Topology vật lý
### Mạng hình sao
Là một mô hình mạng gồm thiết bị làm trung tâm và các nút thông tin chịu sự điều khiển của trung tâm đó. Các nút ở đây có thể là máy trạm, các thiết bị đầu cuối hay các thiết bị khác trong mạng LAN. 
- Ưu điểm:
    - Khi có lỗi xảy ra ở một trạm nào đó thì cả hệ thống vẫn hoạt động bình thường
    - Tốc độ mạng khá nhanh
    - Cấu trúc mạng khá đơn giản giúp dễ dàng kiểm tra, sửa chữa khi gặp sự cố
    - Có thể thu hẹp hay mở rộng theo ý muốn của người dùng
- Nhược điểm:
    - Thiết bị trung tâm là thiết bị chính của cả hệ thống, nếu nó gặp sự cố thì 
    - tất cả các thiết bị khác không thể giao tiếp được với nhau
    - Khoảng cách kết nối hạn chế
    - Tốn kém chi phí dây mạng và thiết bị trung gian

### Bus Topology
Là kiểu kết nối mà tất cả các thiết bị như máy chủ máy trạm, các nút thông tin đều được liên kết với nhau trên một đường dây cáp chính để truyền dữ liệu. Các dữ liệu và tín hiệu truyền qua dây cáp đều đến được tất cả điểm đến.
- Ưu điểm: 
    - Dễ lắp đặt
    - Không bị giới hạn về độ dài dây cáp
- Hạn chế:
    - Khi có một trạm xảy ra lỗi, cần phải tạm dừng toàn bộ hệ thống để kiểm tra và khắc phục
    - Rất dễ gặp tình trạng tắc nghẽn khi dữ liệu được truyền với lưu lượng lớn.
### Mạng dạng vòng
Đây là kiểu Topology các thiết bị được kết nối thành vòng tròn khép kín thông qua dây cáp. Tín hiệu sẽ được truyền đi theo một chiều cố định. Tại một thời điểm, chỉ có một nút được truyền tin qua một nút khác.
- Ưu điểm
    - Dễ dàng mở rộng hệ thống mạng LAN ra xa hơn.
    - Tiếu kiệm được chiều dài dây cáp.
    - Tốc độ mạng nhanh hơn mạng Bus
- Hạn chế: Thiết bị được kết nối khép kín nên khi một thiết bị nào đó gặp sự cố thì hệ thống cũng sẽ ngừng hoạt động.
###  Mạng dạng lưới
Đây là kiểu topology mà trong đó một máy tính sẽ được liên kết với tất cả các máy còn lại trong hệ thống mà không cần phải thông qua Hub hay Switch.
- Ưu điểm: 
    - Các máy tính sẽ hoạt động độc lập, sẽ không bị ảnh hưởng khi các máy khác gặp sự cố.
    - Dễ dàng mở rộng với phạm vi lớn.
- Hạn chế:
    - Việc quản lý hệ thống sẽ khá phức tạp và gây tốn tài nguyên bộ nhớ và về việc xử lý của các máy trạm.
### Mạng phân cấp
Là dạng topology hình sao mở rộng. Các máy trong hệ thống được sắp xếp theo từng lớp tuỳ thuộc vào chức năng của chúng.
- Ưu điểm của mạng phân cấp là khả năng quản lý thiết bị tập trung, tăng khả năng bảo mật hệ thống.
- Nhược điểm là chi phí quản lý đắt vì phải cần nhiều bộ tập trung.
