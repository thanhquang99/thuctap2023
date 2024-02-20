# Ngày 15 học Python
## Các loại lỗi trong python
- khi bạn thực hiện một phép toán hoặc một hành động không hợp lý với kiểu dữ liệu của biến hoặc đối tượng thì sẽ sinh ra lỗi 
### 1. SyntaxError
- Lỗi cú pháp
- Xảy ra khi bạn nhập khai báo dữ liệu sai cú pháp
  ```
  # Lỗi cú pháp khi thiếu dấu ngoặc đơn
  print("Hello, world"
  # SyntaxError: unexpected EOF while parsing
  ```
### 2. NameError
- Lỗi tên
- Xảy ra khi bạn sử dụng biến hoặc tên không được định nghĩa
  ```
  # Lỗi NameError khi gọi hàm chưa được định nghĩa
  result = add_numbers(3, 5)
  # NameError: name 'add_numbers' is not defined

  # Định nghĩa hàm sau cùng để sửa lỗi
  def add_numbers(a, b):
      return a + b
  ```
### 3. IndexError
- xảy ra khi bạn cố gắng truy cập một chỉ số trong một dãy (list, tuple, hoặc chuỗi) mà không tồn tại
  ```
  my_list = [1, 2, 3]

  # Lỗi IndexError khi truy cập chỉ số ngoài phạm vi của dãy
  value = my_list[5]
  # IndexError: list index out of range
  ```
### 4. ModuleNotFoundError
- xuất hiện khi Python không thể tìm thấy một module (thư viện) mà bạn cố gắng import trong chương trình của mình.
  ```
  # Lỗi ModuleNotFoundError khi import một module không tồn tại
  import non_existent_module 
  # ModuleNotFoundError: No module named 'non_existent_module'
  ```
### 5. AttributeError
- Lỗi thuộc tính
- xuất hiện khi bạn cố gắng truy cập một thuộc tính hoặc phương thức không tồn tại trên một đối tượng
  ```
  # Lỗi AttributeError khi truy cập thuộc tính không tồn tại
  class MyClass:
      pass

  obj = MyClass()
  print(obj.attribute)
  # AttributeError: 'MyClass' object has no attribute 'attribute'
  ```
### 6. KeyError
- xuất hiện khi bạn cố gắng truy cập một key không tồn tại trong một dictionary
  ```
  # Lỗi KeyError khi truy cập key không tồn tại trong dictionary
  my_dict = {'a': 1, 'b': 2, 'c': 3}
  value = my_dict['d']
  # KeyError: 'd'
  ```
### 7. TypeError
- xuất hiện khi bạn thực hiện một phép toán hoặc một hành động không hợp lý với kiểu dữ liệu của một đối tượng
  ```
  # Lỗi TypeError khi chia một chuỗi cho một số
  result = "Hello" / 2
  # TypeError: unsupported operand type(s) for /: 'str' and 'int'
  ```
### 8. ImportError
- xuất hiện khi có vấn đề xảy ra khi bạn cố gắng import một module hoặc một phần của module trong chương trình Python của mình
  ```
  # Lỗi ImportError khi import một module không tồn tại
  import non_existent_module
  # ImportError: No module named 'non_existent_module'
  ```
### 9. ValueError
- xuất hiện khi một hàm hoặc phương thức nhận đối số có kiểu dữ liệu đúng nhưng giá trị của đối số không nằm trong phạm vi hợp lý hoặc không đáp ứng một số yêu cầu khác của hàm đó
  ```
  # Lỗi ValueError khi chuyển đổi kiểu dữ liệu không hợp lý
  value = int("abc")
  # ValueError: invalid literal for int() with base 10: 'abc'
  ```
### 10. ZeroDivisionError
- xuất hiện khi một phép chia được thực hiện với mẫu số bằng 0.
  ```
  try:
      result = 10 / 0
  except ZeroDivisionError as e:
      print(f"Lỗi ZeroDivisionError: {e}")
  ```