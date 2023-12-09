# Raid là gì và tại sao lại phải cài nó
- RAID là hình thức ghép nhiều ổ đĩa cứng vật lý thành các ổ đĩa logic có chức năng đảm bảo sự an toàn dữ liệu, tránh các trường hợp ổ đĩa bị hỏng thì dữ liệu vẫn còn đó
- Phân chia các loại RAID [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/bo-xung-ccna/boxung.md#raid-c%C3%A1c-lo%E1%BA%A1i-raid)

# Cài RAID 0
- Khi bật server lên ta nhấn phím `F2` để vào `system setups` và chọn vào `device settings`

![Alt](/thuctap/anh/Screenshot_445.png)
- TIếp thao ta chọn dòng đầu tiên để vào card RAID và tiến hành cấu hình

![Alt](/thuctap/anh/Screenshot_446.png)

- Ta tiến hành kiểm tra xem các ổ cứng vâtj lý đã đầy đủ chưa( ở đây tôi có 2 ổ 500G và 3 ổ 3,5T)

![Alt](/thuctap/anh/Screenshot_447.png)

- Do lần đầu tiên nên các ổ vật lý này sẽ không thể thêm vào lựa chọn tạo RAID nên ta cần phải vào `Configuration management` để `convert`

![Alt](/thuctap/anh/Screenshot_448.png)

- Sau đó tiến hành tích hết các ổ cứng vật lý vào rồi `confim ` tất cả mọi thứ

![Alt](/thuctap/anh/Screenshot_449.png)

- Tiếp theo xóa `convert` đi thì bây giờ ta mới có thể tạo RAID được

- Bây giờ ta bắt đầu cấu hình RAID. Vào `Configuration management` để cấu hình

![Alt](/thuctap/anh/Screenshot_450.png)

![Alt](/thuctap/anh/Screenshot_451.png)

- Chọn loại RAID
  
![Alt](/thuctap/anh/Screenshot_452.png)

- Chọn đĩa vật lý tham gia vào quá trình RAID

![Alt](/thuctap/anh/Screenshot_453.png)

![Alt](/thuctap/anh/Screenshot_454.png)

- Bây giờ chỉ cần `confim` mọi thứ là xong

![Alt](/thuctap/anh/Screenshot_455.png)

- Kiểm tra RAID đã tạo ở `vitural disk management`

![Alt](/thuctap/anh/Screenshot_456.png)

![Alt](/thuctap/anh/Screenshot_457.png)

- Ta có thể tiến hành chỉnh sủa RAID ở đây

![Alt](/thuctap/anh/Screenshot_458.png)

- Ta tiến hành xóa RAID 0 và cài RAID 1 và RAID 5 tương tự

![Alt](/thuctap/anh/Screenshot_459.png)

![Alt](/thuctap/anh/Screenshot_460.png)

![Alt](/thuctap/anh/Screenshot_461.png)

![Alt](/thuctap/anh/Screenshot_462.png)

![Alt](/thuctap/anh/Screenshot_463.png)