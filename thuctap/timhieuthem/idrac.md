# Tìm hiểu về IDRAC
## Cài đặt IDRAC 
- Ta vào `system setups` và chọn `IDRAC setting` để tiến hành cài đặt netwwork và user để tiến hành quản lý `IDRAC` trên trình duyệt web

![Alt](/thuctap/anh/Screenshot_464.png)

- Ta chọn vào `network` rồi tiến hành cài IP như trong hình để server có thể sử dụng IP giao tiếp

![Alt](/thuctap/anh/Screenshot_465.png)

- Ta tiến hành cài đặt tài khoản và mật khẩu để truy cập IDRAC bằng trình duyệt trên máy

![Alt](/thuctap/anh/Screenshot_466.png)

- Ta tiến hành thoát IDRAC để lưu cấu hình

- Để có thể truy cập cập bằng trình duyệt thì ta phải nối dây cat5e vào 1 đầu `IDRAC` và đầu vào card mạng của máy chúng ta

![Alt](/thuctap/anh/Screenshot_467.png)

- Tiến hành đặt IP cho máy tính và IDRAC cùng dải mạng

![Alt](/thuctap/anh/Screenshot_468.png)

- Bây giờ ta tiến hành truy cập vào trình duyệt trên máy tính bằng địa chỉ IP vừa tạo trên IDRAC với tài khoản và mật khẩu vừa thiết lập, và đây là kết quả:

![Alt](/thuctap/anh/Screenshot_470.png)

![Alt](/thuctap/anh/Screenshot_469.png)

## Một số tính năng trong IDRAC
- Thông tin tổng quan về server
    ![Alt](/thuctap/anh/Screenshot_505.png)
    - Nó sẽ cung cấp cho ta cái nhìn tổng quan về server gồm pin , nhiệt độ, CPU, thông báo trên front panel ,bảo mật ,ram , card mạng và nguồn
    - Ở trên hình do thiếu 1 ngồn nên bị báo đỏ , chỉ cần ta lắp nguônf vào là sẽ hết

- Sửa lỗi không hiển thị CPU 2:

    ![Alt](/thuctap/anh/Screenshot_506.png)
    - Do khi mới lắp thêm CPU thì máy trên idrac sẽ không hiển thị và ta cần bật tính năng cho phép khám phá trên IDRAC lên thì sẽ nhận được đầy đủ thông tin

    ![Alt](/thuctap/anh/Screenshot_507.png)

- Log gần đây và Remote từ xa:

    ![Alt](/thuctap/anh/Screenshot_508.png)

- Shutdown, Reset server:

    ![Alt](/thuctap/anh/Screenshot_509.png)

- Trạng thái storage :

    ![Alt](/thuctap/anh/Screenshot_510.png)

- tính năng quan trọng : virtual console, tính năng cho phép ta thao tác từ xa mà giống như đang cắm trực tiếp vào server để thực hiện vậy

    ![Alt](/thuctap/anh/Screenshot_511.png)
    - Ví dụ ta muốn cài os thì ta sẽ cắm usb có chứa OS và máy tính rồi tạo virtual usb rồi bắt đầu cài. Server lúc này sẽ coi như là đang có 1 usb chứa OS đang cắm trực tiếp vậy . Từ đây ta có thể tiến hành cài OS
