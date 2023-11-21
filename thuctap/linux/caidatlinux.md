- [Hướng dẫn cài đặt centos 7](#hướng-dẫn-cài-đặt-centos-7)
  - [Tìm hiểu trước khi cài đặt centos 7](#tìm-hiểu-trước-khi-cài-đặt-centos-7)
  - [Cài đặt OS centos 7 vào VMware worksation](#cài-đặt-os-centos-7-vào-vmware-worksation)
- [Cài đặt OS ubuntu-server vào VMware worksation](#cài-đặt-os-ubuntu-server-vào-vmware-worksation)
- [Hướng dẫn cài đặt centos 8(hoặc 9)](#hướng-dẫn-cài-đặt-centos-8hoặc-9)

# Hướng dẫn cài đặt centos 7
## Tìm hiểu trước khi cài đặt centos 7
- Centos 7 có rất nhiều bản như DVD, minimal,evething. Làm sao để ta biết mình phù hợp với cái gì?
  - Minimal :Nó chưa các file yêu cầu tối thiểu của hệ thống linux, và đặc biệt không chứ GUI(Giao diện người dùng)
  - DVD :Nó chứa các gói tối thiểu + gói tiện ích + gói pháp triển cơ bản và có thêm GUI
  - Evething :Nó chứa tất car mọi thứ của DVD cộng thêm với gói hỗ trợ người dùng nâng cao như hỗ trợ thẻ thông minh, bộ gói phát triển 

- Cài đăt VMware workstation 
https://www.vmware.com/content/vmware/vmware-published-sites/us/products/workstation-pro/workstation-pro-evaluation.html.html
- Tải file centos7 
https://www.centos.org/download/
- Lưu ý :khi tải xong ta có thể lên web tìm key để sử dụng vmware workstation
## Cài đặt OS centos 7 vào VMware worksation
Lưu ý có 2 cách cài là `typical` và `custom`. ở custom ta có sẽ có nhiều tùy chỉnh hơn nhưng để demo cơ bản tôi chọn `typical`

- Ta chọn vào file và bấm vào new vitualmachine hoặc `ctrl +N`

  ![Alt](/thuctap/anh/Screenshot_112.png)
- Ta chọn file centos vừa tải vào 

 ![Alt](/thuctap/anh/Screenshot_117.png)

 - Tiếp theo ta chọn memory cho máy (tôi để mặc định là 20GB) rồi nó sẽ chuyển ta đến màn hình

![Alt](/thuctap/anh/Screenshot_118.png)
- Lúc này ta làm như cài win bình thường như cài đặt ngôn ngữ ...

![Alt](/thuctap/anh/Screenshot_119.png)
- Ta phải add disk vào để máy ảo có thể dùng bộ ở disk để chạy
![Alt](/thuctap/anh/Screenshot_120.png)
- Tiến hành cài đặt password root và user
![Alt](/thuctap/anh/Screenshot_121.png)
- Việc còn lại của chúng ta là chờ đợi thôi

- Lưu ý : 
  - tài khoản root: chính là tài khoản có quyền cao nhất làm được việc cao nhất như thêm, sửa, xóa user hay file
  - Tài khoàn user: Là tài khoản cấp thấp chỉ được xem ,một số chức năng quan trọng bị cấm

# Cài đặt OS ubuntu-server vào VMware worksation

  ![Alt](/thuctap/anh/Screenshot_122.png)
  ![Alt](/thuctap/anh/Screenshot_123.png)
  ![Alt](/thuctap/anh/Screenshot_124.png)
  ![Alt](/thuctap/anh/Screenshot_125.png)
- Ta dùng enter và mũi tên để tiến hành cài đặt và done hết các yêu cầu như cài win
- Lưu ý : Trên ubuntu ta không thể đăng nhập vào root như centos ,nên khi ta thiết lập password cho user ban đầu ta mặc định nó là password root luôn và khi ta muốn dùng quyền root thì ta sử dụng lệnh `sudo su` và nhập pass root vào

![Alt](/thuctap/anh/Screenshot_126.png)
- Việc tiếp theo chúng ta cần làm là chờ đợi thôi

# Hướng dẫn cài đặt centos 8(hoặc 9)
- Để cài centos 8 hoặc 9 thì ta lênt trang chủ [download](https://www.centos.org/download/) và lưu ý rằng centos 8(9) chỉ có 2 cách cài là cài bằng chế độ boot hoặc tải DVD về cài
- cài bằng chế độ boot thì yêu cầu máy tính (hay vmware) phải có internet vì cài theo chế độ này thì ta sẽ theo kiểu boot file từ internet về chứ file không tồn tại trong máy
- Cài bằng chế độ DVD thì ta sẽ phải tải file lên tới 12G về máy và tiến hành cài đôi lúc sẽ gây ra sự lãng phí tài nguyên như khi ta chỉ cần sử dụng bản minimal chẳng hạn

![Alt](/thuctap/anh/Screenshot_161.png)
![Alt](/thuctap/anh/Screenshot_162.png)
![Alt](/thuctap/anh/Screenshot_163.png)
![Alt](/thuctap/anh/Screenshot_164.png)
![Alt](/thuctap/anh/Screenshot_165.png)
