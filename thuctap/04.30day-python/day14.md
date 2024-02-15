# Ngày 14 học python
## 1. Higher Order Functions (HOF) là gì
- Higher Order Functions (HOF) trong Python là những hàm mà có thể nhận đối số là một hàm khác hoặc trả về một hàm khác
-  Sử dụng HOF với chức năng như một tham số
    ```
    def sum_numbers(nums):  # normal function
        return sum(nums)    # a sad function abusing the built-in sum function :<

    def higher_order_function(f, lst):  # function as a parameter
        summation = f(lst)
        return summation
    result = higher_order_function(sum_numbers, [1, 2, 3, 4, 5])
    print(result)       # 15
    ```
    - Ví dụ nàu lấy hàm sum_numbers làm đối số để truyền vào hàm higher_order_function
- Sử dụng HOF với chắc năng như một giá trị trả về
  ```
    def square(x):          # a square function
        return x ** 2

    def cube(x):            # a cube function
        return x ** 3

    def absolute(x):        # an absolute value function
        if x >= 0:
            return x
        else:
            return -(x)

    def higher_order_function(type): # a higher order function returning a function
        if type == 'square':
            return square
        elif type == 'cube':
            return cube
        elif type == 'absolute':
            return absolute

    result = higher_order_function('square')
    print(result(3))       # 9
    result = higher_order_function('cube')
    print(result(3))       # 27
    result = higher_order_function('absolute')
    print(result(-3))      # 3
  ```
## 2. Một vài chức năng hay dùng
### 2.1 Python - Map
- được sử dụng để áp dụng một hàm lên từng phần tử của một hoặc nhiều iterable (như danh sách, tuple) 
- Ví dụ
  ```
    numbers_str = ['1', '2', '3', '4', '5']  # iterable
    numbers_int = map(int, numbers_str)
    print(list(numbers_int))    # [1, 2, 3, 4, 5]
  ```
### 2.2 Python - Filter
- Hàm filter() gọi hàm đã chỉ định và trả về boolean cho từng mục của (danh sách) có thể lặp được chỉ định. Nó lọc các mục thỏa mãn tiêu chí lọc.
```
    # syntax
    filter(function, iterable)
```
- Ví dụ 
```
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
evens = filter(lambda x: x % 2 == 0, numbers)
print(list(evens))
# Output: [2, 4, 6, 8, 10]
```
### 2.3 Python - Reduce
- reduce() là một hàm được cung cấp bởi module functools trong Python, và nó được sử dụng để áp dụng một hàm có hai đối số lên từng cặp phần tử trong một iterable, sau đó kết hợp kết quả của từng cặp để tạo ra một giá trị duy nhất
- Ví dụ
  ```
    from functools import reduce

    numbers = [1, 2, 3, 4, 5]
    sum_result = reduce(lambda x, y: x + y, numbers)
    print(sum_result)
    # Output: 15
  ```