- [Vlan là gì?](#vlan-là-gì)
  - [Phân loại Vlan](#phân-loại-vlan)
  - [Các kiểu cấu hình Vlan](#các-kiểu-cấu-hình-vlan)
- [Subnet là gì](#subnet-là-gì)
- [So sánh subnet và vlan](#so-sánh-subnet-và-vlan)
- [Các swich hoạt động trên tầng nào?](#các-swich-hoạt-động-trên-tầng-nào)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Vlan là gì?
- Vlan (vitual local area network) :
    - Đầu tiên ta phải hiểu Lan là gì?

    - Lan là một tập hợp các hệ thống mạng máy tính được kết nối nội bộ với nhau và được giới hạn trong 1 khu vực nhất định. Vlan là công nghệ được sinh ra để ảo hóa các mạng Lan ,nó cho phép từ 1 switch tạo thành nhiều mạng Lan ảo nhằm mục đích tiết kiệm chi phí về phần cứng , vì chẳng lẽ cứ mỗi mạng Lan ta phải dùng 1 switch riêng ư?

- Tối đa số Vlan có thể tạo trên switch :0-4095 =2^12
## Phân loại Vlan 
- VLAN 1 :Đây là kiểu mặc định của tất cả switch có hỗ trợ vlan. mặc định tất cả các cổng khi chưa thiết lập đều thuộc vlan này. khi ta thêm cổng vào vlan khác thì cổng đó sẽ bị xóa khỏi vlan 1
- Default VLAN : mặc định ban đầu tất car các cổng đều thuộc vlan này ,ta có thể hiểu nó tương tự như vlan 1 vậy
- User VLAN (hay Data VLAN) :là VLAN trong đó chứa các tài khoản người dùng thành từng nhóm
- Native VLAN : là vlan dùng để cấu hình trunking vlan ,giúp các thiết bị không tương thích với nhau có thể giao tiếp với nhau
- Management VLAN :Là VLAN được gán địa chỉ IP dùng để giám sát, truy cập từ xa vào thiết bị.
- Voice VLAN :Là VLAN dành riêng cho lưu lượng thoại
## Các kiểu cấu hình Vlan
- Port based Vlan :Đây là cách cấu hình Vlan đơn giản và phổ biến nhất.Ta tiến hành tạo vlan và gắn các port vào Vlan .Các host nào cắm vào port chứa Vlan nào thì sẽ mặc định ở Vlan đó
- Trunking Vlan :Dùng để kết nối các switch với nhau hoặc giữa switch và router.Khi Vlan từ switch này muốn giao tiếp với cùng vlan switch khác thì phải có 1 dây kết nối,nhưng khi ta kết nối qua cổng trunk thì sẽ cho phép nhiều Vlan kết nối qua cổng trunk này. Để phân biệt kết nối nào thuộc vlan nào nó sẽ dán nhãn của vlan đó lên. Nó sẽ tuân theo chuẩn `dot1q/802.1Q`
  
![Alt](/thuctap/anh/Screenshot_38.png)

![Alt](/thuctap/anh/Screenshot_39.png)

- VTP :Khi trên hệ thống mạng có nhiều con switch ta không thể thiết lập thủ công các vlan trên từng con switch được (nhưng vẫn phải thủ công quy định port nào thuộc vlan nào) thì ta có giao thức VTP ta sẽ từ 1 con switch làm server và dạy thông tin vlan cho các con switch khác.
![Alt](/thuctap/anh/Screenshot_40.png)
# Subnet là gì
- Subnet được gọi là mạng con . Ví dụ 1 ip 123.68.0.0/16 sẽ cung cấp cho ta `2^16-2` host , ta không thể dùng hết mạng này để tập chung cho một chỗ được nên ta sẽ ra thành nhiều mạng con khác nhau nhằm mục đích tạo ra nhiều mạng con được đặt ở nhiều vị trí khác nhau và mỗi mạng con sẽ có số lượng host phù hợp với mục đích dùng.

# So sánh subnet và vlan
- giống nhau : subnet và vlan được tạo ra nhằm mục đích để chia nhỏ các mạng thành các tập hợp nhỏ hơn để dễ dàng quản lý
- Khác nhau:

|Đặc điểm|Vlan|Subnet|
|--------|----|------|
|Định nghĩa|Vlan là mạng ảo hay là mạng logic, được tạo ra nhằm mục đích giúp tạo ra các Lan ảo tránh lãng phí phần cứng | Nó chia dải IP lớn thành dải ip nhỏ hơn ,nó giúp các máy chủ giao tiếp lớp network|
|Tính năng|Được cấu hình trên switch và cho phép cổng ethernet nào được đi sử dụng vlan nào|Mạng con được quyết định bằng địa chỉ IP và prefix ,nó được gắn vào router|
|Hoạt động ở lớp nào|Vlan dựa trên địa chỉ Mac nên là hoạt động ở lớp data link|Mạng con hoạt động dựa trên địa chỉ IP nên nó ở lớp network|
|Phần mềm hay phần cứng|Vlan hoạt động chủ yếu dựa trên phần mềm mà ta cấu hình|Subnet dựa trên phần cứng nhiều hơn, subnet sẽ được gắn vào phần cứng|
|bảo mật|vlan cung cấp bảo mật tốt hơn vì nó cho phép các máy trong cùng 1 vlan trao đổi với nhau|Subnet không được bảo mật bằng Vlan và để các subnet giao tiếp với nhau thì nó cần có định tuyến|

# Các swich hoạt động trên tầng nào?
- Switch có thể coi là bộ chuyển chuyển mạch , có thể hiểu nôm na rằng nó có tác dụng mở rộng số lượng các cổng ethernet ra
- Từ đây ta có thể thấy rằng hầu hết các switch hoạt động trên tầng 2 (data link) nhưng có 1 số switch hoạt động trên tầng 3(netwwork), những switch hoạt động trên tầng 3 có thể nói là sự kết hợp của switch và router
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

https://docs.google.com/document/d/1nUvh11oZFP7lUvYg8t6NxwtzaJYXwvbTZvfloCL2ByM/edit

https://vnpro.vn/thu-vien/co-nhung-loai-vlan-nao-2124.html
