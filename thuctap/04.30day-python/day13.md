# Ngày 13 học python
## 1. List Comprehension là gì
- là một cách nhỏ gọn để tạo danh sách từ một chuỗi
- Python cho phép bạn tạo một danh sách mới bằng cách thực hiện một phép toán trên mỗi phần tử của danh sách cũ hoặc bằng cách lọc các phần tử từ danh sách cũ theo một điều kiện nào đó. 
- Cách tạo List Comprehension
    ```
    # syntax
    [i for i in iterable if expression]
    ```
    - expression: Biểu thức được thực hiện cho mỗi phần tử của danh sách cũ.
    - i: Biến lặp
    - iterable: Đối tượng mà bạn đang lặp qua (ví dụ: danh sách, tuple, chuỗi, v.v.).
    - condition (tùy chọn): Một điều kiện để lọc các phần tử của iterable. Nếu điều kiện không được cung cấp, tất cả các phần tử của iterable sẽ được xử lý.
- Ví dụ
  ```
    # Tạo danh sách bình phương của các số chẵn từ 0 đến 9
    even_squares = [x**2 for x in range(10) if x % 2 == 0]
    print(even_squares)
    # Output: [0, 4, 16, 36, 64]
  ```

## 2. Hàm Lambda
- Hàm Lambda trong Python là một loại hàm vô danh (anonymous function) được định nghĩa bằng từ khóa lambda
- Hàm này được sử dụng khi bạn cần một hàm ngắn gọn mà không muốn đặt tên cho nó. 
- Cú pháp của hàm Lambda như sau:
    ```
    lambda arguments: expression
    ```
    - lambda: Từ khóa để bắt đầu định nghĩa hàm lambda.
    - arguments: Danh sách các đối số của hàm.
    - expression: Biểu thức được thực hiện khi hàm được gọi, kết quả của biểu thức này sẽ là giá trị trả về của hàm.
- Ví dụ
  ```
    # Hàm lambda tính bình phương của một số
    square = lambda x: x**2
    # Gọi hàm lambda
    result = square(5)
    print(result)  # Output: 25
  ```
- Hàm Lambda bên trong một hàm khác
  ```
    def power(x):
        return lambda n : x ** n
    cube = power(2)(3)   # function power now need 2 arguments to run, in separate rounded brackets
    print(cube)          # 8
    two_power_of_five = power(2)(5) 
    print(two_power_of_five)  # 32
  ```
  ## 3. Bài tập
  - Chỉ lọc số âm và số 0 trong danh sách bằng cách sử dụng tính năng hiểu danh sách
  ```
    numbers = [-4, -3, -2, -1, 0, 2, 4, 6]
  ```
    ```
    numbers = [-4, -3, -2, -1, 0, 2, 4, 6]
    filtered_numbers = [x for x in numbers if x <= 0]
    print(filtered_numbers)
    ```

- Làm phẳng danh sách các danh sách sau đây thành danh sách một chiều:
  ```
    list_of_lists =[[[1, 2, 3]], [[4, 5, 6]], [[7, 8, 9]]]

    output
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ```
    ```
    from itertools import chain

    list_of_lists = [[[1, 2, 3]], [[4, 5, 6]], [[7, 8, 9]]]

    flattened_list = list(chain.from_iterable(chain.from_iterable(list_of_lists)))
    print(flattened_list)
    ```
