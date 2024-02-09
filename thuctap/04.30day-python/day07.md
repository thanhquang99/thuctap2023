# day 7 học Python
## 1. Set là gì

- Trong Python, set là một loại dữ liệu mà nó biểu diễn một tập hợp không có thứ tự và không chứa các phần tử trùng lặp. Một set được đặc trưng bởi cặp dấu ngoặc nhọn {} và các phần tử trong set được phân tách bằng dấu phẩy.

- Dưới đây là một số đặc điểm chính của set trong Python:

  - Không có thứ tự: Các phần tử trong set không được sắp xếp theo thứ tự cụ thể. Điều này có nghĩa là bạn không thể truy cập các phần tử thông qua chỉ số vì set không có chỉ số.

  - Không chứa phần tử trùng lặp: Mỗi phần tử trong set là duy nhất. Nếu bạn thêm một phần tử mà set đã chứa, set sẽ không thay đổi.

  - Thay đổi được (Mutable): Set là một kiểu dữ liệu thay đổi, có nghĩa là bạn có thể thêm, xóa và cập nhật các phần tử trong set.
## 2. Tạo set
- Tương tự như list có 2 cách tạo set
```
my_set = {1, 2, 3, 4, 5}
```
```
my_list = [1, 2, 3, 4, 5]
set_from_list = set(my_list)
```
## 3. Truy cập các mục trong set
Chúng tôi sử dụng các vòng lặp để truy cập các mục. Chúng ta sẽ thấy điều này trong phần vòng lặp
```
my_set = {1, 2, 3, 4, 5}

# Duyệt qua tất cả các phần tử trong set
for element in my_set:
    print(element)
```
## 4. Thêm các mục vào set
- Sử dụng phương thức add() để thêm một phần tử:
```
my_set = {1, 2, 3, 4, 5}

# Thêm một phần tử mới (ví dụ: 6) vào set
my_set.add(6)

# Kết quả: {1, 2, 3, 4, 5, 6}
print(my_set)
```
## 5. Xóa các mục khỏi set
- Sử dụng phương thức remove():
  - Phương thức remove() được sử dụng để loại bỏ một phần tử cụ thể từ set. Nếu phần tử không tồn tại trong set, phương thức này sẽ raise một ngoại lệ KeyError.

```
my_set = {1, 2, 3, 4, 5}

# Xóa phần tử có giá trị là 3 từ set
my_set.remove(3)

# Kết quả: {1, 2, 4, 5}
print(my_set)
```
- Sử dụng phương thức discard():
  - Phương thức discard() cũng loại bỏ một phần tử từ set, nhưng nếu phần tử không tồn tại, nó không gây ra lỗi.

```
my_set = {1, 2, 3, 4, 5}

# Loại bỏ phần tử có giá trị là 3 từ set (nếu tồn tại)
my_set.discard(3)

# Kết quả: {1, 2, 4, 5}
print(my_set)
```
- Sử dụng phương thức pop():
  -  Phương thức pop() loại bỏ và trả về một phần tử ngẫu nhiên từ set. Lưu ý rằng set không có thứ tự, vì vậy phần tử được loại bỏ là ngẫu nhiên.

```
my_set = {1, 2, 3, 4, 5}

# Loại bỏ và trả về một phần tử ngẫu nhiên từ set
removed_element = my_set.pop()

# Kết quả (ví dụ): removed_element có thể là 1, 2, 3, 4, hoặc 5
print(f"Phần tử đã loại bỏ: {removed_element}")
```
## 6. Joining Sets
- ta có thể nối hai tập hợp bằng phương thức union() hoặc update()
- Union Phương thức này trả về một tập hợp mới
```
set1 = {1, 2, 3}
set2 = {3, 4, 5}

# Gộp set1 và set2 bằng cách sử dụng toán tử union (|)
result_set = set1 | set2

# Hoặc có thể viết là: result_set = set1.union(set2)

# Kết quả: {1, 2, 3, 4, 5}
print(result_set)
```
- chèn một tập hợp vào một tập hợp nhất định bằng update
```
set1 = {1, 2, 3}
set2 = {3, 4, 5}

# Gộp set1 và set2 bằng cách sử dụng phương thức update()
set1.update(set2)

# Kết quả: {1, 2, 3, 4, 5}
print(set1)
```
## 7. Tìm điểm chung và điểm khác nhau trong set
- Tìm điểm chung
```
set1 = {1, 2, 3, 4, 5}
set2 = {3, 4, 5, 6, 7}

# Tìm các phần tử chung giữa set1 và set2
intersection_set = set1.intersection(set2)

# Hoặc có thể viết là: intersection_set = set1 & set2

# Kết quả: {3, 4, 5}
print(intersection_set)
```
- Tìm điểm khác nhau
```
set1 = {1, 2, 3, 4, 5}
set2 = {3, 4, 5, 6, 7}

# Tìm các phần tử trong set1 mà không có trong set2
difference_set = set1.difference(set2)

# Hoặc có thể viết là: difference_set = set1 - set2

# Kết quả: {1, 2}
print(difference_set)
```
## 8. Kiểm tra tập hợp con và tập cha
- Kiểm tra tập con (issubset):
```
set1 = {1, 2, 3}
set2 = {1, 2, 3, 4, 5}

# Kiểm tra xem set1 có phải là tập con của set2 không
is_subset = set1.issubset(set2)

# Hoặc có thể viết là: is_subset = set1 <= set2

# Kết quả: True
print(is_subset)
```
- Kiểm tra tập cha (issuperset):
```
set1 = {1, 2, 3, 4, 5}
set2 = {1, 2, 3}

# Kiểm tra xem set1 có phải là tập siêu bộ của set2 không
is_superset = set1.issuperset(set2)

# Hoặc có thể viết là: is_superset = set1 >= set2

# Kết quả: True
print(is_superset)
```