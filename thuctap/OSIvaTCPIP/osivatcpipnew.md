
# Mô hình OSI và TCP/IP

Trước khi tìm hiểu về 2 mô hình trên chúng ta phải nói rõ là 2 mô hình trên không độc quyền và không do bất cứ một công ty nào kiểm soát

Muc lục
- [Mô hình OSI và TCP/IP](#mô-hình-osi-và-tcpip)
  - [1 Mô hình OSI](#1-mô-hình-osi)
    - [1.1 Mô hình OSI là gì](#11-mô-hình-osi-là-gì)
    - [1.2Các tầng trong mô hình OSI](#12các-tầng-trong-mô-hình-osi)
    - [1.3 Quá trình truyền dữ liệu khi tham chiếu đến mô hình OSI](#13-quá-trình-truyền-dữ-liệu-khi-tham-chiếu-đến-mô-hình-osi)
    - [1.4 Tầng Application](#14-tầng-application)
    - [1.4.1 Chức năng tầng Application](#141-chức-năng-tầng-application)
    - [1.4.2 Devices](#142-devices)
      - [Application firewalls](#application-firewalls)
    - [1.4.3 Các giao thức tầng application](#143-các-giao-thức-tầng-application)
    - [1.5 Tầng presentation](#15-tầng-presentation)
    - [1.5.1 Chức năng của tầng presentation](#151-chức-năng-của-tầng-presentation)
    - [1.6 Tầng Session](#16-tầng-session)
    - [1.6.1 Chức năng của tầng session](#161-chức-năng-của-tầng-session)
    - [1.6.2 Device](#162-device)
      - [circuit proxy firewall](#circuit-proxy-firewall)
    - [1.6.3 Các giao thức tầng session](#163-các-giao-thức-tầng-session)
    - [1.7 Tầng transport](#17-tầng-transport)
    - [1.7.1 Chức năng của tầng transport](#171-chức-năng-của-tầng-transport)
    - [1.7.2 Port](#172-port)
    - [1.7.3 Các giao thức ở tầng transport](#173-các-giao-thức-ở-tầng-transport)
    - [1.8 Tầng network](#18-tầng-network)
    - [1.8.1 Chức năng của tầng network](#181-chức-năng-của-tầng-network)
    - [1.8.2 Device](#182-device)
    - [1.8.3 Các giao thức của tầng network](#183-các-giao-thức-của-tầng-network)
    - [1.9 Tầng data link](#19-tầng-data-link)
    - [1.9.1 Chức năng cùa tầng data link](#191-chức-năng-cùa-tầng-data-link)
    - [1.9.2 LLC (logical link control) và MAC (media access control)](#192-llc-logical-link-control-và-mac-media-access-control)
    - [1.9.3 Device](#193-device)
    - [1.9.4 Các giao thức của tầng Data link](#194-các-giao-thức-của-tầng-data-link)
    - [1.10 Tầng Physical](#110-tầng-physical)
    - [1.10.1 Chức năng của tầng physical](#1101-chức-năng-của-tầng-physical)
    - [1.10.2 Topologies](#1102-topologies)
    - [1.10.3 Giao thức tầng physical](#1103-giao-thức-tầng-physical)
  - [2. Mô hình TCP/IP](#2-mô-hình-tcpip)
    - [2.1 Mô hình TCP/IP là gì](#21-mô-hình-tcpip-là-gì)
    - [2.3 Các tầng của mô hình TCP/IP](#23-các-tầng-của-mô-hình-tcpip)
    - [2.4 Mô hình TCP/IP hoạt động như thế nào?](#24-mô-hình-tcpip-hoạt-động-như-thế-nào)
    - [2.5 Tầng Application](#25-tầng-application)
    - [2.5.1 Chức năng của tầng application](#251-chức-năng-của-tầng-application)
    - [2.6 Tầng Transport](#26-tầng-transport)
    - [2.5.1 Chức năng của tầng Transport](#251-chức-năng-của-tầng-transport)
    - [2.7 Tầng Internet](#27-tầng-internet)
    - [2.5.1 Chức năng của tầng Internet](#251-chức-năng-của-tầng-internet)
    - [2.8 Tầng Access network](#28-tầng-access-network)
    - [2.5.1 Chức năng của tầng access network](#251-chức-năng-của-tầng-access-network)
  - [3. So sánh 2 mô hình OSI và TCP/IP](#3-so-sánh-2-mô-hình-osi-và-tcpip)
  - [4. Tại sao hai mô hình OSI và TCP/IP có đặc điểm gần giống nhau lại cùng tồn tại](#4-tại-sao-hai-mô-hình-osi-và-tcpip-có-đặc-điểm-gần-giống-nhau-lại-cùng-tồn-tại)
  - [5. Các tìm hiểu thêm](#5-các-tìm-hiểu-thêm)
  - [6. Tài liệu tham khảo](#6-tài-liệu-tham-khảo)

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
  - Tầng application có chức năng tương tác giữa máy tính và con người. Nó là giao diện giữa các chương trình ứng dụng của người dùng và mạng
  - Cho phép ứng dụng truy cập vào các dịch vụ mạng
### 1.4.2 Devices 
#### Application firewalls
- Applicaton firewall : Là một ứng dụng kiểm soát các lệnh đầu vào và đầu ra hoặc hệ thống của một ứng dụng hoặc dịch vụ.Nó hoạt động bằng cách giám sát hoặc chặn thông tin liên lạc dựa một chính sách đã thiết lập trước đó
- Tính năng của application firewall
    - firewall rất thông minh
    - Đưa ra quyết định nâng cao
    - Kiểm tra gói sâu
    - Độ trễ cao,có thể chậm
### 1.4.3 Các giao thức tầng application
- HTTP(Hypertext Transfer Protocol): được gọi với cái tên là giao thức truyền siêu văn bản. Mục đích của giap thức này cho phép các client yêu cầu các trang web từ webserver
- HTTPS(Hypertext Transfer Protocol Security): Nó là bản nâng cao của http và có thêm tính chất bảo mật là được mã hóa.
- DNS(Domain Name System): Hệ thống phân giải tên miền dịch tên miền thành địa chỉ IP
- SNMP(Simple Network Monitoring Protocol): Giao thức giám sát mạng đơn giản, nó là một giao thức để truyền thông tin trên mạng,cho phép thu thập dữ liệu và quản lý các thiết bị từ xa. Giao thức này được sử dụng trong cấu hình các router và switch
- LDAP(Lightweight Directory Access Protocol):Giao thức truy cập trực tiếp lightweight ,nó có tác dụng truy cập và duy trì thông tin trên thư mục phân tán (như connecting, accessing,modifying, searching)
- DHCP(Dynamic Host Configuration Protocol): Là một giao thức cấp pháp ip tự dộng cho máy khi có yêu cầu thêm vào dải mạng mà trước khi đó ta đã định nghĩa sắn subnet mark ,gateway. Nó đảm bảo không có sự trùng lặp ip
### 1.5 Tầng presentation
### 1.5.1 Chức năng của tầng presentation
-Đây là tầng dưới của tầng application ,Khi tầng application nhận được dữ liệu mà người dùng muốn tương tác thì cần phải qua thêm 1 quy trình nữa là phải phiên dịch cho máy hiểu.Tầng presentation sinh ra là để làm điều đó. Nó có tác dụng chuyển đổi kí tự hoặc chuyển đổi và định dạng hình ảnh hay nén và giải nén dữ liệu(như stream audio hay video).
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
### 1.8 Tầng network
### 1.8.1 Chức năng của tầng network
- Nó chịu trách nghiệm cho việc cung cấp địa chỉ logic (ipv4),định tuyến đường đi ,ngoài ra tầng mạng còn thực hiện một số các chức năng kế toán khác như một số firewall được cài đặt trên tầng này để hệ thống thống kê các gói tin truyền qua hay ngăn cấm hoặc cho phép gói tin của giao thức nào đó
- IP được sinh ra từ tầng này
### 1.8.2 Device
- Router : Dùng để chuyển tiếp gói tin giữa các phân đoạn mạng và sử dụng địa chỉ ip để truyền tải gói tin
- Packet-filtering firewalls Tường lửa thực hiện kiểm tra đơn giản các gói dữ liệu đi qua bộ định tuyến — kiểm tra thông tin như địa chỉ IP đích và nguồn gốc, loại gói, số cổng và thông tin cấp bề mặt khác mà không cần mở gói để kiểm tra nội dung của nó.
### 1.8.3 Các giao thức của tầng network
- ICMP ( Internet Control Message Protocol): Giao thức điều khiển truyền tin lên mạng . Ta có thể hiểu đơn giản giao thức này cho phép các thiết bị mạng gửi thông báo lỗi trong quá trình truyền đi hay còn để quản lý quá trình hoạt động của mạng. Ta có thể thấy câu lệnh ` ping ` được sử dụng phổ biến.
- IPSEC(Internet Protocol Security): Đây là bảo mật giao thức thiết lập kết nối an toàn qua mạng,cách nó làm dùng để đảm bảo an toàn chính là mã hóa.Hai máy muốn thực hiện giao thức này cũng làm tương tự quy tắc bắt tay 3 bước. bên A sẽ gửi yêu cầu mã hóa và bên B xác nhận sau đó sẽ thiết lập một đường truyền bảo mật.
- IGMP (Internet Group Management Protocol):Là giao thức quản lý nhóm internet.Nó có khả năng thiết tạo thành các group và cho phép truyền 1 packet tới nhiều hệ thống có trong group đó
### 1.9 Tầng data link 
### 1.9.1 Chức năng cùa tầng data link
- Ta có thể hiểu nôm na là mỗi một phần cứng của thiết bị trên máy của chúng ta đều cần phải có địa chỉ và chính tầng data link này có nhiệm vụ làm cho các phần cứng của ta có địa chỉ để mà dư liệu có thể nhận biết địa chỉ vật lý trên máy cần đi vào mà thực hiện nhiệm vụ của chúng.
Ta có thể giải thích như này người dùng cần kết nối internet thì card mạng cần phải hoạt động, để mà card mạng bật thì ta phải cho nó mottj cái địa chỉ để máy có thể nhận biết mà thao tác với nó.
- Từ những điều trên thì bây giờ sinh ra địa chỉ MAC . Địa chỉ MAC hay còn được gọi là địa chỉ của các phần cứng trong máy của các bạn.
  Địa chỉ này do các nhà sản xuất nhúng vào và nó phải là duy nhất như IP vậy.
### 1.9.2 LLC (logical link control) và MAC (media access control)
Tầng data link lại phân chia thành 2 lớp con là LLC và MAC mỗi lớp lại đảm nhiệm 1 vai trò khác nhau
- LLC (logical link control) : ta có thể hiểu nôm na rằng những thứ ở các tầng trên là ảo thì cái LLC này chính là thứ quản lý và giao tiếp những cái ảo đó như là điều khiển lưu lượng ,hay khôi phục lỗi... Tại sao tôi lại gọi là ảo thì là bỏi vì tôi nghĩ logic sẽ là ảo(Dùng từ ảo có thể không đúng nhưng các bạn có thể hiểu là nó dùng để giao tiếp với các tầng trên là được)
- MAC (media access control): Lớp Mac này nằm dưới LLC và dùng để giao tiếp với các phần vật lý và điều khiển nó. MAC ở trên tôi cũng đã nói rồi
### 1.9.3 Device 
- Witches :Nó dùng kể kết nối với nhiều thiết bị, nó dựa vào MAC để xác định đường truyền data
- Bridges :Nó dùng để kết nối các mạng lại với nhau
### 1.9.4 Các giao thức của tầng Data link
- 802.1x :là một tiêu chuẩn IEEE để kiểm soát truy cập mạng và xác thực các thiết bị với mạng
- ARP(Address Resolution Protocol): Giao thức phân giải địa chỉ IP thành địa chỉ MAC (rất quan trọng) 
- RARP (Reverse Address Resolution Protocol) : giao thức này thì lại ngược lại với ARP sẽ chuyển địa chỉ vật lý thành địa chỉ IP
- PPP(Point to point protocol) :là giao thức điểm tới điểm ,nó có tác dụng đóng gói lưu lượng IP và cung cấp mã hóa và nén xác thực
- Ngoài ra còn có một số giao thức khác các bạn có thể tự tìm hiểu như: EAP(Network Access Control), CHAP, PAP
### 1.10 Tầng Physical
### 1.10.1 Chức năng của tầng physical
Chỉ cần nghe tên là ta có thể hiểu chức năng của tầng này luôn rồi. Tầng này chính là tầng vật lý ,quản lý tất cả những cái gì liên quan đến vật lý như dây carb,wifi,... Nói tóm lại là nó phụ trách đường truyền vật lý từ máy này sang máy kia.
### 1.10.2 Topologies 
- Mạng hình sao :Là một mô hình mạng gồm thiết bị làm trung tâm và các nút thông tin chịu sự điều khiển của trung tâm đó. Các nút ở đây có thể là máy trạm, các thiết bị đầu cuối hay các thiết bị khác trong mạng LAN.

     ![Alt](/thuctap/anh/Screenshot_10.png)

- Bus Topology: Là kiểu kết nối mà tất cả các thiết bị như máy chủ máy trạm, các nút thông tin đều được liên kết với nhau trên một đường dây cáp chính để truyền dữ liệu. Các dữ liệu và tín hiệu truyền qua dây cáp đều đến được tất cả điểm đến.

    ![Alt](/thuctap/anh/Screenshot_11.png)

- Mạng dạng vòng :Đây là kiểu Topology các thiết bị được kết nối thành vòng tròn khép kín thông qua dây cáp. Tín hiệu sẽ được truyền đi theo một chiều cố định. Tại một thời điểm, chỉ có một nút được truyền tin qua một nút khác.

    ![Alt](/thuctap/anh/Screenshot_12.png)

- Mạng dạng lưới :Đây là kiểu topology mà trong đó một máy tính sẽ được liên kết với tất cả các máy còn lại trong hệ thống mà không cần phải thông qua Hub hay Switch.

    ![Alt](/thuctap/anh/Screenshot_13.png)
    
- Mạng phân cấp :Là dạng topology hình sao mở rộng. Các máy trong hệ thống được sắp xếp theo từng lớp tuỳ thuộc vào chức năng của chúng.
### 1.10.3 Giao thức tầng physical
- 802.11 :là một chuẩn giao tiếp giữa các nhóm mạng cục bộ không dây
- CSMA/CA (Carrier Sense Multiple Access/Collision Avoidance) và CSMA/CD : Khi nhiều trạm tín hiệu đi qua data link sẽ có sự xùng đột thì 2 giao thức trên sinh ra để tránh sự xung đột đó .Nó hoạt động bằng cách trước khi truyền dữ liệu phải phải kiểm tra xem thiết bị có đang bận không
## 2. Mô hình TCP/IP
### 2.1 Mô hình TCP/IP là gì
- Nó tương tự như mô hình tham chiếu OSI và đúng như tên của nó , nó sử dụng 2 giao thức chính là TCP và IP
- Nó có vai trò quan trọng trong internet
### 2.3 Các tầng của mô hình TCP/IP
Mô hình TCP/IP sẽ gồm 4 tầng ,4 tầng đó được rút ngắn và kết hợp lại từ các tầng của mô hình OSI
- Application
- Transport
- Internet
- Access network
### 2.4 Mô hình TCP/IP hoạt động như thế nào?

Mô hình này hoạt động tương tự mô hình OSI nhưng mà nó được gộp lại thành 4 tầng. Cũng tương tự OSI ở mỗi tầng nó sẽ đóng vào data một header để nhận biết tầng của mình và khi chuyển đến máy nhận ở đúng tầng của mình chúng sẽ tháo các header đó ra .Từ đó ta được 1 gói tin hoàn chỉnh.

![Alt](/thuctap/anh/photo_2023-11-02_16-42-46.jpg)

### 2.5 Tầng Application
- Ta hãy đối chiếu vào mô hình OSI thì tầng application ở TCP/IP chính là sự kết hợp của 3 tầng application, presentation và session của mô hình OSI
### 2.5.1 Chức năng của tầng application 
- Nó cung cấp giao tiếp đến người dùng.
- Cung cấp các ứng dụng cho phép người dùng trao đổi dữ liệu ứng dụng thông qua các dịch vụ mạng khác nhau (như duyệt web, chat, gửi email,...).
- Dữ liệu khi đến đây sẽ được định dạng theo kiểu byte nối byte, cùng với đó là các thông tin định tuyến giúp xác định đường đi đúng của một gói tin.
### 2.6 Tầng Transport
- Tầng transport thì giữ nguyên giống mô hình OSI
### 2.5.1 Chức năng của tầng Transport
- Nhiệm vụ của tầng giao vận là duy trì liên lạc đầu cuối trên toàn mạng. Ở tầng này, TCP và UDP sẽ hỗ trợ nhau phân luồng dữ liệu
### 2.7 Tầng Internet
- Tầng network của mô hình OSI được đổi tên thành tầng Internet trong mô hình TCP/IP
### 2.5.1 Chức năng của tầng Internet
- Chức năng quan trọng nhất của tầng Internet chịu trách nhiệm định tuyến (dẫn đường) cho các gói tin và chọn lựa con đường tối ưu để truyền các gói tin từ trạm nguồn tới trạm đích
- Chức năng tiếp theo đóng gói dữ liệu thành các gói được gọi là IP Packet
### 2.8 Tầng Access network
- Tầng data link và tầng physical của mô hình OSI được gộp lại và đổi tên thành tầng Access network của mô hình TCP/IP
### 2.5.1 Chức năng của tầng access network
- là tầng thấp nhất trong mô hình TCP/IP. 
- Chịu trách nhiệm truyền dữ liệu giữa các thiết bị trong cùng một mạng. Tại đây, các gói dữ liệu được đóng vào khung (Frame) và được định tuyến đi đến đích được chỉ định ban đầu

`Ở đây tôi sẽ không đi sâu vào các giao thức của các tầng này vì mô hình OSI và TCP/IP đều là 2 mô hình tham chiếu nên khi chúng gộp các tầng lại với nhau thì giao thức cũng sẽ tương tự `

## 3. So sánh 2 mô hình OSI và TCP/IP
 Giống nhau
- Cả 2 mô hình đều có kiến trúc phân lớp
- Cả 2 mô hình đều có tầng network và transport

Khác nhau 

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

## 4. Tại sao hai mô hình OSI và TCP/IP có đặc điểm gần giống nhau lại cùng tồn tại
Tuy 2 mô hình không có sự khác biệt lớn nhưng về mục đích sử dụng của cả 2 là khác nhau
- Mô hình TCP/IP là bộ giao thức truyền thông sử dụng các thiết bị mạng nào có thể được kết nối với Internet. Mặt khác, Mô hình OSI là một khung khái niệm sử dụng để mô tả chức năng của mạng dùng để tham chiếu.
- Mô hình TCP/IP ra đời trước 10 năm so với mô hình OSI 

## 5. Các tìm hiểu thêm
- Nhược điểm của mô hình TCP/IP so với mô hình OSI là TCP/IP nó kém an toàn đáng tin cậy hơn mô hình OSI,TCP/IP không có lớp chuyên dụng để mã hóa ,xác thực hoặc sửa lỗi.
- Mọi nguời hãy nhìn vào mô hình của TCP/IP tại sao lại có mũi tên tương tác giữa tầng application và application? Nó có ý nghĩa rằng các application có thể nói chuyện với nhau trong cùng một môi trường.
- Tại sao mỗi tầng người ta lại gắn cho nó các giao thức mà không phải tầng nào cũng có đủ các giao thức đó? 
  - Tôi sẽ lấy ví dụ về HTTP , theo tôi tìm hiểu thì http phát triển mà không liên quan đến mô hình OSI, Nó không tuân theo các thông số kỹ thuật .Và IP cũng thế nó cũng không được thiết kế theo mô hình OSI. Nhưng nó giải quyết được vấn đề mà các tầng trong mô hình OSI đề ra.
  - Ta có thể mở rộng ra như này cả 2 mô hình OSI và TCP/IP chỉ là mô hình tham chiếu . Nhưng TCP/IP phù hợp để các nhà sản xuất phát triển ứng dụng còn OSI lại phù hợp với việc sửa lỗi.
-  Về phần device thì nó được sản xuất tuân thủ theo mô hình OSI hay TCP/IP
  - Cái này là lý giải của riêng tôi(Có thể đúng có thể sai): Cả 2 mô hình đều là mô hình tham chiếu nên khi sản xuất device thì nó sẽ đáp ứng đủ cả 2 mô hình OSI và TCP/IP (Một số trường hợp đặc biệt có thể khác)

![Alt](/thuctap/anh/Screenshot_17.png)
 
## 6. Tài liệu tham khảo

https://drive.google.com/drive/folders/1rZZvtadhlfc6JESp9qT_d9KRoI7ZGUYv

https://www.youtube.com/watch?v=g9U9-bpXV30&list=PLnaGQB5hLTI6Y20FjqCsTO63efmE0_zZJ

https://www.mindomo.com/mindmap/osi-model-bd81b1a4982d462abffa98328058449d

https://xmind.app/m/7iS7/

https://datech.vn/mo-hinh-tcp-ip-la-gi-chuc-nang-cua-cac-tang-trong-mo-hinh

https://vi.wikipedia.org/wiki

https://byjus.com/free-ias-prep/difference-between-tcp-ip-and-osi-model/

https://www.totolink.vn/article/149-mo-hinh-tcp-ip-la-gi-chuc-nang-cua-cac-tang-trong-mo-hinh-tcp-ip.html

https://viblo.asia/p/tim-hieu-co-ban-ve-mo-hinh-tcpip-RQqKLkJp57z

https://networkengineering.stackexchange.com/questions/6380/osi-model-and-networking-protocols-relationship