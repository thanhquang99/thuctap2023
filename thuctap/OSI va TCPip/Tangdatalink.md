## Tầng datalink
### Chức năng và nhiệm vụ
- Cung cấp khả năng chuyển dữ liệu tin cậy xuyên qua một liên kết vật lý. Lớp này liên quan đến:
- Địa chỉ vật lý.
- Mô hình mạng.
- Cơ chế truy cập đường truyền.
- Thông báo lỗi.
- Thứ tự phân phối frame.
- Điều khiển dòng
- Tại lớp datalink, các bít đến từ lớp vật lý được chuyển thành các frame dữ liệu bằng cách dùng một số nghi thức tại lớp này. Lớp data linkđược chia thành hai lớp con: Lớp con LLC (logical link control), lớp con MAC (media access control).
### Các lớp con của data link
#### LLC (logical link control)
Lớp con LLC là phần trên so với các giao thức truy cập đường truyền khác, nó cung cấp sự mềm dẻo về giao tiếp. Bởi vì lớp con LLC hoạt động độc lập với các giao thức truy cập đường truyền, cho nên các giao thức lớp trên hơn (ví dụ như IP ở lớp mạng) có thể hoạt động mà không phụ thuộc vào loại phương tiện LAN. Lớp con LLC có thể lệ thuộc vào các lớp thấp hơn trong việc cung cấp truy cập đường truyền.
####  Lớp con MAC (media access control)
Lớp con MAC cung cấp tính thứ tự truy cập vào môi trường LAN. Khi nhiều trạm cùng truy cập chia sẻ môi trường truyền, để định danh mỗi trạm, lớp cho MAC định nghĩa một trường địa chỉ phần cứng, gọi là địa chỉ MAC address. Địa chỉ MAC là một con số đơn nhất đối với mỗi giao tiếp LAN (card mạng).
### Các giao thức 
#### Giao thức PPP (Point-to-point Protocol)
- PPP là giao thức lớp 2 phổ biến cho mạng WAN. Hai thành phần của PPP tồn tại: LCP (Link Control Protocol) đàm phán kết nối và NCP (Network Control Protocol) đóng gói lưu lượng.
-  Giao thức kiểm soát liên kết (Link Control Protocol): LCP được sử dụng để thiết lập, định cấu hình và kiểm tra kết nối liên kết dữ liệu. Nó linh hoạt trong việc xử lý các kích cỡ khác nhau của các gói, phát hiện một liên kết ngược, lỗi cấu hình và chấm dứt liên kết.
- Giao thức điều khiển mạng (Network Control Protocol): NCP được sử dụng để thiết lập và định cấu hình các giao thức lớp Mạng khác nhau.
PPP cho phép sử dụng đồng thời nhiều giao thức lớp Mạng.
#### Giao thức ARP (Address Resolution Protocol)
Giao thức phân giải địa chỉ (Address Resolution Protocol hay ARP) là một giao thức truyền thông được sử dụng để chuyển địa chỉ từ tầng mạng (Internet layer) sang tầng liên kết dữ liệu (Data Link layer) theo mô hình OSI.

ARP được sử dụng để từ một địa chỉ mạng (ví dụ một địa chỉ IPv4) tìm ra địa chỉ vật lý như một địa chỉ Ethernet (địa chỉ MAC), hay còn có thể nói là phân giải địa chỉ IP sang địa chỉ máy.

#### Giao thức RARP (Reverse Address Resolution Protocol)
- RARP là giao thức phân giải địa chỉ ngược, cho trước địa chỉ MAC, tìm địa chỉ IP tương ứng.
- RARP được sử dụng ở hệ thống không có ổ đĩa nhưng đòi hỏi cấu hình thủ công từ người quản trị hệ thống.
- Thông điệp RARP gửi đi để yêu cầu một địa chỉ IP.
#### Giao thức HDLC (High-level Data Link Control)
HDLC là giao thức truyền thông mục đích chung điểm-điểm hoạt động ở cấp liên kết dữ liệu. Nó cung cấp khả năng phục hồi lỗi trong trường hợp mất gói dữ liệu, lỗi chuỗi và các lỗi khác, do đó nó cung cấp liên lạc đáng tin cậy giữa máy phát và máy thu.

![Alt](/thuctap/anh/Screenshot_6.png)

 - Preamble: chỉ sự bắt đầu của một khung truyền. Nó bao gồm các bit 0 và 1 xen kẽ nhau để báo hiệu cho trạm nhận rằng có khung đang tới. Nó còn cung cấp một phương tiện để đồng bộ hóa những phần khung nhận của lớp vật lý nhận với một luồng bits vào.
	Preamble bao gồm 7 byte như sau: 
10101010 - 10101010 - 10101010 - 10101010 - 10101010 - 10101010 - 10101010

- Start Frame Delimiter (SFD): SFD là một chuỗi 8 bit (1 byte) 10101011. Nó chỉ ra sự bắt đầu của chuỗi thông tin với 2 bit cuối là 11. Sau byte này chính là địa chỉ.

- Destination Address (DA): DA bao gồm 6 byte để xác nhận trạm sẽ nhận khung. Nó chứa địa chỉ vật lý của đích sắp đến của gói. Nếu gói phải đi qua mạng LAN này đến mạng LAN khác để đến đích của nó, trường DA chứa địa chỉ vật lý của router nối mạng LAN hiện hành và mạng LAN kế. Khi gói đạt đến mạng đích, trường DA chứa địa chỉ vật lý của thiết bị đích.
	Trong chuỗi bits này, bit phía bên trái của trường DA chỉ ra địa chỉ đơn (individual address) nếu là bit 0 hoặc địa chỉ nhóm (group address) nếu là bit 1.

- Source Address: Địa chỉ nguồn bao gồm 6 bytes chứa địa chỉ vật lý của thiết bị cuối cùng chuyển tiếp gói.

- Length/type: Length/type field gồm 2 bytes. Chỉ ra số byte trong PDU (Protocol Data Unit) đang đến. Trường này được dùng để chỉ ra loại hoặc nền của các giao thức khác.

- Data: Trường dữ liệu gồm tuần tự n bytes. Chiều dài tối thiểu và lớn nhất của dữ liệu là từ 46 bytes đến 1500 bytes. Dữ liệu được gửi qua lớp mạng với một vài thông tin điều khiển. Nếu dữ liệu có chiều dài ít hơn 46 byte trong một gói, một cơ chế đặt biệt sẽ đệm để đủ tối thiểu 46 bytes.

- Trường FCS( Frame Check Sequence): gồm 4 bytes chứa mã kiểm tra lỗi CRC được tạo ra ở bên gửi, giá trị CRC này sẽ được tính lại ở phía nhận và so sánh xem có khớp với giá trị ban đầu để biết các khung có xảy ra lỗi trong quá trình truyền hay không.
