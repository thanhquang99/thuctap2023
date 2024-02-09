# Python day 3
## 1. Biến trong Python
- Để có thể ghi nhớ và sử dụng tiện dụng các giá trị được lặp đi lặp lại nhiều lần ta có thể sử dụng biến để gắn giá trị
- Quy tắc đặt biến cho python
  - Tên biến có phân biệt chữ hoa và chữ thường
  - Tên biến phải bắt đầu bằng chữ hoặc dấu `_` và không thể bắt đầu bằng số
  - Tên biến chỉ có thể chứa chữ ,số ,dấu `_` , không thể chứa kí tự đặc biệt
- Quy tắc gắn biến
  ```
  name = 'quang'
  ```
- Khai báo nhiều biến trong một dòng
  ```
  ho='khuong', ten_dem='thanh', ten='quang'
  ```
## 2. Bài tập
### 2.1 Bài tập cấp độ 1
- Khai báo một biến tên và gán giá trị cho nó
-  Khai báo một biến họ và gán giá trị cho nó
-  Khai báo một biến tên đầy đủ và gán giá trị cho nó
-  Khai báo một biến quốc gia và gán giá trị cho nó
-  Khai báo một biến thành phố và gán giá trị cho nó
-  Khai báo một biến tuổi và gán giá trị cho nó
-  Khai báo một biến năm và gán giá trị cho nó
-  Khai báo một biến is_married và gán giá trị cho nó
-  Khai báo một biến is_true và gán giá trị cho nó
-  Khai báo biến is_light_on và gán giá trị cho nó
-  Khai báo nhiều biến trên một dòng

```
name='quang'
full_name='khuong thanh quang'
country='vietnam'
city='nam dinh'
age='24'
year='2024'
is_marry='no'
is_true='yes'
is_light_on='no'
```
```
name='quang', full_name='khuong thanh quang', country='vietnam', city='nam dinh', age='24', year='2024', is_marry='no', is_true='yes', is_light_on='no'
```
### Bài tập 2
- Kiểm tra kiểu dữ liệu của tất cả các biến của bạn bằng hàm dựng sẵn type()
- Sử dụng hàm dựng sẵn len() , tìm độ dài tên của bạn
- So sánh độ dài của tên và họ của bạn
- Khai báo 5 là num_one và 4 là num_two
- Cộng num_one và num_two rồi gán giá trị cho biến tổng
- Trừ num_two khỏi num_one và gán giá trị cho một biến khác
- Nhân num_two và num_one và gán giá trị cho một biến sản phẩm
- Chia num_one cho num_two và gán giá trị cho phép chia biến
- Sử dụng phép chia mô đun để tìm num_two chia cho num_one và gán giá trị cho phần dư của biến
- Tính num_one lũy thừa của num_two và gán giá trị cho biến exp
- Tìm phép chia tầng của num_one cho num_two và gán giá trị cho biến tầng_division
- Bán kính của một vòng tròn là 30 mét.
- Tính diện tích hình tròn và gán giá trị cho tên biến Area_of_circle
- Tính chu vi hình tròn và gán giá trị cho tên biến là Cir_of_circle
- Lấy bán kính làm đầu vào của người dùng và tính diện tích.
- Sử dụng hàm nhập tích hợp để lấy tên, họ, quốc gia và tuổi từ người dùng và lưu giá trị vào tên biến tương ứng của họ
- Chạy help('keywords') trong Python shell hoặc trong tệp của bạn để kiểm tra các từ hoặc từ khóa dành riêng cho Python

```
is_light_on='no'
print(type(name))
print(len(name))
print(len(full_name))
if len(name) > len(full_name) :
  print("name dài hơn full_name")
else:
  print("name ngắn hơn full_name")

num_one=5
num_two=4
tru = num_one - num_two
san_pham = num_one * num_two
chia = num_one/num_two
exp = num_one ** num_two
du= num_one % num_two
r=30
Area_of_circle = 3.14*r*r
Cir_of_circle= 3.14*r
quang_info = {
  'name':'quang',
  'full_name':"khuong thanh quang",
  'country':'vietnam',
  'city':"nam dinh",
  'age':'24',
}
```
- Dưới đây là hình ảnh thực tế
  ![Alt](/thuctap/anh/Screenshot_751.png)

