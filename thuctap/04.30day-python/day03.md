# Day 3 Python
## Biến Boolean
- Đây là kiểu biến đại diện cho đúng hoặc sai và nó sẽ nhận 2 giá trị là `True` hoặc `False` 
- Ví dụ
  ```
    is_sunny = True

    if is_sunny:
        print("It's a sunny day!")
    else:
        print("It's not sunny today.")
  ```
## Các toán tử 
- Bảng toán tử số học

| Phép Toán | Ví Dụ     | Tương Đương  |
|------------|-----------|---------------|
| `=`        | `x = 5`   | `x = 5`       |
| `+=`       | `x += 3`  | `x = x + 3`   |
| `-=`       | `x -= 3`  | `x = x - 3`   |
| `*=`       | `x *= 3`  | `x = x * 3`   |
| `/=`       | `x /= 3`  | `x = x / 3`   |
| `%=`       | `x %= 3`  | `x = x % 3`   |
| `//=`      | `x //= 3` | `x = x // 3`  |
| `**=`      | `x **= 3` | `x = x ** 3`  |

- Bảng toán tử liên quan đến nhị phân
  
|phép toán   |ví dụ      |tương đương    |
|------------|-----------|---------------|
| `&=`       | `x &= 3`  | `x = x & 3`   |
| `|=`       | `x |= 3`  | `x = x | 3`   |
| `^=`       | `x ^= 3`  | `x = x ^ 3`   |
| `>>=`      | `x >>= 3` | `x = x >> 3`  |
| `<<=`      | `x <<= 3` | `x = x << 3`  |

  - Ví dụ:
    - x=10=1010; 3=0011 thì thực hiện phép toán and (hai vị trí cùng kết quả) sẽ là 0010
    - x=10=1010; 3=0011 thì thực hiện phép toán xor (hai vị trí so le kết quả) sẽ là 1001
    - x=10=1010; x<<3 thì thực hiện phép toán left (dịch chuyển bit sang trái 3 vi trí) sẽ là 1010000= 80
    - x=10=1010; x>>3 thì thực hiện phép toán right (dich chuyển các bit sang phải 3 vị trí là ) sẽ là 0001=1

- Bảng tían tử so sánh 

| Toán Tử | Tên                         | Ví Dụ        |
|----------|-----------------------------|--------------|
| `==`     | Equal (Bằng nhau)           | `x == y`     |
| `!=`     | Not equal (Không bằng nhau) | `x != y`     |
| `>`      | Greater than (Lớn hơn)      | `x > y`      |
| `<`      | Less than (Nhỏ hơn)         | `x < y`      |
| `>=`     | Greater than or equal to     | `x >= y`     |
| `<=`     | Less than or equal to        | `x <= y`     |

- Bảng toán tử logic

| Toán Tử | Mô Tả   | Ví Dụ  |
|----------|-------------------|-----|
| `and`    | Trả lại kết quả True nếu cả 2 đều đúng       | `x < 5 and x < 10`                  |
| `or`     | Trả lại kết quả True nếu 1 trong 2 đúng   | `x < 5 or x < 4`                    |
| `not`    | đảo ngược kết quả nếu đúng thành sai và sai thành đúng      | `not(x < 5 and x < 10)`             |

## Bài tập
- Khai báo tuổi của bạn dưới dạng biến số nguyên
- Khai báo chiều cao của bạn dưới dạng biến float
- Khai báo biến lưu trữ số phức
- Viết đoạn script nhắc người dùng nhập đáy và chiều cao của tam giác rồi tính diện tích tam giác này (diện tích = 0,5 xbxh).
```py
    Enter base: 20
    Enter height: 10
    The area of the triangle is 100
```
- Viết đoạn lệnh nhắc người dùng nhập cạnh a, cạnh b, cạnh c của tam giác. Tính chu vi của tam giác (chu vi = a + b + c)
- Nhận chiều dài và chiều rộng của hình chữ nhật bằng dấu nhắc. Tính diện tích của nó (diện tích = chiều dài x chiều rộng) và chu vi (chu vi = 2 x (dài + chiều rộng))
- Nhận bán kính hình tròn bằng dấu nhắc. Tính diện tích (diện tích = pi xrxr) và chu vi (c = 2 x pi xr) trong đó pi = 3,14.
- Tìm độ dài của 'python' và 'dragon' và đưa ra một tuyên bố so sánh sai.
- Sử dụng toán tử và để kiểm tra xem có tìm thấy 'on' trong cả 'python' và 'dragon' hay không
- Tôi hy vọng khóa học này không đầy những biệt ngữ . Sử dụng toán tử in để kiểm tra xem biệt ngữ có trong câu hay không.
- Không có 'bật' ở cả rồng và trăn
- Tìm độ dài của văn bản python và chuyển đổi giá trị thành float và chuyển đổi nó thành chuỗi
- Các số chẵn chia hết cho 2 và có số dư bằng 0. Làm cách nào để kiểm tra xem một số có chẵn hay không bằng python?
- Kiểm tra xem phép chia tầng 7 cho 3 có bằng giá trị chuyển đổi int là 2,7 hay không.
- Viết một đoạn script nhắc người dùng nhập số giờ và mức giá mỗi giờ. Tính lương của người đó?
```py
Enter hours: 40
Enter rate per hour: 28
Your weekly earning is 1120
```
- Viết một đoạn script nhắc người dùng nhập số năm. Tính số giây một người có thể sống. Giả sử một người có thể sống trăm năm
```py
Enter number of years you have lived: 100
You have lived for 3153600000 seconds.
```
- Viết tập lệnh Python hiển thị bảng sau
```py
1 1 1 1 1
2 1 2 4 8
3 1 3 9 27
4 1 4 16 64
5 1 5 25 125
```
- Thực hành

```
age = 24
height = 1.65
so_phuc = 3 + 4j

# tính diện tích tam giác
base = float(input("Nhập chiều dài cơ bản: "))
height = float(input("Nhập chiều cao: "))
area = 0.5 * base * height
print(f"Diện tích tam giác là {area}")

# Tính chi vi tam giác 
side_a = float(input("Nhập cạnh a: "))
side_b = float(input("Nhập cạnh b: "))
side_c = float(input("Nhập cạnh c: "))
perimeter = side_a + side_b + side_c
print(f"Chu vi tam giác là {perimeter}")

# Tính chu vi hình chữ nhật
length = float(input("Nhập chiều dài hình chữ nhật: "))
width = float(input("Nhập chiều rộng hình chữ nhật: "))
area = length * width
perimeter = 2 * (length + width)
print(f"Diện tích hình chữ nhật là {area}")
print(f"Chu vi hình chữ nhật là {perimeter}")

# Tính chu vi và diện tích hình tròn
import math

radius = float(input("Nhập bán kính hình tròn: "))
area = math.pi * radius ** 2
circumference = 2 * math.pi * radius
print(f"Diện tích hình tròn là {area}")
print(f"Chu vi hình tròn là {circumference}")

# độ dài 
len_python = len('python')
len_dragon = len('dragon')

if len_python < len_dragon:
    print("Chiều dài của chuỗi 'python' nhỏ hơn chuỗi 'dragon'.")
else:
    print("Chiều dài của chuỗi 'python' không nhỏ hơn chuỗi 'dragon'.")

# Tìm kiếm từ trong cụm từ
if 'on' in 'python' and 'on' in 'dragon':
    print("'on' được tìm thấy cả trong 'python' và 'dragon'.")

# Kiểm tra từ không có
if 'on' not in 'dragon' and 'on' not in 'python':
    print("'on' không được tìm thấy cả trong 'dragon' và 'python'.")

# Kiểm tra số chẵn
number = int(input("Nhập số cần kiểm tra: "))
if number % 2 == 0:
    print(f"{number} là số chẵn.")
else:
    print(f"{number} không là số chẵn.")

# 
if 7 // 3 == int(2.7):
    print("Điều kiện đúng.")
else:
    print("Điều kiện sai.")

# 
if type('10') == type(10):
    print("Kiểu của '10' bằng kiểu của 10.")
else:
    print("Kiểu của '10' không bằng kiểu của 10.")

#
result = int('9.8')
if result == 10:
    print("Giá trị của int('9.8') bằng 10.")

# Tính lương theo giờ
hours = float(input("Nhập số giờ làm việc: "))
rate_per_hour = float(input("Nhập tỷ lệ trên giờ: "))
weekly_earning = hours * rate_per_hour
print(f"Lương hàng tuần của bạn là {weekly_earning}")

# Viết bảng
print(f"1 1 1 1 1")
print(f"2 1 2 4 8")
print(f"3 1 3 9 27")
print(f"4 1 4 16 64")
print(f"5 1 5 25 125")

```
- Dưới đây là kết quả
  ![Alt](/thuctap/anh/Screenshot_752.png)

- Một vài lưu ý:
  - Tùy chọn f trong hàm print giúp nhúng kết quả của biến vào chỗi để in ra
  - hàm input() dùng để nhập kết quả từ màn hình vào