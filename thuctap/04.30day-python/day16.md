# Ngày 16 học python
## 1. Tìm hiểu về ngày giờ trong python
- python có module datetime để xử lý ngày giờ
  ```
  import datetime
  now = datetime.datetime.now() # Lấy ngày giờ hiện tại
  today = now.month # Lấy ngày hiện tại. Ta có thể thay đổi dể lấy month ,year, hour, minute, second
  print(today)
  timestamp = now.timestamp() # timestamp là lấy dấu thời gian. Dùng để đánh dấu môc thời gian sau đó so sánh
  print('timestamp', timestamp)
  custom_date = datetime.datetime(2022, 10, 1, 12, 30, 45) # Tạo đối tượng thời gian tùy ý
  ```
- Định dạng thời gian bằng hàm strftime : dùng để định nghĩa cấu trúc in ra thời gian
  ```
  import datetime
  now = datetime.datetime.now()
  # Định dạng theo chuỗi năm-tháng-ngày giờ:phút:giây
  formatted_time = now.strftime("%Y-%m-%d %H:%M:%S")
  print("Thời gian định dạng:", formatted_time)
  ```
- chuyển kí tự thành thời gian bằng hàm strptime
  ```
  import datetime
  date_string = "5 December, 2019"
  date_object = datetime.datetime.strptime(date_string, "%d %B, %Y")
  print(date_object)
  ```
- Ta có thể cộng trừ thời gian để tìm ra sự khác biệt giữa các mốc thời gian
  ```
  import datetime
  time1 = datetime.datetime(2022, 1, 1, 12, 0, 0)
  time2 = datetime.datetime(2022, 1, 2, 12, 0, 0)
  time_difference = time2 - time1
  print(time_difference)
  ```
- Ta có thể sử dụng hàm timedelat để liệt kê ra số giờ, số phút 1 cách cụ thể
  ```
  import datetime
  t1 = datetime.timedelta(weeks=12, days=10, hours=4, seconds=20)
  t2 = datetime.timedelta(days=7, hours=5, minutes=3, seconds=30)
  t3 = t1 - t2
  print(t3)
  ```
