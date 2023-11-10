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

