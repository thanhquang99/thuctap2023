# Day 5 Python
## 1 List là gì
- Có bốn kiểu thu thập dữ liệu trong Python:
  - List: Là một tập hợp được sắp xếp theo thứ tự và có thể thay đổi(Modifiable). Cho phép các thành phần trùng lặp.
  - Tuple: Là một tập hợp được sắp xếp theo thứ tự và không thể thay đổi. Cho phép các thành phần trùng lặp.
  - Set: Là một tập hợp không có thứ tự, không lập chỉ mục và không thể sửa đổi, nhưng bạn có thể thêm các mục mới. Không có thành phần trùng lặp
  - Dictionary:Là một tập hợp không có thứ tự, có thể thay đổi và được lập chỉ mục. Không có thành phần trùng lặp.
- List là tập hợp các kiểu dữ liệu khác nhau được sắp xếp theo thứ tự và có thể sửa đổi(Có thể thay đổi). Một danh sách có thể trống hoặc nó có thể các mục hoặc các kiểu mục dữ liệu khác nhau.
## 2 Tạo list
- Có 2 cách tạo list 
  ```
  LIST = list() # đây là cách sử dụng hàm để tạo list từ những thứ có trước
  LIST=[] # đây là cách tạo list mà mình tự khởi tạo ban đầu
  ```

- Dưới đây là ví dụ
  ```
    tuple_example = (1, 2, 3, 4, 5)
    list_from_tuple = list(tuple_example)
    fruits = ['banana', 'orange', 'mango', 'lemon']
  ```
- list có thể có các kiểu mục thuộc các kiểu dữ liệu khác nhau:
  ```
    lst = ['thanhquang', 24, True, {'country':'Vietnam', 'city':'Namdinh'}]
  ```
## 3. Truy cấp các item trong list bằng các sử dụng Indexing
- Mỗi thành phần trong list sẽ được đánh số thứ tự từ 0 đến hết
- Để có thể lấy ra thành phần mong muốn ta có thể sử dụng cách sau `list[0]
  ```
    Qua = ['chuoi', 'oi', 'tao', 'xoai', 'ot']
    Qua1 = Qua[0]
    print(Qua1)     #Chuoi
  ```
## 4.Truy cập các mục trong danh sách bằng cách sử dụng item Negative indexing
- Negative indexing có nghĩa là bắt đầu từ cuối, -1 là item cuối cùng và đi ngược lại đến hết
  ```
    fruits = ['banana', 'orange', 'mango', 'lemon']
    first_fruit = fruits[-4]
  ```
## 5. Giải nén các mục danh sách
- Ta có thể gắn các biến cho từng item trong list bằng cách liệt kê từ thành tên biến 
- Hoặc có thể gắn các item còn lại vào 1 biến
  ```
    lst = ['item','item2','item3', 'item4', 'item5', 'item nnn']
    item_dautien, item_thu2, item_thu3, *rest = lst
    print(item_dautien)     # item1
    print(item_thu2)    # item2
    print(item_thu3)     # item3
    print(rest)         # In ra các item còn lại
  ```
## 6. In ra chuỗi list
```
countries = ['Germany', 'France','Belgium','Sweden','Denmark','Finland','Norway','Iceland','Estonia']
gr, fr, bg, sw, *scandic, es = countries
print(gr) # Germany
print(fr) #France
print(bg) #Belgium
print(sw) #Sweden
print(scandic) #['Denmark', 'Finland', 'Norway', 'Iceland']
print(es) #Estonia
```
## 7. Positive Indexing
- Chỉ dịnh một loạt các positive indexes bằng chỉ định bắt đầu, kết thúc và bước nhảy, giá trị trả về sẽ là một danh mới.
```
fruits = ['banana', 'orange', 'mango', 'lemon']
all_fruits = fruits[0:2] #['banana', 'orange'] In ra kết quả bắt đầu từ 0 kết thúc 2
all_fruits = fruits[0:] # In ra tất cả
orange_and_mango = fruits[1:3] #['orange', 'mango']
orange_mango_lemon = fruits[1:] #['orange', 'mango', 'lemon']
orange_and_lemon = fruits[::2] #['banana', 'mango'] 

nums = ['1', '2', '4', '5', '6', '9', '10']
num = nums[::3] #['1', '5', '10']
num = nums[::4] #['1', '6']
num = nums[-4:] #['5', '6', '9', '10'] 4 item cuối cùng
num = nums[-2:] #['9', '10'] 2 item cuối cùng
num = nums[-3:-1] #['6', '9']
num = nums[-3:] #['6', '9', '10']
num = nums[::-1] #['10', '9', '6', '5', '4', '2', '1']
```
## 8. Sửa đổi list
- Danh sách là một tập hợp các mục có thứ tự có thể thay đổi hoặc sửa đổi được. Cho phép sửa đổi list.
```
my_list = [1, 2, 3, 4, 5]

# Thay đổi giá trị của phần tử thứ hai
my_list[1] = 10

# Kết quả: [1, 10, 3, 4, 5]
print(my_list)
```
## 9. Kiểm tra các items trong list
- Để kiểm tra các item trong list tasẽ sử dụng hàm in và chỉ định ra list. Sau đó gắn vào biến để kiểm tra biến đó
```
fruits = ['banana', 'orange', 'mango', 'lemon']
does_exist = 'banana' in fruits
print(does_exist) # True có banana trong list

does_exist = 'lime' in fruits
print(does_exist) # False Không có lime trong list
```
## 10. Thêm các Item vào List
- Phương thức append() được sử dụng để thêm một phần tử vào cuối danh sách
```
my_list = [1, 2, 3, 4, 5]

# Thêm phần tử 6 vào cuối danh sách
my_list.append(6)

# Kết quả: [1, 2, 3, 4, 5, 6]
```
## 11. Chèn các mục vào danh sách
Để chèn mục vào một danh sách trong Python, bạn có thể sử dụng phương thức insert()
```
my_list = [1, 2, 3, 4, 5]

# Chèn mục 10 vào vị trí thứ 2
my_list.insert(1, 10)

# Kết quả: [1, 10, 2, 3, 4, 5]
```
## 12. Xóa các iterm khỏi danh sách
- Phương thức remove() được sử dụng để loại bỏ một giá trị cụ thể từ danh sách
```
my_list = [1, 2, 3, 4, 5]

# Xóa giá trị 3 khỏi danh sách
my_list.remove(3)

# Kết quả: [1, 2, 4, 5]
```
- Xóa Item bằng cách sử dụng pop
  - Phương thức pop() không chỉ loại bỏ một phần tử từ danh sách theo chỉ số mà còn trả về giá trị của phần tử đó.
```
my_list = [1, 2, 3, 4, 5]

# Loại bỏ và trả về giá trị của phần tử thứ 2
removed_value = my_list.pop(1)

# Kết quả: [1, 3, 4, 5]
```
- Sử dụng toán tử del và chỉ số:
  - Toán tử del có thể được sử dụng để xóa một phần tử theo chỉ số trong danh sách
```
my_list = [1, 2, 3, 4, 5]

# Xóa phần tử thứ 2 khỏi danh sách
del my_list[1]

# Kết quả: [1, 3, 4, 5]
```
- Xóa toàn bộ item trong list
```
fruits= ['Bưởi', 'mango', 'Mít', 'lemon']
fruits.clear()
print(fruits) # []
```
## 13. Copy list
```
original_list = [1, 2, 3, 4, 5]

# Sao chép danh sách bằng cách sử dụng phương thức copy()
copied_list = original_list.copy()

# Thay đổi một giá trị trong danh sách gốc
original_list[0] = 10

# Kết quả: [1, 2, 3, 4, 5]
print(copied_list)
```
## 14. Joinning List - Gộp
- Để gộp (join) nhiều danh sách thành một danh sách duy nhất trong Python, bạn có thể sử dụng toán tử + hoặc phương thức extend()
```
list1 = [1, 2, 3]
list2 = [4, 5, 6]
list3 = [7, 8, 9]

# Gộp danh sách bằng cách sử dụng toán tử '+'
result_list = list1 + list2 + list3

# Kết quả: [1, 2, 3, 4, 5, 6, 7, 8, 9]
```
```
list1 = [1, 2, 3]
list2 = [4, 5, 6]
list3 = [7, 8, 9]

# Gộp danh sách bằng cách sử dụng phương thức extend()
list1.extend(list2)
list1.extend(list3)

# Kết quả: [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(list1)
```
## 15. Sắp xếp danh sách
- Phương thức sort() được sử dụng để sắp xếp danh sách ngay tại chỗ (in-place). Nó sửa đổi danh sách gốc.
```
my_list = [4, 2, 8, 1, 7]

# Sắp xếp danh sách tăng dần
my_list.sort()

# Kết quả: [1, 2, 4, 7, 8]
print(my_list)
```
- Nếu bạn muốn sắp xếp giảm dần, bạn có thể sử dụng tham số reverse=True:
```
my_list = [4, 2, 8, 1, 7]

# Sắp xếp danh sách giảm dần
my_list.sort(reverse=True)

# Kết quả: [8, 7, 4, 2, 1]
print(my_list)
```
- Hàm sorted() tạo ra một danh sách mới chứa các phần tử được sắp xếp từ danh sách ban đầu. Nó không ảnh hưởng đến danh sách gốc.
```
my_list = [4, 2, 8, 1, 7]

# Sắp xếp danh sách tăng dần và lưu vào danh sách mới
sorted_list = sorted(my_list)

# Kết quả: [1, 2, 4, 7, 8]
print(sorted_list)

# Danh sách gốc không thay đổi
print(my_list)
```
- Tương tự như sort(), nếu bạn muốn sắp xếp giảm dần, bạn có thể sử dụng tham số reverse=True:
```
my_list = [4, 2, 8, 1, 7]

# Sắp xếp danh sách giảm dần và lưu vào danh sách mới
sorted_list_reverse = sorted(my_list, reverse=True)

# Kết quả: [8, 7, 4, 2, 1]
print(sorted_list_reverse)

# Danh sách gốc không thay đổi
print(my_list)
```