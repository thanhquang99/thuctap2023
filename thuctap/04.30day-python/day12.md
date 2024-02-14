# Ngày 12 học python
## 1. Module là gì?
- Là một tệp chứa một bộ code hoặc một bộ Function có thể được đưa vào một ứng dụng. Module có thể là một tệp chứa một biến duy nhất hoặc một hàm, một code base lớn.
- Module ta có thể hiểu như 1 file mới và được tham gia trong quá trình chạy của file tổng
## 2. Cách tạo module
- Để tạo một Module, viết mã trong một tệp python và nó lưu dưới dạng mymodule.py.
```
# Trong my_module.py
def my_function():
    print("Hello from my_function in my_module")

variable_in_module = 42
```
## 3. Import Module:
```
# Import toàn bộ module
import my_module

# Sử dụng hàm từ module
my_module.my_function()

# Sử dụng biến từ module
print(my_module.variable_in_module)
```
## 4. Một số module tích hợp có sẵn
- Giống như các ngôn ngữ lập trình khác, chúng ta cũng có thể nhập mô-đun bằng cách nhập tệp/chức năng bằng từ khóa import
- Một số mô-đun tích hợp phổ biến: math, datetime, os,sys, random, statistics, collections, json,re
### 4.1 OS Module
-  Có thể tự động thực hiện tác vụ của hệ điều hành. OS module cung cấp các chức năng để tạo, thay đổi thư mục làm việc hiện tại và xóa thư mục(folder), Tìm nạp nội dung của nó, thay đổi xác định thư mục hiện tại.
```
# import the module
import os
# Tạo thư mục
os.mkdir('directory_name')
# thay đổi đường dân của thư mục hiện tại
os.chdir('path')
# Lấy thư mục làm việc hiện tại
os.getcwd()
# xóa thư mục
os.rmdir()
```
### 4.2 Math Module
- Cung cấp các hàm toán học.
```
import math
print(math.pi)           # 3.141592653589793, pi constant
print(math.sqrt(2))      # 1.4142135623730951, square root
print(math.pow(2, 3))    # 8.0, exponential function
print(math.floor(9.81))  # 9, rounding to the lowest
print(math.ceil(9.81))   # 10, rounding to the highest
print(math.log10(100))   # 2, logarithm with 10 as base
```
### 4.3 random module 
- Cung cấp các hàm liên quan đến số ngẫu nhiên.
```
import random

# Ví dụ: lấy một số ngẫu nhiên trong khoảng từ 1 đến 10
result = random.randint(1, 10)
```
### 4.4 sys module
- Cung cấp các chức năng tương tác với trình thông dịch Python.
```
import sys

# Ví dụ: in đường dẫn đến trình thông dịch Python
print(sys.executable)
```
### 4.5 Statistics Module
- Cung cấp các function để thống kê toán học của dữ liệu số. các function thống kê phổ biến được định nghĩa trong module này: mean, median, mode, stdev,v.v
```
from statistics import * # importing all the statistics modules
ages = [20, 20, 4, 24, 25, 22, 26, 20, 23, 22, 26]
print(mean(ages))       # ~22.9
print(median(ages))     # 23
print(mode(ages))       # 20
print(stdev(ages))      # ~2.3
```
### 4.6 String Module
- Mô-đun chuỗi là một mô-đun hữu ích cho nhiều mục đích. Ví dụ dưới đây cho thấy một số cách sử dụng mô-đun chuỗi.
```
import string
print(string.ascii_letters) # abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
print(string.digits)        # 0123456789
print(string.punctuation)   # !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
```
## 5. Bài tập
1. Viết hàm tạo ra Random_user_id gồm sáu chữ số/ký tự
```
import random

def generate_random_user_id(length=6):
    # Sử dụng vòng lặp for để sinh ngẫu nhiên các số từ 0 đến 9 và kết hợp chúng thành chuỗi
    random_user_id = ''.join(str(random.randint(0, 9)) for _ in range(length))
    
    return random_user_id

# Sử dụng hàm để tạo một Random_user_id
user_id = generate_random_user_id()
print("Random_user_id:", user_id)
```
- Lưu ý cần hàm join để có thể liên kết các kí tự ramdom thành một chỗi
2. Viết hàm trả về một mảng gồm bảy số ngẫu nhiên trong phạm vi từ 0-9. Tất cả các số phải là duy nhất.
```
import random

def generate_unique_numbers():
    # Tạo một mảng rỗng để chứa các số ngẫu nhiên duy nhất
    unique_numbers = []

    while len(unique_numbers) < 7:
        # Sinh ngẫu nhiên một số từ 0 đến 9
        random_number = random.randint(0, 9)

        # Kiểm tra xem số đã tồn tại trong mảng chưa
        if random_number not in unique_numbers:
            # Nếu chưa tồn tại, thêm vào mảng
            unique_numbers.append(random_number)

    return unique_numbers

# Gọi hàm để tạo một mảng gồm bảy số ngẫu nhiên duy nhất
result = generate_unique_numbers()
print("Unique Numbers:", result)
```