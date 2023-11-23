- [Tìm hiểu cách sử dụng IP Public, Virtual ip, Virtual host, File htaccess, IP local, file host](#tìm-hiểu-cách-sử-dụng-ip-public-virtual-ip-virtual-host-file-htaccess-ip-local-file-host)
  - [Ip public](#ip-public)
  - [Vitual IP](#vitual-ip)
  - [Vitual host](#vitual-host)
  - [File .htaccess](#file-htaccess)
  - [IP local](#ip-local)
  - [File host](#file-host)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)

# Tìm hiểu cách sử dụng IP Public, Virtual ip, Virtual host, File htaccess, IP local, file host
## Ip public
- Ip public là ip mà IPS(nhà cung cấp dịch vụ Internet) cung cấp cho chúng ta ,nó chỉ có duy nhất trên môi trường internet nhằm phục vị giao tiếp trên môi trường internet
- IP public thường được dùng cho các hosting trang web hay các dịch vụ internet

## Vitual IP
- Là địa chỉ IP ảo,khi trên server có các máy chủ ảo hay có nhiểu trang web hoặc có bất kỳ ứng dụng nào thì để truy cập từ môi trường internet vào ta cần gắn cho nó 1 địa chỉ ip ảo
- VIP hoặc VIPA (Virtual IP Address ) cũng là viết tắt của vitual ip
- Ta có thể hiểu như này khi ta dùng VMware sẽ có các VMnet cung cấp cho các máy ảo của chúng ta một dải địa chỉ IP thì cái địa chỉ IP của các máy ảo này có thể hiểu như vitual IP vậy
- Ta có thể tìm hiểu rõ hơn các VMnet [ở đây](https://www.youtube.com/watch?v=yUTJ0cSvNfs&t=865s)

## Vitual host
- Vitual host là một dạng lưu trữ nhiều domain trên 1 server và hiện nay vitual host được xem như là giải pháp tối ưu cho việc tiết kiệm domain ,giúp nhiều domain lưu trữ trên 1 địa chỉ IP

![Alt](/thuctap/anh/Screenshot_187.png)
- Hiện nay có 3 các vận dụng vitual host
  - IP based : dựa vào ip để xác nhận web, tuy nhiên có nhiều web trên 1 máy chủ nên máy chủ cần nhiều vitual interface để có thể sử dụng nhiều địa chỉ IP cho nhiều web
  - Port based : tương tự IP based nó sẽ dùng port và IP để kết nối web nên nó sẽ tiết kiệm IP hơn. ví dụ `thanhquang.com:80`
  - name based :Kết nối web dựa vào domain-name .khi nhiều website sử dụng chung 1 địa chỉ IP server sẽ đối chiếu http-header để ánh xạ đúng đến web có domain name đó. Cách này rất được ưa chuộm vì nó vừa giúp tiết kiệm được ip vừa giúp tiết kiệm được port

## File .htaccess
- hypertext access là file cấu hình cho các webserver chạy apache . File này được máy chủ chấp nhận như 1 thành phần và cho phép bật hay điều hướng 1 thành phần nào đó 
- Thông thường, bạn sẽ thấy file .htaccess nằm ngay trong thư mục gốc trên host nơi cài đặt trang WordPress
- Công dụng : load trang index ,cấm IP truy cập ,tự động chèn www vào address bar ,bắt buộc dùng https, tự tạo trang web trả về thông báo lỗi ...

## IP local 
- IP local là địa chỉ ip trong mạng cục bộ trong hệ thống mạng Lan sẽ sử dụng địa chỉ IP private và 1 địa chỉ ip private ứng với 1 máy tính sẽ được coi là ip local 

![Alt](/thuctap/anh/Screenshot_188.png)

## File host
- File host là một tệp tin (file) lưu trữ thông tin địa chỉ IP của máy chủ và domain được trỏ tới
- File host được xem như là một DNS nhỏ trên máy tính của bạn
- File host nằm ở
  - Trên Windows: C:\Windows\System32\drivers\etc
  - Trên Linux: /etc/hosts
  - Trên macOS: /private/etc/hosts


![Alt](/thuctap/anh/Screenshot_189.png)

![Alt](/thuctap/anh/Screenshot_190.png)


# Tài liệu tham khảo
https://docs.google.com/document/d/1L-WSndxP04bB_woGR1HUmZ4U3PfXb44T0-DNBDr98dc/edit#heading=h.73cirbgx6nld

https://www.youtube.com/watch?v=yUTJ0cSvNfs&t=865s

https://vietnix.vn/virtual-hosts/