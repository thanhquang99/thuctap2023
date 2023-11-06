- [Vlan là gì?](#vlan-là-gì)
- [Subnet là gì](#subnet-là-gì)
- [So sánh subnet và vlan](#so-sánh-subnet-và-vlan)
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
|Phần thấy đươc|Vlan là mạng ảo hay là mạng logic, được tạo ra nhằm mục đích giúp các máy trong cùng 1 Lan liên lạc với nhau  | Nó chia dải IP lớn thành dải ip nhỏ hơn ,nó giúp các máy chủ giao tiếp lớp network|

## Tài liệu tham khảo

https://www.geeksforgeeks.org/difference-between-vlan-and-subnet/



https://www.youtube.com/watch?v=m87emo4inBQ