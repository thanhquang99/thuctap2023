
# Mô hình OSI và TCP/IP
## 1 Mô hình OSI
### 1.1 Mô hình OSI là gì
Mô hình OSI(Open systems Interconnection) là mô hình tham chiếu kết nối hệ thống mở. Nó được chia làm 7 tầng để ta tham chiếu các quá trình kết nối truyền thông và giao thức mạng giữa các máy tính
### 1.2Các tầng trong mô hình OSI
Mô hình OSI sẽ gồm 7 tầng lần lượt là : 
- Application
- Presentation
- Session
- Transport
- Network
- Data link
- Physical
### 1.3 Quá trình truyền dữ liệu khi tham chiếu đến mô hình OSI

![Alt](/thuctap/anh/Screenshot_14.png)

Tầng application sẽ là tầng giao tiếp với người dùng và từ đó nhận data từ người dùng , sau khi đã có dữ liệu nó sẽ đóng 1 header của tầng application vào, sau đó data sẽ được chuyển xuống tầng presentation ,ở tầng này dữ liệu sẽ được chuyển thành dạng chung mã hóa dữ liệu sau đó nén dữ liệu tiếp tục đóng cho nó 1 header của tầng presentation. Dữ liệu sẽ tiếp tục đi xuống các tầng thấp hơn và ở mỗi tầng đó nó được đóng 1 header của tầng đấy .Đến cuối cùng là tầng vật lý thì sẽ được chuyển tải sang máy khác dưới dạng các dòng bit nhị phân.

Ở máy nhận thì quá trình sẽ đi ngược lại.Dữ liệu từ tầng vật lý sẽ được đi ngược lại bên trên. Ở mỗi tầng nó sẽ tự động gỡ header của riêng tầng đó ( Việc tạo header và gỡ header có tác dụng xác định xem tầng đó phải làm gì mà không cần đụng tới data sâu bên trong).Khi đi đến tầng application ta sẽ được một data hoàn chỉnh mà máy bên gửi đã gửi đi.

### 1.4 Tầng Application
### 1.4.1 Chức năng tầng Application
  -Tầng application có chức năng tương tác giữa máy tính và con người
  -Cho phép ứng dụng truy cập vào các dịch vụ mạng
### 1.4.2 Devices 
#### Application firewalls
- Applicaton firewall : Là một ứng dụng kiểm soát các lệnh đầu vào và đầu ra hoặc hệ thống của một ứng dụng hoặc dịch vụ.Nó hoạt động bằng cách giám sát hoặc chặn thông tin liên lạc dựa một chính sách đã thiết lập trước đó
- Tính năng của application firewall
    - firewall rất thông minh
    - Đưa ra quyết định nâng cao
    - Kiểm tra gói sâu
    - Độ trễ cao,có thể chậm
#### 1.4.3 Các giao thức tầng application
- HTTP(Hypertext Transfer Protocol): được gọi với cái tên là giao thức truyền siêu văn bản. Mục đích của giap thức này cho phép các client yêu cầu các trang web từ webserver
- HTTPS(Hypertext Transfer Protocol Security): Nó là bản nâng cao của http và có thêm tính chất bảo mật là được mã hóa.
- DNS(Domain Name System): Hệ thống phân giải tên miền dịch tên miền thành địa chỉ IP
- SNMP(Simple Network Monitoring Protocol): Giao thức giám sát mạng đơn giản, nó là một giao thức để truyền thông tin trên mạng,cho phép thu thập dữ liệu và quản lý các thiết bị từ xa. Giao thức này được sử dụng trong cấu hình các router và switch
- LDAP(Lightweight Directory Access Protocol):Giao thức truy cập trực tiếp lightweight ,nó có tác dụng truy cập và duy trì thông tin trên thư mục phân tán (như connecting, accessing,modifying, searching)
- DHCP(Dynamic Host Configuration Protocol): Là một giao thức cấp pháp ip tự dộng cho máy khi có yêu cầu thêm vào dải mạng mà trước khi đó ta đã định nghĩa sắn subnet mark ,gateway. Nó đảm bảo không có sự trùng lặp ip
### 1.5 Tầng presentation
### 1.5.1 Chức năng của tầng presentation
-Đây là tầng dưới của tầng application ,Khi tầng application nhận được dữ liệu mà người dùng muốn tương tác thì cần phải qua thêm 1 quy trình nữa là phải phiên dịch cho máy hiểu.Tàng presentation sinh ra là để làm điều đó. Nó có tác dụng chuyển đổi kí tự hoặc chuyển đổi và định dạng hình ảnh hay nén và giải nén dữ liệu(như stream audio hay video).
### 1.6 Tầng Session 
### 1.6.1 Chức năng của tầng session
- Đây là tầng dưới của tầng presentation .Tầng này chịu trách nghiệm việc thiết lập ,duy trì, hủy bỏ , đồng bộ các phiên làm việc giữa các máy khác nhau.Ta có thể hiểu rằng khi ta bật trang youtube từ 1 tab ở trên chorme thì tầng session có tác dụng duy trì sao cho dữ liệu truyền đi và tải về phải đúng tab youtube mà không bị nhầm sang các tab hay trình duyệt khác.
### 1.6.2 Device
#### circuit proxy firewall
Nói đến firewall thì tác dụng của nó sẽ là lọc gói tin,từ đó có thể xác định được chính xác các phiên đang làm việc rồi.
### 1.6.3 Các giao thức tầng session 
- Netbios (Network Basic Input / Output System) :Nói đơn giản thì nó là hệ thống đầu vào đầu ra cơ bản của network nó cho phép các application trên hệ thống giao tiếp qua mạng
- RPC (Remote Procedure Call) : Dịch theo tiếng việt thì nó là thủ tục điều khiển từ xa . Nó cho phép các máy client thực hiện lệnh trên một máy chủ từ xa với các thông số đã được cung cấp
### 1.7 Tầng transport 
### 1.7.1 Chức năng của tầng transport
- Tầng này chịu trách nghiệm cho việc quản lý các thiết bị đầu cuối với việc phát hiện lỗi và sửa lỗi
- Ta có thể hiểu transport nhuư một người kiểm tra và điều hướng các phiên làm việc vậy(Ở đây tôi hiêur nó như là csgt vậy)
### 1.7.2 Port 
- Port chính là từ tầng này mà sinh ra . Ta có thể hiểu port như là một cái cổng vậy. Mỗi port khác nhau sẽ cung cấp các dịch vụ khác nhau
- Port trên máy có rất nhiều ,có tới 65535 port cơ.
- Một số port phổ biến 
    - port 21: FTP
    - port 22 :SSH đăng nhập từ xa
    - port 23 : telnet Câu lệnh từ xa
    - port 80 http :connect với webserver
    - port 443 https :cũng là connect với webserver và được bảo mật bằng TLS
### 1.7.3 Các giao thức ở tầng transport
- TCP(Transmission Control Protocol) : Là giao thức điều khiển truyền dẫn 
    - Giao thức này là giao thức đáng tin cậy, được sắp xếp theo thứ tự và kiểm tra lỗi gửi gói tin
    - Trước gửi gói tin thì giao thức này thực hiện theo quy trình bắt tay 3 bước
    - Bắt tay 3 bước là gì: đầu tiên bên A sẽ gửi 1 kết nối thăm dò cho bên B ,Khi bên B nhận được phải gửi lại cho bên A là đã nhận được rồi và bên A nhận được sẽ bắt dầu gửi gói tin tiếp.
    - Giao thức TCP là một giao thức tin cậy tránh mất mát dữ liệu nên thường dùng trong việc download, upload cái file.
- UDP (User Datagram Protocol): giao thức gói dữ liệu người dùng
    - Giao thức này tương tư TCP nhưng lại thiếu tin cậy hơn và kiểu truyền của nó là truyền tổng lực không quan tâm đến sự mất mát dữ liệu
    - Giao thức này lại đáp ứng được nhu cầu TCP không có như truyền tải audio,video stream với tốc độ nhanh
- SSL(Secure Sockets Layer): Nó được sử dụng để mã hóa đường truyền http
- TLS(Transport Layer Security): Đây là phiên bản mới nhất của SSL và cũng được sử dụng để mã hóa đường truyền http
  






## Tài liệu tham khảo

https://drive.google.com/drive/folders/1rZZvtadhlfc6JESp9qT_d9KRoI7ZGUYv

https://www.youtube.com/watch?v=g9U9-bpXV30&list=PLnaGQB5hLTI6Y20FjqCsTO63efmE0_zZJ

https://www.mindomo.com/mindmap/osi-model-bd81b1a4982d462abffa98328058449d

https://vi.wikipedia.org/wiki