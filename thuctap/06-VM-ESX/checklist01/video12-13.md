# vCenter install , Configure, Manage
## 1. Kiến trúc của vCenter
![Alt](/thuctap/anh/Screenshot_975.png)

- Ta sẽ là người dùng ở vSphere Client sau đó cần đi qua vCenter server 
- Vcenter server sẽ sử dụng database rồi SSO kết hợp ADD rồi mới quản lý ESXi host
# 2. Cài đặt vCenter
https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/06-VM-ESX/qua-trinh-trien-khai/02.vCenter.md
# 3. Cách sử dụng vCenter client
- Giao diện khi ta đăng nhập thành công 
  
  ![Alt](/thuctap/anh/Screenshot_976.png)

- Công dụng của các shortcut
  ![Alt](/thuctap/anh/Screenshot_977.png)

- Host and Cluster: Khi bạn bấm vào giao diện này nó sẽ đưa bạn đến trang quản lý host, cluster và data center. Bạn có thể thêm host, xóa host, hay là các thao tác đối với cluster và data center tạo đây
- VM and template : Bấm vào đây sẽ đưa bạn đến trang quản lý máy ảo và template , nó sẽ liệt kê chi tiết cho bạn toàn bộ VM đang bật ,tắt và các template
- Storage : Bấm vào đây nó sẽ đưa bạn đến trang quản lý storage, tất cả storage của các host sẽ được liệt kê tại đây kể cả storage của từng host chung SAN hay không
- Networking : Đưa bạn đến giao diện quản lý toàn bộ mạng của vCenter. Nó sẽ liệt kê ra cả vDS và vSS. Nếu vSS của riêng mỗi host nào đó cũng sẽ được liệt kê ra
- Content library : Đầy là thư viện dùng để lưu trữ các file dùng chung cho tất cả các host, các tài nguyên sẽ được lưu trữ trên vCenter, Chỉ cần các host có thể liên lạc được với vCenter thì có thể sử dụng tài nguyên này
- Global inventory lists: Nó giúp bạn xem toàn bộ danh sách đối tượng của vm vsphere bao gồm ESXi, máy ảo, storage, 
- Workload management : Quản lý phân phối tác vụ xem thành phần này phải làm gì
# 4. Các Object trên vCenter
|Từ khóa| Viết tắt|Tác dụng|
|---|---|---|
|VAMI| vSphere Appliance Management Interface| giao diện quản lý được tích hợp sẵn trong các phiên bản của VMware vCenter Server Appliance (VCSA)|
|Datacentres| |Là trung tâm dữ liệu quản lý tất cả các máy tính và cơ sở hạ tầng |
|Host & Cluster||Host là các máy chủ vật lý <br> Tập hợp các host có chung mục đích lại quản lý là cluster|
|VMs & Template||VM là máy ảo <br> template là mẫu khi ta dụng các máy ảo mới sẽ giống hệt template|
|Storage :VMFS , NFS|VMFS (Virtual Machine File System) <br> NFS (Network File System)| VMFS : là 1 dạng lưu trữ dữ liệu theo máy ảo <br> NFS: là một dạng lưu trữ được gọi đến thông qua kết nối internet|
|Content Library||Là một thư viện đặc biệt lưu trữ các file mà tất cả các host hay cluster hay datacenter đều có thể dùng chung|
|Global inventory lists||Quản lý toàn bộ hệ thống vmware kết nối đến vcenter|
|Task console| | Nơi lưu trữ lịch sử các task đã thực hiện cả lỗi và thành công|
|event console| |Nơi lưu trữ lịch sử các sự kiện xảy ra với host như shutdown hay lỗi|
|VM customization spec|VM customization specification|là một tập hợp các cài đặt và cấu hình được sử dụng để tùy chỉnh các máy ảo khi chúng được triển khai từ template hoặc khi chúng được tạo mới. Ta có thể sử tên,IP, DNS,... cho máy ảo|
|VM Storage Policy|  |tạo ra một cơ chế tự động hóa cho việc cấu hình các dịch vụ lưu trữ, nhằm đảm bảo rằng các yêu cầu của ứng dụng hoặc máy ảo được đáp ứng đúng cách|
|Host Profile|| Nó cho phép bạn định nghĩa một bản mẫu cấu hình máy chủ ESXi chính xác và sau đó áp dụng nó tự động cho các máy chủ ESXi khác trong cùng một cụm hoặc mạng lưới.|
|LCM|Lifecycle Management| quản lý và kiểm soát các phiên bản, cập nhật, bản vá, và các thay đổi liên quan đến một sản phẩm hoặc hạ tầng kỹ thuật. Quản lý vòng đời bao gồm các giai đoạn từ phát triển, triển khai, hoạt động, duy trì và rút gọn.|
|licensing management| |Quản lý giấy phép hoạt động, để sử dụng VMware bạn cần license từ nhà sản xuất|
