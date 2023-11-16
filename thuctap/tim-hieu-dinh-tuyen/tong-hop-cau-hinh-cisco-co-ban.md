- [Tổng hợp cấu hình cisco cơ bản](#tổng-hợp-cấu-hình-cisco-cơ-bản)
  - [Công nghệ Ethernet Lan](#công-nghệ-ethernet-lan)
    - [Mạng Lan là gì?](#mạng-lan-là-gì)
    - [Cách xác định địa chỉ Mac trong windows:](#cách-xác-định-địa-chỉ-mac-trong-windows)
    - [Phân tích quá trình trao đổi dữ liệu giữa các hệ thống trong mạng Lan](#phân-tích-quá-trình-trao-đổi-dữ-liệu-giữa-các-hệ-thống-trong-mạng-lan)
    - [Chuyển mạch ethernet switch :](#chuyển-mạch-ethernet-switch-)
    - [Các kiểu truyền thông](#các-kiểu-truyền-thông)
    - [Giao thức ARP :](#giao-thức-arp-)
    - [Cấu trúc địa chỉ MAC :](#cấu-trúc-địa-chỉ-mac-)
    - [Tiêu chuẩn công nghệ Ethernet Lan](#tiêu-chuẩn-công-nghệ-ethernet-lan)
    - [Cơ chế truyền half và full duplex](#cơ-chế-truyền-half-và-full-duplex)
    - [Các chuẩn carb dồng](#các-chuẩn-carb-dồng)
  - [Cấu hình Cisco](#cấu-hình-cisco)
    - [cách cấu hình thiết bị](#cách-cấu-hình-thiết-bị)
    - [Thực hành](#thực-hành)
      - [Đặt lại hostname](#đặt-lại-hostname)
      - [Đặt password enable và console](#đặt-password-enable-và-console)
      - [Mã hóa password để không hiện khi thực hiện câu lệnh show](#mã-hóa-password-để-không-hiện-khi-thực-hiện-câu-lệnh-show)
      - [Tính năng tự động đăng xuất Exec-Timeout trên kết nối Console:](#tính-năng-tự-động-đăng-xuất-exec-timeout-trên-kết-nối-console)
      - [Khai báo địa chỉ ip trên các cổng](#khai-báo-địa-chỉ-ip-trên-các-cổng)
      - [Tính năng chống trôi dòng lệnh : Khi ta đang cấu hình mà có thông báo thì sẽ bị ảnh hưởng và làm mất thẩm mỹ](#tính-năng-chống-trôi-dòng-lệnh--khi-ta-đang-cấu-hình-mà-có-thông-báo-thì-sẽ-bị-ảnh-hưởng-và-làm-mất-thẩm-mỹ)
      - [Không tự động phân giải tên miên:](#không-tự-động-phân-giải-tên-miên)
      - [Cấu hình Vlan :](#cấu-hình-vlan-)
      - [Cấu hình VTP](#cấu-hình-vtp)
      - [DOT 1Q Tunneling :](#dot-1q-tunneling-)
    - [STP](#stp)
      - [Etherchannel](#etherchannel)
  - [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Tổng hợp cấu hình cisco cơ bản
## Công nghệ Ethernet Lan
### Mạng Lan là gì?
Lan là một tập hợp các hệ thống mạng máy tính được kết nối nội bộ với nhau và được giới hạn trong 1 khu vực nhất định. Vlan là công nghệ được sinh ra để ảo hóa các mạng Lan ,nó cho phép từ 1 switch tạo thành nhiều mạng Lan ảo nhằm mục đích tiết kiệm chi phí về phần cứng , vì chẳng lẽ cứ mỗi mạng Lan ta phải dùng 1 switch riêng ư?
### Cách xác định địa chỉ Mac trong windows:
Địa chỉ Mac trên mỗi card mạng là duy nhất, ta có thể vào cmd của máy tính và gõ dòng lệnh ipconfig/all .Nó sẽ show cho tất cả các card mạn(cả thật và ảo)

![Alt](/thuctap/anh/Screenshot_73.png)

### Phân tích quá trình trao đổi dữ liệu giữa các hệ thống trong mạng Lan

![Alt](/thuctap/anh/Screenshot_74.png)

Ta có thể nhìn vào hình và phân tích: Từ PC1 muốn gửi gói tin sang PC2 thì sẽ bao gồm `data` và được gắn thêm header của các tầng trong mô hình OSI gồm  source ip ,destination ip , source MAC , Destination MAC

### Chuyển mạch ethernet switch :
  - Để biết tập tin sẽ gửi đến đâu thì cần phải có địa chỉ nguồn và đích, và bảng `Mac table` là bảng lưu lại địa chỉ MAC của đích ứng với từng port của switch, địa chỉ đó chỉ lưu được tầm 5p nếu không có phản hồi sẽ tự động bị xóa nhằm tiết kiệm dữ liệu
  - Ban đầu bảng Mac sẽ không có ,và khi ta muốn gửi tập tin đi thì sẽ gửi broadcast đẩy ra tất cả các cổng trừ nó ra,khi nào ip trùng thì sẽ gửi lại MAC của nó về và bổ xung vào bảng MAC
### Các kiểu truyền thông 
- Broadcast : là nhân bản tập tin và đẩy ra tất cả host cùng lớp mạng
- unicast : Là từ 1 máy gửi đến 1 máy trong cùng 1 lớp mạng
- Multicast: Là từ 1 máy gửi đến 1 nhóm máy trong cùng 1 lớp mạng
### Giao thức ARP : 
Ban đầu máy gửi sẽ không có địa chỉ MAC của máy nhận,vậy để có địa chỉ MAC của máy nhận thì nó sẽ gửi đi broadcast đến tất cả các cổng trừ nó để hỏi xem ai có địa chỉ IP này thì gửi địa chỉ MAC về đây
### Cấu trúc địa chỉ MAC :
 1 địa chỉ MAC sẽ gồm 48 bit trong đó chia ra 24 bit đầu để xác định hãng sản xuất,24 bit sau để định danh từng card mạng
  - 48 Bit này được biểu diễn thành các số hecxa, mỗi 4 bit tạo thành 1 số hecxa
  - Cấu trúc biểu diễn: thường được biểu diễn thành 2 số hecxa , cách nhau bới : hoặc - 

### Tiêu chuẩn công nghệ Ethernet Lan
  - IEEE 802.3: là cổng ethernet và có tốc độ là 10MB
  - IEEE 802.3u :Được làm từ carb đồng và có tốc độ 100MB
  - IEEE 802.3z : Được làm từ carb quang và có tốc độ lên đến 1GB
  - IEEE 802.3ab : Được làm từ carb đồng và có tốc độ 1GB
### Cơ chế truyền half và full duplex
- Cơ chế truyền `half duplex`: Là cơ chế truyền mà chỉ có 1 máy truyền trên sơ đồ mạng này
- Cơ chế truyền `full duplex`: Là cơ chế cho phép nhiều máy truyền trong sơ đồ mạng
- CSMA/CD : khi ta truyền ở chế độ `half duplex` thì các máy sẽ gửi tín hiệu xem có máy nào đang gửi không để tránh đụng độ,nhưng khi cả 2 máy cùng nhận đc đường truyền đang rảnh và gửi đi cùng lúc sẽ dẫn đến việc đụng độ thì CSMA/CD sẽ tạo ra độ trễ để các máy không thể cùng lúc gửi được do có timer nên thời gian sẽ cách nhau và không cùng thời điểm

### Các chuẩn carb dồng
- Chuẩn carb đồng : Carb đồng có 2 loại là có bọc chống nhiều và không bọc ,bọc chống nhiễu dùng trong các trường hợp từ trường ảnh hướng đến việc truyền dữ liệu.
- Chuẩn T-568B :Trắng cam - Cam - Trắng xanh lá - Xanh dương - Trắng xanh dương - Xanh lá - Trắng nâu - Nâu
- Chuẩn T-568A :Trắng xanh lá - Xanh lá - Trắng cam - Xanh dương - Trắng xanh dương - Cam - Trắng nâu - Nâu

![Alt](/thuctap/anh/Screenshot_75.png)

- Từ đây ta sinh ra 2 kiểu carb thẳng và carb chéo. Carb thẳng là 2 đầu cùng theo chuẩn A hoặc B còn carb chéo thừ là 1 đầu A 1 đầu B
- Cách phân biệt carb thằng và chéo: cùng nhóm ta dùng carb chéo và khác nhóm ta dùng carb thẳng .Nhưn bây giờ công nghệ tiên tiến ta có thể dùng carb thẳng mà có thể nối tất cả.
  - Nhóm 1 :switch ,hub
  - Nhóm 2: Còn lại 
## Cấu hình Cisco
### cách cấu hình thiết bị
- Để cấu hình thiết bị ta có thể cắm carb vào cổng `console` và 1 đầu vào máy tính của chúng ta ,máy tính có phần mềm để cấu hình như secureCRT, Putty, Hyper Terminal.
- Sisco có 3 bộ nhớ mà ta cần phải nhớ là `Ram`, `NVRam`, `flash`
  - `Ram`: lưu lại các dữ liệu mà thiết bị đang chạy một cách tạm thời,khi ngắt nguồn thì bộ nhớ sẽ bị xóa sạch
  - `NVRam`: Lưu lại dữ liệu mà kể cả khi ta tắt nguồn vẫn lưu
  - `flash` : Lưu lại hệ điều hành của thiết bị

- Ta cũng cần phải nhớ thêm 3 mode nữa là `#`, `config`, `config-if`
  - `#` là mode người dùng ta có thể hiểu như ta là người dùng muốn xem cái gì đó thì ở mode này
  - `config` là mode dùng để cấu hình
  - `config-if` là khi ta vào thẳng các interface để cấu hình

### Thực hành
#### Đặt lại hostname


```
Router(config)#hostname [name]
```


#### Đặt password enable và console

```
Router(config)#line console 0
Router(config-line)#password 123456
```

```
Router(config)#enable password 123456
```

#### Mã hóa password để không hiện khi thực hiện câu lệnh show

```
Router(config)#service password-encryption 
```

#### Tính năng tự động đăng xuất Exec-Timeout trên kết nối Console: 
Do có thể khi ta cấu hình xong mà quên không ngắt kết nối console với timer 1p30s

```
Router(config)#line console 0
Router(config-line)#exec-timeout 1 30
```

#### Khai báo địa chỉ ip trên các cổng

```
Router(config)#interface GigabitEthernet0/0/0
Router(config-if)#ip address 192.168.1.1 255.255.255.0
Router(config-if)#no shutdown 
```

ta cũng có thể cấu hình 1 nhóm các cổng bằng cách sau:

```
Router(config)#interface range gigabitEthernet 0/0/0-2
```

- Các cổng trên router cũng có thể xin ip tự động bằng dhcp

```
Router(config)#interface GigabitEthernet0/0/1
Router(config-if)#ip address dhcp
```

#### Tính năng chống trôi dòng lệnh : Khi ta đang cấu hình mà có thông báo thì sẽ bị ảnh hưởng và làm mất thẩm mỹ

```
Router(config)#line console 0
Router(config-line)#logging synchronous 
```

#### Không tự động phân giải tên miên: 
Khi ta không may gõ một vài chữ linh tinh thì cisco sẽ tự động hiểu rằng tự động phân giải tên miền ,quá trình này sẽ tốn rất nhiều thời gian ,để kết thúc quá trình đó thì ta có thể gõ`Ctrl+shift+6`,để tắt chế độ này ta có thể cấu hình

```
Router(config)#no ip domain-lookup 
```





#### Cấu hình Vlan : 
- tạo vlan
```
vlan 10 
```
- access port vào vlan
```
ỉnt f0/1
switchport mode access 
switchport access vlan 10
no sh
```
- Cấu hình trunk : Khi vlan khác switch muốn giao tiếp với nhau cần có 1 carb kết nối 2 vlan lại với nhau,mà khi tăng lên nhiều vlan thì cần phải có nhiều carb . Công nghệ trunk giúp chúng ta gộp tất cả các dây lại thành 1 dây duy nhất mà khi chuyển tin đi nó chỉ cần gắn vlan id vào để nhận biết.

```
ỉnt f0/2
switchport mode trunk
no sh

```

#### Cấu hình VTP 
- VTP là giao thức độc quyên của cisco nó giúp ta đồng bộ các vlan trên các switch khi thêm sửa xóa . Có 3 loại VTP :

||VTP server|VTP client|VTP transparent|
|--|--------|----------|---------------|
|Tạo , xóa và cấu hình Vlan|Có|Không|Chỉ trên local|
|Đồng bộ|Có|Có|không|
|Forward|Có|Có|Có|


- Trong VTP thì `revision number` là quan trọng nhất, mỗi khi database thay đổi thì chỉ số `revision number` lại tăng lên ,các switch lấy chỉ số này để thực hiện dồng bộ, cái có chỉ số thấp sẽ đồng bộ theo cái cao.Chính vì như thế nên khi ta thêm 1 switch mới mà có chỉ số này cao vào mạng sẽ rất nguy hiểm,nên tính năng này ít khi sử dụng ,ta thường cấu hình 1 file rồi add vào các switch là đc
server
```
Switch(config)#vtp domain thanhquang
Switch(config)#vtp mode server 
Switch(config)#vtp password 123456
```
Client
```
Switch(config)#vtp domain thanhquang
Switch(config)#vtp mode client 
Switch(config)#vtp password 123456
```
transparent
```
Switch(config)#vtp domain thanhquang
Switch(config)#vtp mode transparent 
Switch(config)#vtp password 123456
```
Ta có thể xem chỉ số revision bằng lệnh `show vtp status `
 ![Alt](/thuctap/anh/Screenshot_76.png)
Ta thử tạo vlan 10 và 20 trên server và kiểm tra trên client và trasparent
- Trên server:

 ![Alt](/thuctap/anh/Screenshot_77.png)
- Trên server:

 ![Alt](/thuctap/anh/Screenshot_78.png)
- Trên trasparent

 ![Alt](/thuctap/anh/Screenshot_79.png)

- Vậy là ta đã thấy chỉ trên client là thay đổi còn transparent là không
#### DOT 1Q Tunneling :
  - IEEE dot1q tunneling là một cơ chế cho phép mang nhiều VLAN của khách hàng trong một tunnel.Khi khách hàng có 2 con router và ở cách xa nhau và được kết nối trunking đến nhà mạng, cơ chế này sẽ cho phép 2 con router giao tiếp với nhau như là cắm 2 con trực tiếp với nhau vậy, nó sẽ không mang thông tin nhà mạng vào.

- Lưu ý : Do các switch giả lập măc định encapsulation là dot1Q nên ta không cần cấu hình thêm .
### STP 
- Spanning-tree là giao thức chạy trên thiết bị switches giúp chúng ra giải quyết vấn đề loop ở layer 2
- Tính năng này luôn tự động bật trên giả lập
- Ta có thể hiểu như này khi sw1 nhận được broadcast thì nó sẽ gửi ra tất cả các cổng đang bật(trừ chính nó) và đến với sw2 và sw3 nó lại gửi bản tin broad cast đến tất cả các cổng đang bật(Trừ chính nó) thì nó sẽ tạo ra vòng lặp vô hạn từ Sw1 đến SW2 rồi đến SW3 rồi lại về SW1
- Để tránh tình trạng này thì STP sẽ đóng 1 port trên 1 switch lại. Để tìm ra port cần đóng thì nó tuân thủ theo quy tắc
  - SW sẽ có MAC và priority (Mặc định là 32768,có thể thay đổi bằng tay )
  - Do priority mặc định luôn bằng nhau nên nó sẽ xét MAC thấp nhất làm root ,các cổng nối vào root được giữ nguyên không khóa ,cổng nối  
các non-root thì cổng nào có Mac cao hơn sẽ bị khóa 

 ![Alt](/thuctap/anh/Screenshot_81.png)
 - Các trạng thái port phải trải qua trong giao thức spanning-tree

 ![Alt](/thuctap/anh/Screenshot_82.png)
  - Port trong chế độ listening 15s, trong giai đoạn này nó sẽ nhận và gửi BPDU, nhưng không học mac address hay truyền dữ liệu
  - Port trong chế độ learning 15s, trong giai đoạn này nó sẽ nhận và gửi BPDU, học mac address nhưng không truyền dữ liệu
  - Sau đó port chuyển sang chế độ forwarding là có thể truyền được dữ liệu

- Port fast :Thường được cấu hình trên các port nối với thiết bị cuối là pc, phone. Port fast giúp cổng bỏ qua trạng thái listening và learning, port chuyển qua thẳng chế độ forwarding chính vì lý do này nên chỉ cấu hình chức năng port fast ở những cổng chắc chắn là cắm tới pc, phone các thiết bị cuối.
- Uplink fast :Thường được cấu hình trên các switch biên access nối trực tiếp với các end devices. Khi cấu hình uplink fast port block sẽ lên luôn không làm giám đoạn mạng, không cần chờ đợi 15s chế độ listening, 15s learning
- Backbone fast :Chức năng này thì cấu hình trên switch nào cũng được. Khi sử dụng chức năng trên switch thì sẽ bỏ qua 20s max age trong quá trình spanning tree

#### Etherchannel
- Là kỹ thuật 2 hay nhiều đường truyền kết nối vật lý thành 1 đường truyền kết nối logic và chúng thường được thực hiện trên switch  ,có thể nói nó có tác dụng nâng cao băng thông .Ta hiểu như thế này nhé, cổng f0/0(SW1) kết nối với cổng f0/0(SW2) thì tốc dộ là 100 mps thì khi ta dùng ehterchannel biến nhiều link thành 1 link logic nó sẽ có tốc độ độ cao gấp nhiều lần
- Công nghệ EtherChannel có thể bó từ 2 đến 8 link FE, GE, 10GE thành 1 link logical. Khi đó ta đối xử với nó như là một cổng kết nối duy nhất
- Để cấu hình ẹtherchannel thì các Switch phải đều phải hỗ trợ kỹ thuật EtherChannel và phải được cấu hình EtherChannel đồng nhất giữa các Port kết nối với nhau và Các Port kết nối EtherChannel giữa 2 Switch phải tương đồng với nhau
- Phân loại etherchannel
  - LACP (Link Aggregation Control Protocol): Là giao thức giúp các hãng không đồng nhất kết hợp với nhau

||Active(chủ động)|passive(bị động)|
|---|----|----|
|Active(chủ động)|yes|yes|
|passive(bị động)|yes|no|
  - PAgP (Port Aggregation Protocol):Là giao thức độc quyền của hãng cisco
  - Static: Cấu hình thủ công


## Tài liệu tham khảo 
https://docs.google.com/spreadsheets/d/1KvkRu6_ODhJpgE8sKbHGL2zQRAj7yvF8/edit#gid=1761363795