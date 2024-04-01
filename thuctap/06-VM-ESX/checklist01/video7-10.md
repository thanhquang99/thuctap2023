- [1. Các tính năng Network trong ESXi](#1-các-tính-năng-network-trong-esxi)
- [2. Khái niệm ESXi Networking](#2-khái-niệm-esxi-networking)
  - [2.1 Physical switch](#21-physical-switch)
  - [2.2 Physical network và virtual network](#22-physical-network-và-virtual-network)
  - [2.3 vSphere Standard switch (vSS) hay vSwitch](#23-vsphere-standard-switch-vss-hay-vswitch)
  - [2.4 vSwitch group port](#24-vswitch-group-port)
  - [2.5 Cấu trúc Network của ESXi](#25-cấu-trúc-network-của-esxi)
  - [2.6 Các loại virtual switch](#26-các-loại-virtual-switch)
- [3. Thực hành với vSS](#3-thực-hành-với-vss)
- [4. vSwitch policy](#4-vswitch-policy)
  - [4.1 Security](#41-security)
  - [4.2 NIC teaming](#42-nic-teaming)
  - [4.3 Traffic shaping](#43-traffic-shaping)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# 1. Các tính năng Network trong ESXi
Ta có thể tạo máy ảo trong ESXi và sẽ có chọn adapter type 
![Alt](/thuctap/anh/Screenshot_966.png)
- Phiên bản mô phỏng của Intel 82574 Gigabit Ethernet NIC. E1000E là bộ điều hợp mặc định cho Windows 8 và Windows Server 2012.
- E1000 : Phiên bản mô phỏng của Intel 82545EM Gigabit Ethernet NIC, với trình điều khiển có sẵn trong hầu hết các hệ điều hành khách mới hơn, bao gồm Windows XP trở lên và phiên bản Linux 2.4.19 trở lên.
- VMXNET 3: Tối ưu hóa hiệu suất trong máy ảo và không có bản sao vật lý. 
- SR-IOV passthrough: Biểu diễn chức năng ảo (VF) trên NIC vật lý có hỗ trợ SR-IOV. Máy ảo và bộ điều hợp vật lý trao đổi dữ liệu mà không sử dụng VMkernel làm trung gian. Loại bộ điều hợp này phù hợp với các máy ảo có độ trễ có thể gây ra lỗi hoặc yêu cầu nhiều tài nguyên CPU hơn.
# 2. Khái niệm ESXi Networking
## 2.1 Physical switch
- Physical switch là một thiết bị vật lý dùng để kết nối các thiết bị với môi trường mạng 
- Physical ethernet switch quản lý lưu lượng mạng giữa các máy trên mạng vật lý
- Một switch có nhiều cổng và mỗi cổng có thể kết nối được với một máy hoặc 1 switch khác trên mang
- Mỗi port có thể có cấu hình riêng để hoạt động với như cầu của người dùng
- Switch là cốt lõi mạng vật lý, ta có thể kết hợp nhiều switch lại để tạo thành một mạng lớn hơn
## 2.2 Physical network và virtual network
- Physical network: Những máy vật lý sẽ được kết nối mạng với nhau từ đó có thể truyền nhận data giữa chúng. VMware ESXi sẽ chạy trên máy vật lý
- Virtual network: Tương tự như các máy thật thì các máy ảo cũng được kết nối với nhau nhưng kiểu kết nối này không phải là nối dây mà là một kiểu kết nối logic để từ đó các máy ảo có thể giao tiếp được với nhau
- Máy ảo có thể kết nối đến virtual network , và mạng ảo trong ESXi thì ta có thể tạo thêm ra tùy ý
## 2.3 vSphere Standard switch (vSS) hay vSwitch
- Hầu hết chức năng có trên physical switch thì vSS đều sẽ có hết
- vSwwitch có thêm 1 tác dụng tạo kết nối giữa NIC vậy lý và NIC ảo 
  ![Alt](/thuctap/anh/Screenshot_967.png)
  - Nhìn vào hình ta sẽ hiểu rằng, máy chủ vật lý đang có duy nhất 1 NIC thật và mỗi 1 NIC thật sẽ được chuyển đổi thành NIC ảo với tên phù hợp của ESXi và ta sẽ xác định nó thông qua địa chỉ MAC
- Virtual switch có thể kết nối giữa 2 máy chủ trong cùng 1 host ESXi hoặc khác host ESXi
  - Ta sẽ hiểu rằng 2 con switch ảo này được kết nối với nhau qua 1 physical switch và mọi kết nối phải được thực hiện theo cấu hình của physical switch
- Một số tính năng mà vSwwitch không có
  - Tạo VLAN (chỉ có thể thừa hưởng các VLAN từ physical switch)
  - 2 vSwitch không thể kết nối trực tiếp với nhau
## 2.4 vSwitch group port
- Có nhưng lúc ta cần chia các dải mạng quản lý các nhóm máy ảo hay chia các dải mạng để quản lý từng chức năng của dải mạng ấy. Việc chia các dải mạng ra với mỗi chức năng riêng cũng chính là chia ra các group port
- Mỗi group port nên đảm nhận vai trò khác nhau và VLAN ID khác nhau để khi máy ảo nào cần chức năng gì thì nỗi card mạng sẽ được gắn với group port có chức năng đó
- VM kernal group port :Đây là một loại group port đặc biệt nó dùng để quản lý network của cả ESXi. Một vài chức năng có thể kể đến như: IP storage, vMotion, SAN, FT
## 2.5 Cấu trúc Network của ESXi 
![Alt](/thuctap/anh/Screenshot_968.png)
- Nhìn vào hình ảnh trên ta thấy mỗi NIC sẽ cần phải cho nhiều VLAN đi qua nên ta cần cấu hình trunking trên mỗi port của physical switch
## 2.6 Các loại virtual switch
- Standard switch (vSS):
  - có trên ESXi ,chức năng chuyển đổi ảo cho máy chủ
- Distributed switch (vDS):
  - Là mộ chuyển mạch phân tán, được cấu hình cho toàn bộ trung tâm dữ liệu
  - có thể gắn tối đa 2000 host vào vDS
  - cấu hình nhất quán trên các host
  - cần có giấy phép Enterprise hoặc thuộc cụm VSAN
# 3. Thực hành với vSS
Bài này mình đã thực hành rồi các bạn có thể tham khảo [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/06-VM-ESX/Ly-thuyet/02.networking.md#2-networking)

# 4. vSwitch policy
![Alt](/thuctap/anh/Screenshot_969.png)
- Trên mỗi vSwitch ta có thể kêt hợp nó với các chính sách và buộc vSwitch phải tuân thủ
- Ta sẽ chia 

## 4.1 Security
- Promiscuous mode : 
  - Bình thường mỗi card mạng ảo chỉ có thể nhìn thấy được được các gói tin được gửi đến nó 
  - Nhưng khi Promiscuous Mode được bật, card mạng có thể "nghe" và "nhìn" qua tất cả các gói tin mạng trên mạng vật lý.
  - Việc bật chế độ này sẽ có mục đích kiểm tra và phân tích mạng, giám sát giao thông mạng, phát hiện tấn công mạng
  - Nhưng khi bật chế độ này cũng sẽ tạo ra các vấn đề liên quan đến bảo mật như quá trình nhận gói tin quá nhiều khó khống chế, Cần phải cân nhắc cẩn thận
- MAC address changes: 
  - Khi MAC Address Changes được bật, máy ảo có quyền thay đổi địa chỉ MAC của card mạng ảo của nó một cách tự động. Điều này có thể xảy ra khi máy ảo được sao chép hoặc di chuyển đến một môi trường mạng khác.
  - Việc cho phép thay đổi địa chỉ MAC một cách tự động có thể tạo ra rủi ro về bảo mật, như sự xâm nhập không mong muốn vào mạng hoặc sự đụng độ địa chỉ MAC
- Forged transmits:
  - Khi Forged Transmits được bật, máy ảo có quyền gửi các gói tin mạng với địa chỉ MAC không đúng.
  - Điều này có thể xảy ra trong trường hợp máy ảo cần gửi gói tin dựa trên một cấu hình mạng cụ thể (chẳng hạn, di chuyển máy ảo giữa các mạng vật lý)
## 4.2 NIC teaming
NIC teaming là chức năng cho phép ta gộp các NIC vật lý vào thành 1 giúp tăng băng thông và cũng có thể dụ phong các trường hợp 1 NIC bị hỏng thì có NIC khác thay thế

Một vài chức năng:
- Load balancing: Cân bằng tải
  - Route based on IP hash:
    - Trong chế độ này, ESXi sử dụng thông tin về địa chỉ IP nguồn và đích của gói tin để tạo ra một hash value.
    - Hash value này sau đó được sử dụng để xác định card mạng mà gói tin sẽ được chuyển tiếp qua.
    - Loại route này giúp đảm bảo rằng các gói tin từ một cặp địa chỉ IP cụ thể sẽ luôn được gửi qua cùng một card mạng trong nhóm, tạo ra một phân phối cân bằng tải dựa trên địa chỉ IP.
  - Route based on source MAC hash:
    - Chế độ này tương tự như IP hash nhưng nó sẽ xác định hash value bằng địa chỉ MAC
  - Route based on the originating virtual port ID:
    - Đây là chế độ cân bằng tải mặc định cho NIC teaming trong ESXi.
    - Trong chế độ này, ESXi sẽ xác định các gói tin mạng dựa trên ID của cổng ảo gốc mà gói tin được tạo ra.
    - Mỗi máy ảo sẽ được gán một cổng ảo gốc duy nhất, và các gói tin mạng từ mỗi máy ảo sẽ được chuyển qua một card mạng trong nhóm, tạo ra một sự phân phối cân bằng tải tự động.
  - Failover only:
    - Trong chế độ này, chỉ có một card mạng sẽ hoạt động, và các card mạng khác sẽ ở chế độ chờ đợi.
    - Nếu card mạng hoạt động gặp sự cố, ESXi sẽ tự động chuyển sang sử dụng card mạng khác để duy trì kết nối mạng.
- Network failover detection: quyết định cách mà ESXi phát hiện và phản ứng khi một lỗi kết nối mạng xảy ra trên một card mạng.
  - Link Status Only: 
    -  ESXi chỉ sử dụng trạng thái liên kết (link status) của card mạng để phát hiện lỗi.
    -  ESXi sẽ kiểm tra trạng thái liên kết của card mạng, và nếu thấy trạng thái liên kết thay đổi (ví dụ: từ Up thành Down), nó sẽ kích hoạt các biện pháp phản ứng, như chuyển dữ liệu sang các card mạng khác trong nhóm
 - Beacon only : 
   - Trong cài đặt này, ESXi sử dụng gói tin "beacon" để kiểm tra trạng thái của mạng
   - ESXi gửi các gói tin beacon qua các card mạng và theo dõi phản hồi. Nếu không nhận được phản hồi từ card mạng hoặc không ghi nhận được các gói tin beacon trong khoảng thời gian nhất định, nó sẽ xem xét card mạng đó là có vấn đề và kích hoạt các biện pháp phản ứng
- Notify switches: ESXi sẽ gửi thông báo (notifications) đến switch mạng khi có các sự kiện quan trọng xảy ra
- Failback:  tự động chuyển lại lưu lượng mạng về card mạng gốc sau khi card mạng đó đã hồi phục sau một sự cố.
- Failover order: là một tính năng quan trọng quy định thứ tự ưu tiên mà các card mạng trong nhóm sẽ được sử dụng khi một sự cố xảy ra và cần phải chuyển lưu lượng mạng từ card mạng đang gặp sự cố sang một card mạng khác
  - Active adapters: Trong tùy chọn này, chỉ có các card mạng được xác định là "active" mới được sử dụng để chuyển lưu lượng mạng khi một sự cố xảy ra trên card mạng hiện tại.
  - Standby adapters: Trong tùy chọn này, các card mạng được đánh dấu là "standby" sẽ chỉ được sử dụng khi không có card mạng "active" nào khả dụng
## 4.3 Traffic shaping
- Traffic shaping là một kỹ thuật trong mạng máy tính được sử dụng để kiểm soát và quản lý lưu lượng dữ liệu đi và đến qua một giao diện mạng hoặc một đường truyền
- Mục tiêu chính của traffic shaping là tối ưu hóa việc sử dụng băng thông mạng và cải thiện hiệu suất mạng bằng cách kiểm soát tốc độ truyền dữ liệu.
- Average bandwidth: Tổng lưu lượng truyền qua 1 giao diện mạng trong 1 đơn vị thời gian
- Peak bandwidth : h là mức độ tối đa của lưu lượng dữ liệu mạng mà một giao diện mạng hoặc một đường truyền có thể chịu đựng trong một khoảng thời gian ngắn nhất định
- Burst size : là một thuật ngữ thường được sử dụng trong mạng máy tính để chỉ đến số lượng gói tin hoặc dữ liệu mà một thiết bị hoặc một ứng dụng có thể truyền hoặc nhận trong một khoảng thời gian ngắn nhất định 

# Tài liệu tham khảo
https://kb.vmware.com/s/article/1001805

https://www.youtube.com/watch?v=3YHTEkaizT0&list=PLjsBan7CwUQAFA9m2dYEL2FmeRdRiyWBD&index=7