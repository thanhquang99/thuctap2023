## Định tuyến là gì?
Định tuyến là quá trình xác định đường đi tốt nhất trên một mạng máy tính nhằm giúp gói tin tới được đích tuân theo thủ tục nhất định nào đó ,thông qua các nút trung gian của bộ định tuyến router.Thông tin về những con đường này có thể được cập nhật tự động từ các router khác hoặc là do người quản trị mạng chỉ định cho router
## Phân loại định tuyến
![Alt](/thuctap/anh/Screenshot_66.png)
- Định tuyến động :Việc xây dựng và duy trì trạng thái của bảng định tuyến được thực hiện tự động bởi router.
- định tuyến tĩnh :Việc xây dựng bảng định tuyến của router được thực hiện bằng tay bởi người quản trị
## Tìm hiểu chi tiết
### Định tuyến tĩnh
- Là 1 quá trình định tuyến, mà để thực hiện ta phải cấu hình bằng tay, từng đường đi nước bước, địa chỉ cụ thể cho Router.
- Default route là một dạng định tuyến tĩnh mặc định định tuyến này được sử dụng khi ta chưa cấu hình bất kì đường đi cụ thể nào
  - Default Route, khi Router nhận được bất kỳ gói tin nào có đích đến là mạng ngoài không nằm trong bảng định tuyến.
  - Default route được coi như có độ ưu tiên tháp nhất trong bảng định tuyến
### Định tuyến động
- Là 1 dạng định tuyến mà khi ta cấu hình ở dạng này, Router sẽ thực hiện định tuyến 1 cách tự động (Automatically) mà ta không cần phải chỉ ra từng đường đi như định tuyến tĩnh nữa.
- Định tuyến động có 2 dạng chính là Interior và Exterior

#### Interior
- được triển khai bên trong 1 khu vực đặc biệt gọi là Autonomous System (AS)
- Distance Vector :là thuật toán được sử dụng trong định tuyến động,Ta hiểu rằng distance vector hoạt động như sau.Mỗi một router sẽ có bảng định tuyến của riêng nó , các router hàng xóm sẽ trao đổi thông tin với router hàng xóm của mình để tìm ra con đường ngắn nhất đến đích.Nói nôm na rằng đi đến đâu thì hỏi đường đến đó. Điều này sinh ra một nhược điểm là nó chưa phải là đường đi ngắn nhất đến đích
- Link state : Link State không gửi bảng định tuyến của mình , mà chỉ gửi tình trạng của các đường link trong link state-database của mình đi cho các router khác, các router sẽ áp dụng giải thuật SPF (shortest path first - đường đi ngắn nhất ) , để tự xây dựng routing-table riêng cho mình . Khi đã xây dựng routing-table xong, Link State protocol sẽ không gửi update định kỳ mà chỉ gửi khi nào có một sự thay đổi trong mạng. Ta có thể hiểu rằng distance vector thì đi đến đâu hỏi đến đó còn link state sẽ xác định trước bản đồ quá trình đi rồi tính toán xem đâu là đường đi ngăn nhất để đi. Để làm được điều đó thì mỗi một đoạn đường đi nhỏ sẽ có một `metric` của nó được hiểu là giá trị của đường đi đó. Do router phải xử lý nhiều , nên chiếm nhiều bộ nhớ , tốc độ CPU chậm hơn nên tăng delay. – Link State khá khó cấu hình để chạy tốt 

#### Exterior 
- Là giao thức trao đổi thông tin giữa các AS khác nhau
- Dùng để kết nối với hệ thống bên ngoài AS

### Các giao thức được sử dụng rộng rãi
#### RIP(Routing Information Protocol)
##### Tổng quan về RIP
- Là 1 giao thức định tuyến theo kiểu distance vector (Không biết tuyến đường đi đến đích một cách cụ thể, chỉ biết đường đi đến router láng giềng)
- Sử dụng Hop count (đếm số router) làm metric cho việc chọn đường (có nhiều đường cùng đến 1 đích thì chọn đường có hop count ít nhất)
- Nếu hop count > 15 thì packet bị loại bỏ
- thời gian update: 30s (mặc định)
- AD : 120
##### RIP 2
- Là phiên bản cải tiến của RIPv1
- Là giao thức định tuyến dạng classless (có gửi thông tin subnet-mask qua cập nhật định tuyến)
- Hỗ trợ:
  - VLSM
 - Chứng thực trong các routing update
  - Cập nhật định tuyến dạng Multicast, sử dụng địa chỉ lớp D 224.0.0.9
  - Metric: hop-count

- Cấu hình RIP 2

```
R(config)#router rip
R(config-router)#version 2
R(config-router)#network network-number
```
Trong đó network-number là địa chỉ láng giềng
##### Chứng thực trong RIP 2

- Chứng thực trong định tuyến là cách thức bảo mật trong việc trao đổi thông tin định tuyến giữa các router.
- Các router phải vượt qua quá trình chứng thực này trước khi trao đổi định tuyến được thực hiện.
- RIPv2 hỗ trợ 2 kiểu định tuyến:
    - Plain text: Các router được cấu hình 1 khóa (password) và trao đổi chúng để so khớp. password được gửi dưới dạng không mã hoá.
    - MD5 :Password được mã hoá khi gửi đi (an toàn hơn).

```
R(config)#key chain <name>
R(config-keychain)#key <key-id>
R(config-keychain)#key-string <password>
R(config)#interface <interface>
R(config-if)#ip rip authentication key-chain <name>
```
Để cấu hình md 5 thì ta thêm dòng lệnh
```
ip rip authentication mode md5
```




