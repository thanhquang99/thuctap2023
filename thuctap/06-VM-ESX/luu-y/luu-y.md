# Tổng hợp các lưu ý gặp phải tromg quá trình thực hành với VMware
## 1. Máy ảo khi boot không nhận disk
- Đôi khi có thể ta sẽ triển khai máy ảo mà hệ điều hành không nằm trong VMware ta sẽ chọn bản other-64 bit hoặc other-32 bit
- Để có thể sử dụng đúng và nhận được phân vùng khi cài OS ta cần các yêu tố sau 
  ![Alt](/thuctap/anh/Screenshot_978.png)
  ![Alt](/thuctap/anh/Screenshot_979.png)

- Ta có thể tạo máy ảo trong máy ảo trên VMware nhưng yêu cầu CPU máy ảo lần 1 phải cho ảo hóa thêm lần nữa
  ![Alt](/thuctap/anh/Screenshot_980.png)

  Trên hình là máy Quang-ESXi-02 là máy ảo lần 1 , sau khi chỉnh sửa thì ta có thể tạo máy ảo mới trên máy ảo này

## 2. Khi boot ESXi ảo trong ESXi vật lý mà máy ảo không có mạng
- Để máy ảo trong ESXi ảo có thể nhận được mạng thì cần 2 yếu tố
  - Gắn ESXi ảo với Port-group của Vlan trunking
  - Chỉnh sửa lại sercurity của Port-group
  ![Alt](/thuctap/anh/Screenshot_1000.png)
  ![Alt](/thuctap/anh/Screenshot_1001.png)
  ![Alt](/thuctap/anh/Screenshot_1002.png)
