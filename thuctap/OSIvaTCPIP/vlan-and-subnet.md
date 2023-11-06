- [Vlan là gì?](#vlan-là-gì)
- [Subnet là gì](#subnet-là-gì)
- [So sánh subnet và vlan](#so-sánh-subnet-và-vlan)
- [Các swich hoạt động trên tầng nào?](#các-swich-hoạt-động-trên-tầng-nào)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Vlan là gì?
- Vlan (vitual local area network) : Đầu tiên ta phải hiểu Lan là gì?

Lan là chính là một mạng cục bộ ,tập hợp tất cả các máy mà dùng chung broadcast chính là Lan. Và Vlan là công nghệ được sinh ra để ảo hóa các mạng Lan ,nó cho phép các mạng từ 1 mạng Lan trên máy vật lý tạo thành nhiều mạng Lan ảo nhằm mục đích tiết kiệm chi phí về phần cúng , vì chẳng lẽ cứ mỗi mạng Lan ta phải dùng 1 switch riêng ư?

# Subnet là gì
- Subnet được gọi là mạng con . Ví dụ 1 ip 123.68.0.0/16 sẽ cung cấp cho ta `2^16-2` host , ta không thể dùng hết mạng này để tập chung cho một chỗ được nên ta sẽ ra thành nhiều mạng con khác nhau nhằm mục đích tạo ra nhiều mạng con được đặt ở nhiều vị trí khác nhau và mỗi mạng con sẽ có số lượng host phù hợp với mục đích dùng.

# So sánh subnet và vlan
- giống nhau : subnet và vlan được tạo ra nhằm mục đích để chia nhỏ các máy thành các tập hợp nhỏ hơn để dễ dàng quản lý
- Khác nhau:

|Đặc điểm|Vlan|Subnet|
|--------|----|------|
|Định nghĩa|Vlan là mạng ảo hay là mạng logic, được tạo ra nhằm mục đích giúp các máy trong cùng 1 Lan liên lạc với nhau  | Nó chia dải IP lớn thành dải ip nhỏ hơn ,nó giúp các máy chủ giao tiếp lớp network|
|Tính năng|Được cấu hình trên switch và cho phép cổng ethernet nào được đi sử dụng vlan nào|Mạng con được quyết định bằng địa chỉ IP và prefix ,nó được gắn vào router|
|Hoạt động ở lớp nào|Vlan dựa trên địa chỉ Mac nên là hoạt động ở lớp data link|Mạng con hoạt động dựa trên địa chỉ IP nên nó ở lớp network|
|Phần mềm hay phần cứng|Vlan hoạt đôngj chủ yếu dựa trên phần mềm mà ta cấu hình|Subnet dựa trên phần cứng nhiều hơn, subnet sẽ được gắn vào phần cứng|
|bảo mật|vlan cung cấp bảo mật tốt hơn vì nó cho phép các máy trong cùng 1 vlan trao đổi với nhau|Subnet không được bảo mật bằng Vlan nhưng để các subnet giao tiếp với nhau thì nó cần có định tuyến|

# Các swich hoạt động trên tầng nào?
- Switch có thể coi là bộ chuyển chuyển mạch , có thể hiểu nôm na rằng nó có tác dụng mở rộng số lượng các cổng ethernet ra
- Từ đây ta có thể thấy rằng hầu hết các switch hoạt động trên tầng 2 (data link) nhưng có 1 số switch hoạt động trên tầng 3(netwwork), những switch hoạt động trên tầng 3 thì tương tự như 1 router vậy
- Switch hoạt động trên lớp 3 sẽ tốn rất nhiều chi phí so với switch lớp 2 vì nó yêu cầu cấu hình cao hơn nhưng nó sẽ cung cấp thông lượng cao hơn và tốc độ truy cập cao hơn.
![Alt](/thuctap/anh/Screenshot_32.png)


- Từ đây ta cũng đặt ra 1 câu hỏi rằng switch layer 3 và router khác nhau như thế nào?
- Chức năng của router là kết nối nhiều mạng cùng 1 lúc trong khi đó switch lại là kết nối nhiều thiết bị với nhau. Từ đó có thể suy ra router là cấp trên của switch vì 1 dải mạng có thể cung cấp cho nhiều thiết bị thông qua switch.
- Nhưng nói về chi phí thì switch layer 3 lại rẻ hơn router và mật độ cổng của switch cũng cao hơn.
- Router lại có một số tính năng mà switch không có như Nat, firewall....
# Tài liệu tham khảo

https://www.geeksforgeeks.org/difference-between-vlan-and-subnet/

https://www.youtube.com/watch?v=m87emo4inBQ.

https://www.techtarget.com/searchnetworking/definition/switch#:~:text=A%20network%20switch%20operates%20on,access%20control%20(MAC)%20address.

https://www.manageengine.com/products/oputils/tech-topics/layer2-vs-layer3-switch.html#:~:text=Layer%202%20switches%20offer%20limited,routing%20between%20different%20network%20segments.&text=Limited%20scalability.,cross%20network%20segment%20routing%20capabilities.

https://www.fibermall.com/blog/layer-3-switch-router.htm

https://www.geeksforgeeks.org/difference-between-router-and-layer-3-switch/

