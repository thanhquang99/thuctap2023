- [Router và switch](#router-và-switch)
  - [Router là gì](#router-là-gì)
  - [Switch là gì](#switch-là-gì)
    - [Switch hoạt động trên lớp 3 là gì?](#switch-hoạt-động-trên-lớp-3-là-gì)
    - [so sánh switch layer 2 và layer 3](#so-sánh-switch-layer-2-và-layer-3)
  - [So sánh router và switch](#so-sánh-router-và-switch)
  - [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Router và switch
## Router là gì
- Router hay còn được gọi là bộ định tuyến hoạt động ở layer 4 trong mô hình OSI , Nó kết hợp nhiều mạng lại với nhau nhờ sự trợ giúp của các ip của chúng.Có thể nói router là thiết bị kết nối các `mạng` với nhau

![Alt](/thuctap/anh/Screenshot_34.png)
- Giá của router cisco cũng khá là cao đó ,có những router 27tr -vài trăm triệu.[Bảng giá tham khảo](https://netsystem.vn/bang-gia-router-cisco-4221-4321-4331-4351-4431-4451-4461-price-list/)

![Alt](/thuctap/anh/Screenshot_33.png)


## Switch là gì
- Switch hay còn được gọi là bộ chuyển mạch, nó thường được hoạt động ở layer 2 trong mo hình OSI . Nó sử dụng địa chỉ Mac hay địa chỉ vật lý để xác định các địa chỉ mạng. Có thể nói switch là dùng để mở rộng các kết nối với các `thiết bị mạng`

![Alt](/thuctap/anh/Screenshot_35.png)

- Giá của switch cisco cũng tương đối cao đó.[Bảng giá tham khảo](https://switchcisco.vn/Bao-gia.html)

![Alt](/thuctap/anh/Screenshot_36.png)
- Hiện nay mọi người đang chuộm 2 dòng switch là 2960 và c1000.
  - Đặc điểm của 2 loại switch này là giá thành phù hợp, bền, khả năng truyền tải tốt,nó còn thêm các cổng cấu hình và đủ đáp ứng những nhu cầu switch cần có.
  - Switch 2960 đáp ứng cho công việc cần số cổng cao (24 hoặc 48 cổng, 6-10tr) và switch c1000 đáp ứng cho các doanh nghiệp nhỏ (8-24-48 cổng,6-10 tr ). 

- Switch là một thiết bị đặc biệt , có 2 loại switch hoạt động trên lớp 2 và 3
### Switch hoạt động trên lớp 3 là gì?
- Là thiết bị kết hợp giữa switch và router . Ta có thể hiểu như này, chân kết nối của router rất là ít nên ta cần switch layer 2 để mở rộng số lượng cổng kết nối đến các thiết bị mạng , Tiếp sau đó lại sinh ra công nghệ Vlan trên switch nên bây giờ trên switch cần có ip để định tuyến các đường đi in/out cho Vlan trong switch nên từ đây sinh ra switch layer 3.
### so sánh switch layer 2 và layer 3
|Đặc điểm|Switch layer 2|switch layer 3|
|--------|--------------|--------------|
|Lớp hoạt động|Tầng datalink trong mô hình OSI|Tầng network trong mô hình OSI|
|Giá|Rẻ |Đắt|
|Thiết lập và cấu hình ban đầu|Rất dễ thiết lập ta chỉ cần cắm dây vào các cổng trong switch là xong|Yêu cầu cấu hình nâng cao để thiết lập , Ta cần thiết lập địa chỉa IP cho 1 số cổng và thiết lập 1 số Vlan cho các cổng sau đó định tuyến đường đi cho chúng|

![Alt](/thuctap/anh/Screenshot_37.png)

## So sánh router và switch
|Đặc điểm|Switch|Router|
|--------|------|------|
|Tầng hoạt động|có cả 2 tầng data link và network trong mô hình OSI|Hoạt động ở tầng network trong mô hình OSI|
|Số lượng port|Trên switch có rất nhiều port|Số lượng cổng hạn chế|
|Data unit|ở layer 2 thì là frame, ở layer 3 thì là packet|packet|
|Tác dụng|Kết nối các thiết bị mạng như máy tính,... vào mạng|Kết nối các dải mạng lại với nhau|
|Được dùng cho|Lan|Cả Lan và Wan|

## Tài liệu tham khảo



https://netsystem.com.vn/goc-tu-van/10-diem-khac-biet-giua-bo-dinh-tuyen-router-va-bo-chuyen-mach-switch-cisco.html

https://netsystem.vn/bang-gia-router-cisco-4221-4321-4331-4351-4431-4451-4461-price-list/

https://viettuans.vn/switch-layer-3-la-gi

https://www.manageengine.com/products/oputils/tech-topics/layer2-vs-layer3-switch.html#:~:text=Layer%202%20switches%20offer%20limited,routing%20between%20different%20network%20segments.&text=Limited%20scalability.,cross%20network%20segment%20routing%20capabilities.