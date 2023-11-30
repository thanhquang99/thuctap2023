# Tìm hiểu về wireshark
## Wireshark là gì?
- Wireshark là phần mềm phân tích mạng ,dùng để bắt gói tin phân tích các vấn đề liên quan tới mạng như kết nối chậm ,mất gói hay truy cập bất thường.
- Wireshark không chỉ phát triển trên os windows mà còn cả ubuntu ,Mac ...

## Cách chọn file cài wireshark
[Trang download wireshark](https://www.wireshark.org/download.html)

![Alt](/thuctap/anh/Screenshot_50.png)

- Do máy tính của tôi dùng windows nên sẽ có 2 lựa chọn là `installer` và `portable`.`Installer`là chúng ta cài đặt phần mềm về máy tính và chạy như một ứng dụng bình thường(phải có bước cài đặt ,ghi giá trị mới vào windows registry ,copy file dll vào system32 ).`portable` thì hiểu như 1 file vậy khi cần thì chúng ta bật lên sử dụng(không cần cài đặt,chạy như 1 file bình thường,có thể sử dụng trong máy ảo,khi đóng file sẽ xóa giá trị windows registry,file dll có luôn trên thư mục)
- Tôi cài installer vào thực hiện các bước bình thường như bạn cài phần mềm bình thường thôi

## Giao diện trên wireshark
![Alt](/thuctap/anh/Screenshot_51.png)

Khi bắt đầu mở app lên thì sẽ hiện ra giao diện như trên.Màn hình sẽ hiện ra các card mạng mà ta có thể bắt được và ta nhấn đúp vào card mạng để bắt đầu phân tích gói tin thôi. Như ở đây tôi chọn wifi

![Alt](/thuctap/anh/Screenshot_52.png)

- Đây là 3 nút cơ bản lần lượt là bắt đầu quá trình , kết thúc quá trình và reset. 

- Filter trong wireshark :Do trong quá trình bắt gói ,wireshark bắt được quá nhiều và ta cần phải lọc các gói tin theo yêu cầu của mình.
- Cấu trúc lọc gói tin .Ta có thể tìm hiểu thêm các lệnh khác trên web,ở ví dụ này tôi gò lệnh tìm gói tin mà có địa chỉ ip là 192.168.68.54

![Alt](/thuctap/anh/Screenshot_52.png)

## Coloring rule trên wire shark
Wireshark dùng màu sắc để xác định và phân loại giao thức gói tin
|Màu trong wireshark|Giao thức|
|-------------------|---------|
|Màu tím nhạt|TCP|
Màu xanh nhạt|UDP|
|Đen|Các gói có lỗi|
|Màu xanh lợt|lưu lượng HTTP|
|Màu vàng nhạt|Lưu lượng dành riêng cho Windows, bao gồm Khối tin nhắn máy chủ (SMB) và NetBIOS|
|Vàng đậm|Lộ trình|
|Màu xám đen|Lưu lượng TCP SYN, FIN và ACK|
|màu đỏ|Gói tin có vấn đề tiềm ẩn|

## Thực hành phân tích gói tin trong wireshark
### Phân tích gói tin TCP

![Alt](/thuctap/anh/Screenshot_55.png)

- Phân tích trong ảnh ta có thể nhìn thấy số thứ tự của gói tin, thời gian, ip source,ip destination, protocol ,kích thước gói tin,thông tin gói tin

- Ví dụ ở gói tin thứ 34 thì ip nguồn là 192.168.68.54 ,ip đích là 172.67.134.232 ,sử dụng giao thức TCP,kích thước 54 byte ,port 50361 đến port 443, kèm theo ACK ,máy gửi có gửi 1 segment với độ dài là 0

- Ở phần dưới cùng bên tay trái ta có thể thấy các tầng đã sử dụng của gói tin này(tham chiếu mô hình TCP/IP) :Frame, ethernet ,Internet,Transmission control protocol(TCP). Ta có thể thấy trong mô hình TCP/IP thì giao thức TCP sẽ nằm ở tầng trasport,nên quá trình truyền tin sử dụng giao thức TCP sẽ đi từ tầng transport xuống các tầng thấp hơn.

![Alt](/thuctap/anh/Screenshot_56.png)
![Alt](/thuctap/anh/Screenshot_57.png)

- Ta phân tích gói tin nhá. Giao thức TCP là một giao thức yêu cầu độ tin cậy nên 2 ip `192.168.68.54` `20.189.173.14` cần thiết lập một kết nối an toàn là `TLSv1.2` và ip`192.168.68.54` gửi đi 5 gói tin sau đó ip`20.189.173.14` gửi về 5 gói tin thì mới gửi tiếp

![Alt](/thuctap/anh/Screenshot_58.png)
- Ta có thể kích đúp vào gói tin để xem thông tin chi tiết,hãy nhìn 2 đường bôi đỏ và kết hợp với ảnh bên và xem xét số seq ta thấy nó đã tuân thủ theo đúng quy tắc bắt tay 3 bước
- Ngoài ra ta còn có thấy cờn `FIN,ACK` để thể hiện kết thúc quá trình truyền tin tin cậy

### Phân tích gói tin UDP

![Alt](/thuctap/anh/Screenshot_60.png)
- Giao thức UDP là truyền theo kiểu tổng lực nên không có cờ ACK ta chỉ thấy port nguồn và đích cùng với kích thước gói tin thôi
### Phân tích gói tin ARP

![Alt](/thuctap/anh/Screenshot_61.png)

![Alt](/thuctap/anh/Screenshot_62.png)

![Alt](/thuctap/anh/Screenshot_62.png)

- Nhìn vào hình ảnh ta có thể hiểu như này: `192.168.68.1` sẽ gửi broadcast đến tất cả các mạng và ai có trùng ip thì sẽ gửi 1 gói tin trả lại và kèm theo địa chỉ Mac

### Phân tích gói tin HTTPS
- Trong wireshark không có bộ lục gói tin HTTP mà ta sẽ lọc theo cụm từ `tcp.port==443` .Vì do port 443 mặc định dùng giao thức https

    ![Alt](/thuctap/anh/Screenshot_370.png)

- Phân tích các gói tin trong hình ảnh ta thẩy rằng giao thức https là giao thức được mã hóa nên nó cần có sự hỗ trợ của tls để mã hóa và cung cấp đường truyền an toàn 
  - TLS sẽ mở 1 đường kết nối (1 cặp port mới) và phiên bản TLS để tạo ra phiên
  - TCP sẽ được gửi để xác nhận là đã nhận được gói tin và yêu cầu gửi gói tin tiếp theo
### Phân tích gói tin DHCP
- Quá trình cấp 1 địa IP bằng dhcp( đầu tiên tôi dùng lệnh `ipconfig/release` và tiến hành bắt lại wifi để có thể xem quá trình nhận được 1 dhcp ip như nào) 
  - DHCP release : giải phóng địa chỉ IP hiện tại
  - DHCP discover : Máy tính sẽ gửi broadcast để hỏi xem server là ai và yêu cầu cấp 1 địa chỉ IP kèm , trong bản tin có đính kèm MAC của máy
  - DHCP offer : server sẽ gửi lại cho máy tính 1 offer về địa chỉ IP có thể cấp
  - DHCP request : máy tính sẽ trả lời xem có đồng ý hay không
  - DHCP ack : server gửi bản tin tiến hành cấp ip

    ![Alt](/thuctap/anh/Screenshot_365.png)
    ![Alt](/thuctap/anh/Screenshot_366.png)
    ![Alt](/thuctap/anh/Screenshot_367.png)
    ![Alt](/thuctap/anh/Screenshot_368.png)
    ![Alt](/thuctap/anh/Screenshot_369.png)
### Phân tích gói tin DNS
![Alt](/thuctap/anh/Screenshot_371.png)
- Hãy nhìn vào 2 dòng được đánh dấu trong hình
  - Đầu tiên máy tính sẽ gửi lên `8.8.8.8` 1 gói tin hỏi xem tên miền windows.com trỏ đến ip nào
  - Tiếp theo `8.8.8.8` sẽ gửi về máy tính 1 gói tin trả lời ip đang dùng của tên miền windows.com 

#### Sử dụng wireshark bắt mật khẩu telnet
- Mô hình ở đây là tôi sử dụng VMware cài ubuntu và đặt địa chỉ ip là `192.168.68.35` sau đó dùng mobaxterm telnet vào và dùng wire shark bắt gói tin

![Alt](/thuctap/anh/Screenshot_136.png)
- Chọn 1 gói tin bất kỳ và bấm vào TCP stream

![Alt](/thuctap/anh/Screenshot_137.png)

- Kết quả:ta đã có được password và cả user nữa

![Alt](/thuctap/anh/Screenshot_138.png)

- Ta thử sử dụng cách này với ssh xem sao?


![Alt](/thuctap/anh/Screenshot_139.png)


![Alt](/thuctap/anh/Screenshot_140.png)