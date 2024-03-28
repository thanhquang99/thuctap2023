# Bảng các tính năng của VMware
|Tên tính năng| Tác dụng|
|---|---|
|VMs| Tạo máy ảo|
|Snapshot|Lưu lại cấu hình của máy ảo trước khi thực hiện thay đổi cấu hình tránh sự sai sót|
|Clone| Tạo ra một bản sao của máy ảo từ template hiện có|
|Resource Pool| Nó cho phép bạn quản lý và phân phối tài nguyên máy chủ ảo (vCPU, bộ nhớ, và băng thông) cho các máy ảo trong một cụm máy chủ ảo|
|vApps (Virtual Applications)|Nếu bạn có một ứng dụng hoặc một nhóm ứng dụng liên quan đến nhau, bạn có thể đóng gói chúng lại thành một vApp để quản lý và triển khai chúng dễ dàng hơn|
|Scheduled Tasks| lên lịch các tác vụ tự động để thực hiện các hoạt động nhất định vào thời điểm cụ thể. Các tác vụ lên lịch này có thể bao gồm sao lưu dữ liệu, di chuyển máy ảo, quét máy chủ ...|
|Developer Center|Developer Center sẽ cung cấp cho bạn các công cụ như API Documentation, Sample Code để giúp tích hợp chúng vào VMware|
|vDS (virtual Distributed Switch)|là một switch dùng để quản lý Network của tất cả các host một các đồng nhất và tập trung , chỉ có trên vCenter|
|Cold migration| Là chế độ tắt máy ảo đi rồi mới di chuyển nó từ host này sang host khác|
|vMotion|với chế độ này ta không cần tắt máy mà vẫn có thể di chuyển máy ảo được|
|Storage vMotion| cho phép di chuyển máy ảo (VM) từ một Datastore sang một Datastore khác mà không làm gián đoạn hoạt động của máy ảo|
|HA (High Availability)| cung cấp khả năng tự động khôi phục dịch vụ ảo hóa trong trường hợp máy chủ vSphere hoặc các máy ảo trên đó gặp sự cố. |
|DRS (Distributed Resource Scheduler)|DRS sử dụng các thuật toán thông minh để di chuyển các máy ảo giữa các máy chủ ảo trong cụm, dựa trên các yếu tố như tải CPU, tải bộ nhớ, và loadbalancing|
|storage DRS| Tương tự như DRS nhưng nó không quản lý RAM, CPU mà việc nó quan tâm đến là disk|
|FT (Fault Tolerance)|cho phép máy ảo (VM) tự động chuyển giao ứng dụng và dịch vụ từ máy chủ ảo gốc sang máy chủ ảo sao chép trong trường hợp máy chủ ảo gốc gặp sự cố.|
|EVC (Enhanced vMotion Compatibility)|Giúp đảm bảo khả năng tương thích giữa các máy chủ trong VMware trong các trường hợp có phiên bản CPU khác nhau trên các máy chủ|
|DPM (Distributed Power Management)| giúp tối ưu hóa việc sử dụng năng lượng bằng cách tự động tắt hoặc bật máy chủ ảo dựa trên nhu cầu thực tế của tài nguyên và các máy ảo trong cụm máy chủ.|
|VCenter Storage Monitoring|cho phép bạn theo dõi và quản lý hiệu suất và dung lượng của các Datastore trong môi trường ảo hóa của bạn từ giao diện quản lý vCenter.|
|vCenter Hardware Monitoring |cho phép theo dõi và quản lý hiệu xuất phần cứng như CPU, bộ nhớ, ổ đĩa và các thiết bị mạng.|
|Service Status & Alarm| giám sát trạng thái của các dịch vụ và thiết bị trong môi trường ảo hóa của mình và tạo cảnh báo khi có sự cố xảy ra.|
|Thin Provisioned Disk| khi sử dụng chế độ này thì máy ảo sử dụng đến đâu thì mới được cấp disk bằng đấy|
|Eager Zeroed Thick| khi sử dụng chế độ này lúc bật máy lên thì sẽ sử dung toàn bộ tài nguyên disk đã khai báo khi tắt máy đi thì giống như thin|
|Lazy Zeroed Thick| khi sử dụng chế độ này toàn bộ tài nguyên disk đã khai báo sẽ được sử dụng kể cả khi tắt máy đi|
|certificate management| Quản lý các chứng chỉ SLL cho quá trình sử dụng https|
|tags & custom astribute|Tags là cách để gắn nhãn các đối tượng trong môi trường vSphere để phân loại chúng theo các tiêu chí cụ thể.<br> Custom Attributes cho phép bạn tạo các thuộc tính tùy chỉnh (với giá trị cụ thể) và gắn chúng cho các đối tượng trong môi trường vSphere|
|roles và permissions|Roles xác định các tập hợp các quyền và chức năng cụ thể mà một người dùng hoặc nhóm người dùng có thể thực hiện trong môi trường vSphere <br> Permissions xác định quyền truy cập cụ thể mà một người dùng hoặc nhóm người dùng có trong môi trường vSphere.