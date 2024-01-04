- [Tìm hiểu trước về các khái niệm](#tìm-hiểu-trước-về-các-khái-niệm)
  - [STP](#stp)
  - [VTP](#vtp)
- [Định tuyến là gì?](#định-tuyến-là-gì)
- [Phân loại định tuyến](#phân-loại-định-tuyến)
- [Tìm hiểu chi tiết](#tìm-hiểu-chi-tiết)
  - [Định tuyến tĩnh](#định-tuyến-tĩnh)
  - [Định tuyến động](#định-tuyến-động)
    - [Interior](#interior)
    - [Exterior](#exterior)
  - [Các giao thức được sử dụng rộng rãi](#các-giao-thức-được-sử-dụng-rộng-rãi)
    - [RIP(Routing Information Protocol)](#riprouting-information-protocol)
      - [Tổng quan về RIP](#tổng-quan-về-rip)
      - [RIP 2](#rip-2)
      - [Chứng thực trong RIP 2](#chứng-thực-trong-rip-2)
    - [EIGRP(Enhanced Interior Gateway Routing Protocol)](#eigrpenhanced-interior-gateway-routing-protocol)
      - [Tổng quan](#tổng-quan)
    - [Cách thức hoạt động](#cách-thức-hoạt-động)
    - [Cấu hình EIGRP](#cấu-hình-eigrp)
    - [Chứng thực trong EIGRP](#chứng-thực-trong-eigrp)
  - [OSPF](#ospf)
    - [Tổng quan về OSPF](#tổng-quan-về-ospf)
    - [Quá trình xây dựng bảng định tuyến (hoạt động của OSPF)](#quá-trình-xây-dựng-bảng-định-tuyến-hoạt-động-của-ospf)
    - [Cấu hình OSPF](#cấu-hình-ospf)
    - [Chứng thực trong OSPF:](#chứng-thực-trong-ospf)
  - [IS-IS (Intermediate System to Intermediate System)](#is-is-intermediate-system-to-intermediate-system)
    - [Tổng quan về ISIS](#tổng-quan-về-isis)
    - [Giao thức con](#giao-thức-con)
    - [Packet Types](#packet-types)
    - [IS-IS Neighbors](#is-is-neighbors)
    - [Phân cấp](#phân-cấp)
    - [Cấu hình cơ bản](#cấu-hình-cơ-bản)
  - [Một vài câu lệnh hay](#một-vài-câu-lệnh-hay)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
## Tìm hiểu trước về các khái niệm
### STP
Trước khi tìm hiểu về giao thức chúng ta cần phải biết về `loop`
- 127.0.0.1 được coi là địa chỉ loopback trên host . Loopback là một dạng tín hiệu mà khi ta gửi đi sẽ có tín hiệu phản hồi lại ,là cách tốt nhất để xác định thiết bị trong mạng ,dùng để chuẩn đoán và khắc phục sự cố trong mạng

![Alt](/thuctap/anh/Screenshot_71.png)

Nhìn vào hình ta có thể hiểu như này, khi PC gửi 1 gói tin quảng bá ra S1 thì S1 sẽ gửi gói tin quảng bá ra tất cả các cổng và khi S2 nhận được nó cũng sẽ gửi gói tin quảng bá ra tất cả các cổng,nhưng vấn đề ở đây đã sảy ra lag S1 gửi đến S2 rồi S2 lại gửi đến S1 thì sẽ tạo ra các vòng lặp vô hạn. Từ đây ta có cách giải quyết bằng địa chỉ loopback là xác định địa chỉ loopback của các thiết bị trong mạng vì mỗi thiết bị trong mạng có địa chỉ loopback là duy nhất. Khi xác định được rồi nó sẽ khóa cổng G0/2 ở S3 để chống vong lặp vô hạn đó. Trong Cisco có 1 giao là STP(Spanning Tree Protocol) sẽ giúp chúng ta làm điều đó.
### VTP
VTP viết tắt của từ VLAN Trunking Protocol là giao thức độc quyền của Cisco hoạt động ở lớp 2 của mô hình OSI. VTP giúp cho việc cấu hình VLAN luôn đồng nhất khi thêm, xóa, sửa thông tin về VLAN trong một hệ thống mạng. VTP được thiết lập để giải quyết các vấn đề nằm bên trong hoạt động của môi trường mạng VLAN.


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

![Alt](/thuctap/anh/Screenshot_68.png)

Trước khi đi vào ta cần tìm hiểu trước về matric đã
  - Matric là giá trị của đường đi 
  - FD(Feasiable distance): Là khoảng cách khả thi ví dụ từ RE đến network mà qua router C thì FD=20
  - AD(Advertised distance ): khoảng cách quảng cáo,Ví dụ từ từ RB đến network thì AD=10

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
#### EIGRP(Enhanced Interior Gateway Routing Protocol)
##### Tổng quan
- Là giao thức định tuyến do Cisco tạo ra và chỉ hoạt động trên thiết bị của cisco
- Là một giao thức định tuyến vừa mang đặc điểm của distance vector và mang đặc điểm của link-state
- Cách tính metric 

![Alt](/thuctap/anh/Screenshot_67.png)

#### Cách thức hoạt động 
- Các router tìm kiếm các láng giềng của nó và lưu giữ trong neighbor table.
- Mỗi router sẽ trao đổi các thông tin về cấu trúc mạng với các láng giềng của nó , lưu trữ vào cơ sở dữ liệu về cấu trúc mạng (topology table)
- Router chạy thuật toán DUAL với cơ sở dữ liệu đã thu thập được ở bước trên để tính toán tìm ra đường đi tốt nhật đến mỗi một mạng trong cơ sở dữ liệu
- Router đặt các đường đi tốt nhất đến mỗi mạng đích vào bảng định tuyến.
- Trong EIGRP có hai tuyến ta cần quan tâm là “successor route” và “feasible successor route”
  - Successor route:
Là tuyến đường đi chính được sử dụng để chuyển dữ liệu đến đích
Được lưu trong bảng định tuyến.
EIGRP cho phép chia tải tối đa trên 16 đường (mặc định là 4 đường) đến mỗi mạng đích.
  - Feasible successor route:
Là đường đi dự phòng cho đường đi chính
Được lưu trong bảng cấu trúc mạng (topology table).
- EIGRP chống "routing loop"
  - “Routing loop” là một trở ngại rất lớn trong các giao thức định tuyến dạng “distance vector”.
  - Các giao thức định tuyến dạng “link-state” vượt qua vấn đề này bằng cách mỗi router đều nắm giữ toàn bộ cấu trúc mạng.
  - Trong giao thức EIGRP, khi tuyến đường đi chính gặp sự cố, router có thể kịp thời đặt đường đi dự phòng vào bảng định tuyến đóng vai trò như đường đi chính.
  - Trường hợp không có đường đi dự phòng, sử dụng thuật toán DUAL cho phép router gửi các yêu cầu và tính toán lại các đường đi đến đích.

#### Cấu hình EIGRP
```
Router(config)#router eigrp <autonomous-system>
Router(config-router)#network <network-number>
Router(config-router)#no auto-summary
```
Trong đó: 
- autonomous-system: có giá trị từ 1 đến 65535, giá trị này phải giống nhau ở tất cả các router trong hệ thống chạy EIGRP
- network-number là địa chỉ cổng theo đúng lớp mạng của nó.
#### Chứng thực trong EIGRP
- Chỉ hỗ trợ MD5

```
R(config)#key chain <keychain>
R(config-keychain)#key <key-id>
R(config-keychain-key)#key-string <password>

R(config)#interface <interface>
R(config-if)#ip authentication mode eigrp <AS> md5
R(config-if)#ip authentication key-chain eigrp <AS> <keychain>
```
### OSPF
#### Tổng quan về OSPF
- OSPF(Open Shortest Path First):Định tuyến dạng link-state
- Sử dụng thuật toán Dijkstra Shortest Path First(SPF) để xây dựng bảng định tuyến.
- Ưu điểm:
  - Hội tụ nhanh
  - hỗ trợ được mạng có kích thước lớn
  - Định tuyến dạng classless nên hỗ trợ VLSM và mạng không liên tục.
  - Sử dụng địa chỉ Multicast 224.0.0.5 và 224.0.0.6 (DR và BDR router) để gửi các thông điệp hello và update.

- Sử dụng area để giảm yêu cầu về CPU, memory của OSPF router và lưu lượng định tuyến.
- Hỗ trợ chứng thực Plain text và MD5.
#### Quá trình xây dựng bảng định tuyến (hoạt động của OSPF)
- Bước 1: Bầu router ID :
  - Khi bật OSPF các router bầu 1 giá trị router id để định danh duy nhất cho nó trong 1 vùng OSPF
  - Nó có địa chỉ giống như 1 địa chỉ IP :`1.1.1.1`
  - Nó sẽ tự động so sánh ai có IP cao nhất sẽ làm routẻr ID ,ưu tiêm loopback  làm router ID


- Bước 2:Thiết lập láng giềng
  - Các router sẽ bắt đầu gửi các gói tin hello để xác định các neighbor của nó
  - Các thông số có trong gói tin hello:
  - Aria ID : Khi 1 con router chạy 0SPF thì nó phải ghi nhớ tất cả bản đồ mạng cảu các con router khác nên ta chia ra các vùng nhỏ nhằm mục đích giảm lưu trữ và chỉ cần 1 con router giao giữa các aria phải nhớ toàn bộ của các vùng giao nhau thôi
  - IP subnet: nó phải cung ip subnet mask
  - Hello timer - dead timer : 10s -40s
  - Authurtication :Xác thực trên OSPF để khi có 1 con router lạ cắm vào mạng cần phải thiết lập quá trình tham gia
  - Stub: Vùng đặc biệt như 1 ngõ cụt (thường không được bật)
- Bước 3 : Xây dựng bảng LSDB

Khi các con router có rất nhiều láng giềng thì không thể con nào cũng gủi định tuyến cho nhau đc ,cần phải giamr thiểu quá trình này xuống nên ta cần bầu lớp truỏng và lớp phó để quản lý,DR là lớp trưởng , BDR là lớp phó, DR other là thành viên

  - DR :gửi cho BDR và DR other
  - BDR:gửi cho DR và DR other 
  - DR other : chỉ gửi thông tin cho DR và BDR thông qua 224.0.0.6
- Bước 4 :Thiết lập bảng định tuyến: Xây dựng bảng định tuyến bằng metric dựa vào bandwith , mỗi 1 công ethernet hay gigabit hay fastethernet sẽ có metric khác nhau, từ đó tìm ra đường đi ngắn nhất. OSPF sử dụng thuật toán Shortest Path First (Dijkstra) để xây dựng và tính toán đường đi ngắn nhất tới mạng đích

#### Cấu hình OSPF
```
R(config)# router ospf <process-id>
R(config-router)#network <address> <wildcard-mask> area <area-id>

```
Trong đó:
- Process-id: chỉ số tiến trình của OSPF (giá trị từ 1-65535)
- Address: địa chỉ cổng tham gia định tuyến
- Wildcard mask: điều kiện kiểm tra giữa địa chỉ cầu hình trong address và địa chỉ các cổng trên router, tương ứng bít 0-phải so khớp, bit 1- không cần kiểm tra.
- Area-id: vùng mà cổng tương ứng thuộc về trong miền OSPF

####  Chứng thực trong OSPF:
- Plain text:
```
R(config)#interface <interface>
R(config-if)#ip ospf authentication
R(config-if)#ip ospf authentication-key <password>

```
- MD5
```
R(config)#interface <interface>
R(config-if)#ip ospf authentication message-digest
R(config-if)#ip ospf messages-digest-key 1 md5 <password>
```

### IS-IS (Intermediate System to Intermediate System)
#### Tổng quan về ISIS
  - Được sử dụng để phân phối thông tin định tuyến xuyên suốt 1 Autonomous System (AS là một mạng hoặc một tập hợp các mạng được quản lý và giám sát bởi một tổ chức ) trong mạng IP 
  - là giao thức định tuyến dạng link-state, có nghĩa là các bộ định tuyến trao đổi thông tin cấu trúc liên kết(topology) với các hàng xóm gần nhất của chúng. Thông tin về topology tràn ngập khắp AS, do đó mọi bộ định tuyến trong AS đều có một hình ảnh hoàn chỉnh về topology của AS.
  - Sử dụng thuật toán Dijkstra để tính toán đường đi tốt nhất qua mạng.
  - Sử dụng gói tin Hello đế thiết lập Adjacencie (tính gần kề) và LSP đế trao đổi thông tin bảng định tuyến (Link-state information)
  - Chỉ gửi bản cập nhật khi có sự thay đổi với 1 trong các liên kết của nó.
  - Hội tụ nhanh (Sự hội tụ của mạng là trạng thái mà bảng định tuyến của các Router nhất quán hay router có thông tin đầy đủ và chính xác về mạng)

  - Là giao thức classless nên hỗ trợ VLSM.
  - Có Administrative distance (AD) là 115
  - Metric: sử dụng cost
  - không giới hạn bước nhảy (no hop-count limit)
  - Xây dựng và duy trì 3 table riêng biệt:
    - Một neighbor table: Chứa danh sách tất cả các router lân cận
    - Một topology table: Chứa danh sách tất cả các tuyến đường có thể đến tất cả các mạng trong 1 khu vực.
    - Một routing table: Chứa tuyến đường tốt nhất cho mỗi mạng đã biết.
#### Giao thức con
- ISIS có 3 lớp giao thức con đảm nhận vai trò riêng biệt
  - CLNP (Connectionless Network Protocol) - đóng vai trò là giao thức lớp 3 cho IS-IS
  - ES-IS (End System -to- Intermediate System) - được sử dụng để định tuyến giữa các host và router.
  - IS-IS (Intermediate System -to- Intermediate System) - được sử dụng để định tuyến giữa các router
#### Packet Types
- IS-IS defines 2 loại network devices:
  - ES (End System) - xác định host cuối.
  - IS (Intermediate System) - xác định router lớp 3.

- ISIS cũng xác định 4 loại gói:
  - Hello
  - LSP
  - CSNP
  - PSNP

- Hello packets :Trao đổi các hello packet để phát hiện ra hàng xóm. Có 3 loại:
  - IIH(IS-IS Hello) - được trao đổi giữa các router (hoặc IS) để tạo thành neighbor adjacencies.
  - ESH(ES Hello)- Được gửi từ ES để discover a vector
  - ISH (IS Hello) - được gửi từ IS để thông báo về sự hiện diện của nó cho ES.

- LSP: Viết tắt của Link state packet.Được sử dụng để chia sẻ thông tin topology giữa các router.

- CSNP: Viết tắt của Complete Sequence Number PDU.Là 1 bản cập nhật chứa CSDL link state đầy đủ (full).CSDL được làm mới sau 15 phút

- PSNP:Viết tắt của Partial Sequence Number PDU, Được sử dụng bởi các router IS-IS để yêu cầu và xác nhận (acknowledge) update link state.

#### IS-IS Neighbors
- Các router IS-IS hình thành các mối quan hệ láng giềng, được gọi là Adjacencies, bằng cách trao đổi các gói Hello (Thường được gọi là IS-IS Hello hoặc IIH).
- Các gói Hello được gửi đi sau mỗi 10s, bất kể media type. 
- Chỉ sau khi hình thành láng giềng thì các router mới có thể chia sẻ thông tin routing.

- IS-IS hỗ trợ 3 IIH packet formats:
  - 1 cho các liên kết point-to-point (điểm -điểm)
  - 2 cho các liên kết broadcast (hoặc LAN) (Level-1 và Level-2 broadcast Hellos)

- Có 2 loại Adjacencies:
  - Level 1 Adjacency - để định tuyến trong 1 khu vực (area) (định tuyến nội bộ - intra-area routing)
  - Level 2 adjacency - để định tuyến giữa các khu vực 

#### Phân cấp
S-IS phân cấp 3 loại router:
- Level-1 Router : Được chứ trong 1 area duy nhất, với 1 topology table chỉ giới hạn trong area local đó (Được gọi là Level-1 Database)
- Level-2 Router : a backbone router (router xương sống) định tuyến các area với nhau và xây dựng Level-2 Database.
- Level-1-2 Router: Tương tự như an area border router (Bộ định tuyến biên giới area), và đồng thời xây dựng Level-1 và Level-2 Database.


Các Level-1 Router không bao giờ tạo thành các vùng gián tiếp với các Level-2 Router

Các hàng xóm xây dựng bảng cấu trúc liên kết bằng cách chia sẻ LSP (Link-state Packets) tuỳ thuộc vào type of Adjacency (loại kề):
- Các Router level-1 chia sẻ LSP level-1 và xây dựng 1 topology table level-1 khu vực của nó.
- Nếu có gói dành cho local, nó định tuyến đến System-ID bằng cách sử dụng local topology table (Level-1 Database)
- Nếu có gói tin dành cho 1 khu vực từ xa(remote area), nó sẽ chuyển tiếp gói đến router Level-1-2 gần nhất.
- Level-1-2 router đặt 1 bít đính kèm ATT (Attach bit) vào trong LSP level-1 của chúng, thông báo cho các Router level-1 khác rằng gói tin được gắn vào khu vực khác.

- Các router Level-2 chia sẻ LSP Level 2 và xây dựng topology table level-2 chứa danh sách các area(khu vực) có thể truy cập trên miền IS-IS.
- Các Router level-1-2 chia sẻ cả LSP cấp 1 , cấp 2 và duy trì các topology cấp 1 và cấp 2 riêng biệt.

- Các tuyến đường Level-1 luôn được ưu tiên hơn các tuyến level-2 (xuất phát từ khu vực khác).

- Các router IS-IS sẽ làm mới Link-state topology table sau mỗi 15m (thay vì 30 minutes như OSPF).


#### Cấu hình cơ bản
Truy cập vào mode isis:
```
Router(config)# router isis 
```
Cấu hình với địa chỉ CLNP:
```
Router(config)# router isis
Router(config-router)# net 49.0001.1921.6800.5005.00
```
Để cấu hình router-type cho all interface (default là level-1-2):
```
Router(config)# router isis
Router(config-router)# is-type level-1
Router(config-router)# is-type level-1-2
Router(config-router)# is-type level-2 
```
Enable is-is trên interface:
```
Router(config)# interface fa0/0
Router(config-if)# ip router isis 
```
Điều chỉnh mức độ ưu tiên (default là 64) của interface, tăng khả năng router sẽ được chọn là DIS:
```
Router(config)# interface e0/0
Router(config-if)# isis priority 100 
```
Để cấu hình xác thực trên interface:
```
Router(config)# interface fa0/0
Router(config-if)# isis password MYPASSWORD level-1
Router(config-if)# isis password MYPASSWORD2 level-2
```
Để cấu hình xác thực cho toàn bộ area:
```
Router(config)# router isis
Router(config-router)# area-password MYPASSWORD

```

### Một vài câu lệnh hay
- `ping` dùng để xem 2 lớp mạng hay 2 máy tính có thông nhau ko gồm 2 quá trình gửi đi và gửi về
- `tracert` dùng để xem quá trình truyền gói tin đi qua những địa chỉ nào

![Alt](/thuctap/anh/Screenshot_72.png)
## Tài liệu tham khảo
https://www.youtube.com/watch?v=g9U9-bpXV30&list=PLnaGQB5hLTI6Y20FjqCsTO63efmE0_zZJ

https://docs.google.com/document/d/1C1mkI4JabSQbQqNjUJyeSL9oJJLpRhI6L0fukaMbSEo/edit#heading=h.we3fcjb5u5te

https://www.youtube.com/watch?v=ooVUeO_WCqw