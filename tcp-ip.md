# Tìm hiểu về mô hình OSI và TCP/IP
## Mô hình OSI
MÔ hình OSI(Open systems Interconnection) là mô hình tham chiếu kết nối hệ thống mở. Nó được chia làm 7 tầng để ta tham chiếu các quá trình kết nối truyền thông và giao thức mạng giữa các máy tính
![Alt text](Screenshot_1-1.png)
### Mô hình OSI sẽ gồm 7 tầng :
#### Application: 
Cung cấp ứng dụng kết nối giao tiếp với người dùng và còn cung cấp cả cơ chế tiếp cận người dùng. 
#### Presentation: 
Thông ngôn dữ liệu,cấu trúc dữ liệu ,định dạng dữ liệu và cung cấp vài cơ chế mã hóa.
#### Session: 
Truyền thông giữa 2 host.Quản lý các phiên làm việc, nó duy trì cho các phiên làm việc nào truyền đúng dữ liệu về phiên đấy như nghe nhạc thì dữ liệu sẽ truyền đúng về phần nghe nhạc
#### Transport: 
Quản lý các thiết bị đầu cuối end to end.Thiết lập và duy trì một kết nối ảo
#### Network(Tầng mạng): 
Phân phối dữ liệu trên đường truyền vật lý. Định vị đường đi tối ưu của các gói tin.Đánh địa chỉ logic(ip)
#### Data link : 
Giúp dữ liêuj truy cập vào đường truyền vật lý ở phía dưới.Quy định các loại dữ liệu sẽ được truyền đi như thế nào
#### Physical(Tầng vật lý): 
Nó định nghiac về phần cơ , điện ,quang.
### Quá trình truyền dữ liệu đi của dữa liệu thông qua tham chiếu OSI
Nếu ta định nghĩa máy 1 là máy gửi và máy 2 là máy nhận thì quá trình sẽ được gửi đi như sau: Ở mỗi tầng ở máy 1 sẽ được gắn vào 1 header để định nghĩa tầng đó và sẽ được gửi tới máy 2 và ở máy 2 sẽ phá vỡ header ở từng tầng và từ đó ta nhận được 1 gói tin hoàn chỉnh 
![alt](C:\Users\ADMIN\Desktop\scrennshort)
