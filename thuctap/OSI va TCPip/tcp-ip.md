# Tìm hiểu về mô hình OSI và TCP/IP
## Mô hình OSI
MÔ hình OSI(Open systems Interconnection) là mô hình tham chiếu kết nối hệ thống mở. Nó được chia làm 7 tầng để ta tham chiếu các quá trình kết nối truyền thông và giao thức mạng giữa các máy tính

### Mô hình OSI sẽ gồm 7 tầng :
#### 1.Application: 
- Cung cấp giao diện sử dụng cho người dùng (như chorme,facebook,...)
- Thực hiện chức năng chuyển file , trong đó giải quyết các vấn đề như không tương thích cách đặt tên
- Data unit: data
- Giao thức nổi tiếng ở tầng ứng dụng
    - HTTP và HTTPS(có bảo mật) :
    - E mail protoco : SMTP(gửi mail), Pop(tải mail về) , Imap(Chỉ xem mail,không tải)
    - DNS :Chuyển đổi IP thành tên miền
    - DHCP : cấp phát địa chỉ ip động
    - FTP(file transfer protocol): dowload hoặc upload file
    - SMB (server message block ): Chia sẻ file

#### 2.Presentation: 
- Giải quyết vấn đề liên quan đến cú pháp ,ngữ nghĩa của thông tin như chuyển đổi thông tin theo một chuẩn nào đó được 2 bên sử dụng (mã ASCII - EBCDIC)
- data unit :data
- Nén, giãn dữ liệu để giản số bit truyền trên mạng
- Mã hóa dữ liệu để thực hiện quyền truy cập
- Các giao thức tiêu biểu tầng Presentation sử dụng :
    - AFP(apple filing protocol): đây là giao thức độc quyền của hệ điều hành macOS ,nó kiểm soát tệp mạng và cho phép máy Mac giao tiếp qua mạng cục bộ
    - LPP (lightweigt presentation protocol):giao thức trình bày nhẹ là giao thức được sử dụng để cung cấp dịch vụ trình bày ISO trên dầu các ngăn xếp giao thức TCP/IP
    - NCP (Netware core protocol) :là giao thức mạng được sử dungj để truy cập các tệp in, thư mục, đồng bộ hóa,nhắn tin ,thực thi các lệnh từ xa và các chức năng dịch vụ khác.
    - NDR(Network data representation) : biểu diễn dữ liệu mạng về cơ bản là về việc triển khai mô hình OSI . Nó định nghĩa hoặc cung cấp các kiểu dữ liệu nguyên thủy khác nhau, kiểu dữ liệu được xây dựng và một số kiểu biểu diễn dữ liệu
    - XDR (external data representation): Cho phép truyền dữ liệu giữa các loại hệ thống máy tính .Chuyển đổi từ biểu diễn cục bộ sang XDR được gọi là mã hóa . Chuyển đổi từ XDR sang biểu diễn cục bộ được gọi là giải mã. XDR được thực hiện như một thư viện phần mềm gồm các chức năng có thể di động giữa các hệ điều hành khác nhau và cũng độc lập với lớp truyền tải.
    - SSL (security socket layer): Giao thức lớp cổng bảo mật cung cấp lớp bảo mật dữ liệu đang được chuyển giữa trình duyệt web và máy chủ
    điều này đảm bảo rằng tất cả dữ liệu truyền tới chúng vẫn ở chế độ riêng tư.Giao thức SSL gồm 2 lớp con
    + SSL record :Xác định các định dạng dùng để truyền dữ liệu
    + SSL handshake :được gọi là giao thức bắt tay. sử dụng SSL record protocol để trao đổi một số thông tin giữa server và client vào lần đầu tiên thiết lập kết nối SSL
#### 3.Session: 
- Tầng này cho phép người sử dụng trên các máy khác nhau thiết lập ,duy trì, hủy bỏ ,đồng bộ phiên truyền thông giữa họ
- data unit : data
- Quản lý token : Cơ chế thẻ bài được phiên cung cấp tránh hiện tượng tranh chấp đường truyền trên mạng
- Tạo ra các thủ tục để kiểm tra, sau đó là hoãn, khởi động lại và kết thúc
- Thực hiện đồng bộ : Thực hiện với các dữ liệu lớn bằng cách thêm vào các thông tin kiểm tra sửa lỗi.
- Chịu trách nhiệm quản lý mã thông báo, qua đó nó ngăn hai người dùng truy cập đồng thời hoặc cố gắng thực hiện cùng một hoạt động quan trọng.
- Các giao thức tiêu biểu tầng Session sử dụng : 
    - Netbios (Network Basic Input / Output System) :Là một giao thức, công nghệ nối mạng. Nó được thiết kế trong môi trường mạng LAN để chia sẻ tài nguyên (như dùng chung các file, Folder, máy in…). Thông thường một mạng dùng giao thức Netbios thường là Netbios Datagram Service (Port 138) hoặc Netbios Session Service (Port 139) hoặc cả 2.Do đặc tính được thiết kế để dùng trong mạng LAN để chia sẻ tài nguyên nên nên tính bảo mật của Netbios rất thấp.
    -  RPC (Remote Procedure Call) :là một mô hình kỹ thuật mạng hay còn được biết đến là cơ chế giao tiếp giữa hai tiến trình.Đây là một loại giao thức yêu cầu phản hồi, có thể dễ dàng được giải thích sử dụng mô hình truyền thông máy khách/máy chủ. Quá trình gọi một được gọi là “máy khách” và quá trình trả lời lại yêu cầu này được gọi là “máy chủ”
    - NFS (Network File System): là một trong những phương pháp phổ biến cho phép người dùng xem và chia sẻ dữ liệu trên các hệ thống vật lý.NFS cung cấp khả năng truy cập tới hệ thống file trên một máy khách được chia sẻ thông qua một mạng máy tính tương tự như việc truy cập trực tiếp trên ổ cứng.

#### 4.Transport: 
- Kiểm soát việc truyền tin từ nút tới nút (end to end),bắt đầu từ tầng này các thực thể đã có thể nói chuyện logic với nhau
- Thực hiện ghép kênh với kênh . Mỗi ứng dụng có thể gửi đi theo nhiều con đường . Một đường truyền có thể được nhiều ứng dụng sử dụng. Phân kênh/ hợp kênh giải quyết vấn đề chia sẻ dữ liệu cho các ứng dụng
- Khắc phục sai sót trong quá trình truyền tinh. Việc khắc phục sai sót được thực hiện trên nhiều tầng nhưng hiệu quả ở tầng cao nhất. Việc khắc phục sai sót ở tầng transport là hợp lý nhất.
- Data unit: segment 
- Dồn kênh: Dịch vụ dồn kênh thực hiện nhiệm vụ nhận dữ liệu từ các tiến trình tầng ứng dụng khác nhau đóng gói theo giao thức tầng Transport và gửi trên liên kết mạng, mỗi tiến trình dịch vụ sẽ được gắn một địa chỉ port khác nhau.
    -  Đối với dồn kênh đến các dịch vụ khác nhau, các tiến trình và dữ liệu yêu cầu sẽ được chuyển từ lớp Application xuống Transport
    ví dụ từ máy Client có địa chỉ 192.168.1.1 thực hiện yêu cầu đến Server dịch vụ HTTPS với địa chỉ port đích là 443 và một yêu cầu nữa tới dịch vụ FTP với địa chỉ port đích là 21.
    - Đối với dồn kênh đến các dịch vụ giống nhau, các tiến trình và dữ liệu yêu cầu cũng sẽ được chuyển từ lớp Application xuống Transport. 
    Từ máy Client có địa chỉ 192.168.1.1 thực hiện yêu cầu đến Server 2 dịch vụ HTTPS giống nhau với địa chỉ port đích là 443 
- Phân kênh: Sử dụng thông tin trên tiêu đề gói tin để gửi dữ liệu đến các tiến trình tầng ứng dụng khác nhau từ lớp Transport. Tương tự như dồn kênh,các tiến trình được gắn một địa chỉ port khác nhau.
    - ví dụ :Sau khi nhận được yêu cầu bên máy Client, Server sẽ truyền dữ liệu qua máy Client . Như ví dụ trên, máy Server thực hiện truyền dữ liệu với địa chỉ Port 2003 phía Client cho dịch vụ HTTPS, địa chỉ port 2004 cho dịch vụ FTP.Sau khi dữ liệu đến lớp Transport sẽ thực hiện quá trình phân kênh, chuyển giao dữ liệu cho các tiến trình theo địa chỉ port.
- Các giao thức tiêu biểu ở tầng transport sử dụng :
    - UDP (User Datagram Protocol): Là một giao thức truyền tải theo phương thức connectionless điển hình. Giao thức của phương thức này không xây dựng kết nối trước khi truyền mà truyền trực tiếp ngay lập tức – truyền theo kiểu best effort (truyền tổng lực)
    ![Alt](/thuctap/anh/Screenshot_7.png)
    - TCP (Transmission Control Protocol) : TCP là giao thức truyền tải hướng kết nối (connection-oriented), nghĩa là phải thực hiện thiết lập kết nối với đầu xa trước khi thực hiện truyền dữ liệu. Tiến trình thiết lập kết nối ở TCP được gọi là tiến trình bắt tay 3 bước (threeway handshake).Cung cấp cơ chế báo nhận (Acknowledgement): Khi A gửi dữ liệu cho B, B nhận được thì gửi gói tin cho A xác nhận là đã nhận. Nếu không nhận được tin xác nhận thì A sẽ gửi cho đến khi B báo nhận thì thôi. 
     ![Alt](/thuctap/anh/Screenshot_8.png)
     - Quy trình băt tay 3 bước :
     ![Alt](/thuctap/anh/Screenshot_9.png)
     Giả sử Host A muốn kết nối với Host B
    Host A sẽ gửi cho Host B 1 cờ SYN thăm dò xem Host B có sẵn sàng kết nối để thực hiện quá trình truyền dữ liệu hay không
    Nếu Host B đã sẵn sàng quá trình truyền, Host B sẽ gửi lại một cờ SYN/ACK để hỏi lại host A xem, Host A đã sẵn sàng quá trình truyền chưa?
    Nếu Host A sẵn sàng rồi thì Host A sẽ gửi lại cờ ACK để xác nhận quá trình truyền.
    Sau khi quá trình Three Handshake được thiết lập lúc này hai host A và B có thể trao đổi dữ liệu với nhau

#### 5.Network(Tầng mạng): 
- Vấn đề chủ chốt của tầng mạng là định tuyến , định rõ các gói tin được truyền theo những con đường nào từ nguồn tới đích
- Con đường này có thể cố định, ít bị thay đổi, được thiết lập khi bắt đầu liên kết hay thay đổi tùy theo trạng thái của mạng
- Nếu có nhiều gói tin truyền trên mạng có thể gây ra tắc nghẽn ,tầng mạng giải quyết vấn đề này
- Thực hiện chức năng giao tiếp với các mạng bao gồm đánh địa chỉ IP ,cắt hợp gói tin sao cho phù hợp với các mạng, Xác định đường đi từ nguồn tới đich bằng địa chỉ IP
- Ngoài ra tầng mạng còn thực hiện một số các chức năng kế toán khác như một số firewall được cài đặt trên tầng này để hệ thống thống kê các gói tin truyền qua hay ngăn cấm hoặc cho phép gói tin của giao thức nào đó
- Các lớp con của data link
    - LLC (logical link control)
    Lớp con LLC là phần trên so với các giao thức truy cập đường truyền khác, nó cung cấp sự mềm dẻo về giao tiếp. Bởi vì lớp con LLC hoạt động độc lập với các giao thức truy cập đường truyền, cho nên các giao thức lớp trên hơn (ví dụ như IP ở lớp mạng) có thể hoạt động mà không phụ thuộc vào loại phương tiện LAN. Lớp con LLC có thể lệ thuộc vào các lớp thấp hơn trong việc cung cấp truy cập đường truyền.
    - Lớp con MAC (media access control)
    Lớp con MAC cung cấp tính thứ tự truy cập vào môi trường LAN. Khi nhiều trạm cùng truy cập chia sẻ môi trường truyền, để định danh mỗi trạm, lớp cho MAC định nghĩa một trường địa chỉ phần cứng, gọi là địa chỉ MAC address. Địa chỉ MAC là một con số đơn nhất đối với mỗi giao tiếp LAN (card mạng).
- Các giao thức tiêu biểu network sử dụng : IP,ICMP,IGMP,IPX...
#### 6.Data link : 
- Tầng này có nhiệm vụ truyền dữ liệu giữa các mạng kề nhau trong một mạng diện rộng hoặc giữac các nút trong một segment mạng cục bộ
- Ngoài ra tầng data link còn kiểm soát lỗi đường truyền , thông lượng
- Tầng này thực hiện việc đóng gói thông tin thành các frame ,gửi các frame một cách tuần tự trên mạng , xử lý các thông báo xác nhận (Acknowleggement frame) do bên nhận gửi về
- Xác định ranh giới giữa các frame bằng cách ghi một số byte đặc biệt vào đầu và cuối frame.
- Các lớp con của data link
    - LLC (logical link control)
    Lớp con LLC là phần trên so với các giao thức truy cập đường truyền khác, nó cung cấp sự mềm dẻo về giao tiếp. Bởi vì lớp con LLC hoạt động độc lập với các giao thức truy cập đường truyền, cho nên các giao thức lớp trên hơn (ví dụ như IP ở lớp mạng) có thể hoạt động mà không phụ thuộc vào loại phương tiện LAN. Lớp con LLC có thể lệ thuộc vào các lớp thấp hơn trong việc cung cấp truy cập đường truyền.
    - Lớp con MAC (media access control)
    Lớp con MAC cung cấp tính thứ tự truy cập vào môi trường LAN. Khi nhiều trạm cùng truy cập chia sẻ môi trường truyền, để định danh mỗi trạm, lớp cho MAC định nghĩa một trường địa chỉ phần cứng, gọi là địa chỉ MAC address. Địa chỉ MAC là một con số đơn nhất đối với mỗi giao tiếp LAN (card mạng).
- Các giao thức tiêu biểu tầng data link sử dụng :
    - Giao thức RARP (Reverse Address Resolution Protocol)
    + ARP là giao thức phân giải địa chỉ ngược, cho trước địa chỉ MAC, tìm địa chỉ IP tương ứng.
    + ARP được sử dụng ở hệ thống không có ổ đĩa nhưng đòi hỏi cấu hình thủ công từ người quản trị hệ thống.
    + Thông điệp ARP gửi đi để yêu cầu một địa chỉ IP.
    - Giao thức HDLC (High-level Data Link Control)
    + HDLC là giao thức truyền thông mục đích chung điểm-điểm hoạt động ở cấp liên kết dữ liệu. Nó cung cấp khả năng phục hồi lỗi trong trường hợp mất gói dữ liệu, lỗi chuỗi và các lỗi khác, do đó nó cung cấp liên lạc đáng tin cậy giữa máy phát và máy thu.

    ![Alt](/thuctap/anh/Screenshot_6.png)

    + Preamble: chỉ sự bắt đầu của một khung truyền. Nó bao gồm các bit 0 và 1 xen kẽ nhau để báo hiệu cho trạm nhận rằng có khung đang tới. Nó còn cung cấp một phương tiện để đồng bộ hóa những phần khung nhận của lớp vật lý nhận với một luồng bits vào.
	Preamble bao gồm 7 byte như sau: 
    10101010 - 10101010 - 10101010 - 10101010 - 10101010 - 10101010 - 10101010

    + Start Frame Delimiter (SFD): SFD là một chuỗi 8 bit (1 byte) 10101011. Nó chỉ ra sự bắt đầu của chuỗi thông tin với 2 bit cuối là 11. Sau byte này chính là địa chỉ.

    + Destination Address (DA): DA bao gồm 6 byte để xác nhận trạm sẽ nhận khung. Nó chứa địa chỉ vật lý của đích sắp đến của gói. Nếu gói phải đi qua mạng LAN này đến mạng LAN khác để đến đích của nó, trường DA chứa địa chỉ vật lý của router nối mạng LAN hiện hành và mạng LAN kế. Khi gói đạt đến mạng đích, trường DA chứa địa chỉ vật lý của thiết bị đích.
	Trong chuỗi bits này, bit phía bên trái của trường DA chỉ ra địa chỉ đơn (individual address) nếu là bit 0 hoặc địa chỉ nhóm (group address) nếu là bit 1.

    + Source Address: Địa chỉ nguồn bao gồm 6 bytes chứa địa chỉ vật lý của thiết bị cuối cùng chuyển tiếp gói.

    + Length/type: Length/type field gồm 2 bytes. Chỉ ra số byte trong PDU (Protocol Data Unit) đang đến. Trường này được dùng để chỉ ra loại hoặc nền của các giao thức khác.

    + Data: Trường dữ liệu gồm tuần tự n bytes. Chiều dài tối thiểu và lớn nhất của dữ liệu là từ 46 bytes đến 1500 bytes. Dữ liệu được gửi qua lớp mạng với một vài thông tin điều khiển. Nếu dữ liệu có chiều dài ít hơn 46 byte trong một gói, một cơ chế đặt biệt sẽ đệm để đủ tối thiểu 46 bytes.

    + Trường FCS( Frame Check Sequence): gồm 4 bytes chứa mã kiểm tra lỗi CRC được tạo ra ở bên gửi, giá trị CRC này sẽ được tính lại ở phía nhận và so sánh xem có khớp với giá trị ban đầu để biết các khung có xảy ra lỗi trong quá trình truyền hay không.
#### 7.Physical(Tầng vật lý): 
- Tầng vật lý liên quan đến truyền các bit giữa các máy bằng truyền thông vật lý, cấu trúc của dữ liệu không được quan tâm đến
- Tầng vật lý quan tâm đến mối ghép cơ khí .điện tử và môi trường truyền bên dưới nó
- Các thông tin được mã hóa thành các bit 0-1 tương tự như tín hiệu bật tắt điện
### Quá trình truyền dữ liệu đi của dữa liệu thông qua tham chiếu OSI
![Alt](/thuctap/anh/image.png)

- Bước 1: ở tầng application người dùng sẽ đưa thông tin cần gửi vào máy tính như văn bản, hình ảnh sau đó dữ liệu sẽ được chuyển xuống tầng 6 để chuyển dữ liệu thành dạng chung, mã hóa dữ liệu và nén dữ liệu. Dữ liệu tiếp tục đi xuống tầng session tầng này bổ xung thông tin cho phiên giao dịch 
- Bước 2: Tiếp theo đóng gói toàn bộ thông tin ở tầng session đưa xuống tầng transport .Lúc này toàn bộ goí tin ở tầng trên sẽ được tầng transport coi như là data và bắt đầu đóng gói các header (TCP/UDP header) , phần này sẽ được gọi là segment và segment sẽ được đưa xuống tầng network
- Bước 3 : ở tầng network sẽ được đóng thêm IP header vào segment chuyển tên thành packet
- Bước 4 :packet tiếp tục được đưa xuống tầng data link và packet được bọc thêm ethernet header và phần kiểm tra lỗi FCS lúc này được gọi là frame và được đưa xuống tầng physical và được truyền tải sang máy khác dưới dạng bit nhị phân
- Bước 5 :Ở máy nhận bên kia sau khi nhận được gói tin sẽ truyền theo hướng ngược lại từ tầng vật lý lên application.Ở mỗi tầng tương ứng nó sẽ gỡ các header mà mỗi tầng đã gắn vào nó khi đến tầng application ta sẽ nhận được đúng những thứ mà ta gửi đi ở tầng application

### Mô hình TCP/IP:
Mô hình TCP/IP cũng tương tự mô hình OSI nhưng nó đã được gộp lại và rút gọn thành 4 tầng. 
- (application, Presentation,sesion) chuyển thành tầng (application).
- (transport)giữ nguyên là (transport).
- (Network) chuyển thành (internet).
- (data link ,physical) chuyển thành (network access).

![Alt](/thuctap/anh/image-1.png)

### Chi tiết các tầng trong TCP/IP
#### 1 Tầng Application 
- Tầng này có vai trò giao tiếp dữ liệu giữa 2 máy khác nhau
- Cung cấp cho các ứng dụng các trao đổi chuẩn hóa ,giao tiếp dữ liệu giữa 2 máy khác nhau thông qua các dịch vụ mạng khác nhau
- Một số ứng dụng phổ biến ở tầng này :Telnet, FTP, SMTP, DNS, HTTP, HTTPS, Mail
#### 2 Tầng Transport 
- Tầng giao thức này nằm dưới tầng Ứng dụng , Tầng giao vận (Host-to-Host Transport Layer hay thường gọi là Transport Layer)
- Hai giao thức quan trọng nhất của tầng này là Transmission Control Protocol (TCP) và User Datagram Protocol (UDP). 
- TCP cung cấp dịch vụ chuyển giao thông tin có kết nối (connection-oriented), nó bao gồm cả việc kiểm tra và sửa lỗi.
- UDP cung cấp dịch vụ kém tin cậy hơn (unreliable) và không thiết lập liên kết trước (connectionless)
- Cả hai giao thức đều chuyển giao thông tin giữa tầng ứng dụng và tầng Internet. Chương trình ứng dụng có thể lựa chọn dịch vụ nào thích hợp với nó

Một số port thông dụng
- TCP 20 : FTP (Data)
- TCP 21 : FTP (Control)
- TCP 22 : SSH.
- TCP 23 : Telnet.
- TCP 25 : SMTP.
- UDP 53 : DNS.
- UDP 67 : DHCP（Server）
- UDP 68 : DHCP（Client）
- TCP 80 : HTTP
- TCP 110 : POP3
- UDP 123 : NTP
- TCP 443 : HTTPS
- WELL KNOWN PORT NUMBERS 0~1023

 ### 3 Tầng Internet
 - Chức năng quan trọng nhất của tầng Internet chịu trách nhiệm định tuyến (dẫn đường) cho các gói tin và chọn lựa con đường tối ưu để truyền các gói tin từ trạm nguồn tới trạm đích
 - Chức năng tiếp theo đóng gói dữ liệu thành các gói được gọi là IP Packet
 - IP Packet chứa địa chỉ IP nguồn và  địa chỉ IP đích (nó giống như việc 1 bức thư có địa chỉ người gửi và địa chỉ người nhận).
 - Khi các gói tin được gửi tới địa chỉ IP đích các gói dữ liệu có thể xuất hiện theo thứ tự khác với thứ tự được gửi đi. Nhiệm vụ của các lớp cao hơn là sắp xếp lại chúng để đưa chúng đến các ứng dụng mạng thích hợp hoạt động ở lớp Application
 - Các giao thức chính ở tầng internet :IP (Internet Protocol) ,ICMP (Internet Control Message Protocol) ,ARP (Address Resolution Protocol) ,RARP (Reverse Address Resolution Protocol) ,IGMP (Internet Group Management Protocol).

### Tầng access network
- Bao gồm các giao thức chỉ hoạt động trên một liên kết - thành phần mạng kết nối các nút hoặc máy chủ trong mạng. Các giao thức trong lớp thấp nhất này bao gồm Ethernet cho mạng cục bộ và Giao thức phân giải địa chỉ .
- Chức năng chính của tầng này là đóng gói thông tin packet của tầng internet thành các frame được truyền dẫn trên mạng và chuyển địa chỉ ip thành địa chỉ vậy lý sử dụng bơi bởi mạng máy tính
- Một trong số các điểm mạnh của bộ  Giao thức TCP/IP là địa chỉ của nó được phối hợp sao cho trên mạng Internet không có một thiết bị mạng nào cùng tên. Địa chỉ này phải được chuyển đổi thích hợp với địa chỉ mạng vật lý nơi mà dữ liệu được truyền đi.
## So sánh hai mô hinh OSI và TCP/IP
### Giống nhau
- Cả 2 mô hình đều có kiến trúc phân lớp
- Cả 2 mô hình đều có tầng network và transport
- cả 2 mô hình cùng sử dụng kỹ thuật chuyển packet
### Khác nhau 
- TCP/IP chỉ sử dụng tầng ứng dụng (Application) để xác định chức năng của các tầng trên. Trong khi đó, OSI sử dụng đến 3 tầng (Application, Presentation, Session).
- TCP/IP sử dụng Link Layer để xác định các chức năng tầng dưới cùng. Đối với OSI, nó sử dụng 2 tầng là Physical và Data link.
- OSI sử dụng lớp Network để xác định các tiêu chuẩn và giao thức định tuyến. Chức năng này được quản lý bởi tầng Internet trong TCP/IP.
- Mô hình TCP/IP là một tiêu chuẩn Oriented Protocol. Còn OSI là một mô hình chung dựa trên chức năng của mỗi lớp.
- Trong TCP/IP, các giao thức được phát triển trước mô hình. Quá trình này ngược lại so với OSI.
- TCP/IP giúp thiết lập kết nối giữa các loại máy tính với nhau. OSI giúp chuẩn hóa router, switch, bo mạch chủ và các phần cứng khác.


|Nội dung| Mô hình OSI | Mô hình TCP/IP |
|--------| ----------- |----------------|
|Độ tin cậy và phổ biến| Ít người sử dụng(chỉ dùng để tham chiếu) | Được chuẩn hóa, nhiều người tin cậy và được sử dụng phổ biến|
|Số tầng|    7   |     4    |
|Sự kết hợp giữa các tầng| Không có   | Tầng applicaton có tầng session và tầng presentation kết hợp lại với nhau  |
|Truyền thông| Hỗ trợ cả kết nối định tuyến và không dây  | Hỗ trợ truyền thông không kết nối từ tầng mạng   |
|Tính phụ thuộc| Giao thức độc lập  | phụ thuộc vào giao thức |
|Phương pháp tiếp cận| Chiều dọc | Chiều ngang |
### Một số lưu ý khi dùng đến OSI và TCP/IP
- OSI vầ TCP/IP đều là mô hình tham chiếu nhưng OSI đã cũ rồi và OSI thường được sử dụng để tham chiếu sửa lỗi còn TCP/IP dùng để làm tham chiếu cho các ứng dụng hiện nay khi OSI đã không còn được tin cậy