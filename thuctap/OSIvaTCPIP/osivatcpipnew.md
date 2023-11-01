
# Mô hình OSI và TCP/IP
## Mô hình OSI
### Mô hình OSI là gì
Mô hình OSI(Open systems Interconnection) là mô hình tham chiếu kết nối hệ thống mở. Nó được chia làm 7 tầng để ta tham chiếu các quá trình kết nối truyền thông và giao thức mạng giữa các máy tính
### Các tầng trong mô hình OSI
Mô hình OSI sẽ gồm 7 tầng lần lượt là : 
- Application
- Presentation
- Session
- Transport
- Network
- Data link
- Physical
### Quá trình truyền dữ liệu khi tham chiếu đến mô hình OSI

Tầng application sẽ là tầng giao tiếp với người dùng và từ đó nhận data từ người dùng , sau khi đã có dữ liệu nó sẽ đóng 1 header của tầng application vào, sau đó data sẽ được chuyển xuống tầng presentation ,ở tầng này dữ liệu sẽ được chuyển thành dạng chung mã hóa dữ liệu sau đó nén dữ liệu tiếp tục đóng cho nó 1 header của tầng presentation. Dữ liệu sẽ tiếp tục đi xuống các tầng thấp hơn và ở mỗi tầng đó nó được đóng 1 header của tầng đấy .Đến cuối cùng là tầng vật lý thì sẽ được chuyển tải sang máy khác dưới dạng các dòng bit nhị phân.

Ở máy nhận thì quá trình sẽ đi ngược lại.Dữ liệu từ tầng vật lý sẽ được đi ngược lại bên trên. Ở mỗi tầng nó sẽ tự động gỡ header của riêng tầng đó ( Việc tạo header và gỡ header có tác dụng xác định xem tầng đó phải làm gì mà không cần đụng tới data sâu bên trong).Khi đi đến tầng application ta sẽ được một data hoàn chỉnh mà máy bên gửi đã gửi đi.

![Alt](/thuctap/anh/Screenshot_14.png)