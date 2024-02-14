# Ngày thứ 11 học python
## 1. function là gì
- Funtion là một khối mã có thể sử dụng lại hoặc các câu lệnh lập tình được thiết kế để thực hiện một tác vụ nhất định. Để định nghĩa một hàm, Python cung cấp key def. Sau đây là cú pháp để xác định một hàm. Block code Function chỉ được thực thi khi chúng ta gọi nó.
## 2. Cách khai báo và gọi 1 hàm trong python
- Khai báo Hàm:
```
def hello_world():
    """
    Hàm này in ra chuỗi "Hello, World!"
    """
    print("Hello, World!")

# Gọi hàm để in ra chuỗi
hello_world()
```
## 3. Function không có tham số
```
def say_hello():
    """
    Hàm này in ra chuỗi "Hello, World!"
    """
    print("Hello, World!")

# Gọi hàm không có tham số
say_hello()
```
## 4. Function trả lại giá trị 
- Function cũng có thể trả về giá trị, nếu một hàm không trả về giá trị nào thì giá trị của hàm là None.
- Cho phép viết lại các function trên bằng return. 
- Giá trị trả về này có thể được sử dụng trong các phép toán khác hoặc được in ra màn hình.
```
def add_numbers(x, y):
    """
    Hàm này nhận vào hai số và trả về tổng của chúng.
    """
    sum_result = x + y
    return sum_result

# Gọi hàm và lưu giá trị trả về vào một biến
result = add_numbers(3, 4)

# In giá trị trả về
print("Tổng của hai số là:", result)
```
## 5. Function với tham số
- Hàm có tham số là một khái niệm quan trọng trong lập trình Python, cho phép bạn truyền giá trị đầu vào vào hàm để thực hiện các thao tác cụ thể. Dưới đây là một số điều quan trọng về hàm có tham số trong Python:
- Khai Báo Hàm có Tham Số:
```
def my_function(parameter1, parameter2):
    # Thân hàm
    print(parameter1, parameter2)
```
-  Gọi Hàm với Tham Số:
```
my_function(value1, value2)
```
##  6. Bài tập
- Viết hàm is_prime để kiểm tra xem một số có phải là số nguyên tố hay không.
- Viết hàm kiểm tra xem tất cả các mục có phải là duy nhất trong danh sách hay không.
- Viết hàm kiểm tra xem tất cả các mục trong danh sách có cùng kiểu dữ liệu hay không.
- Viết hàm kiểm tra xem biến được cung cấp có phải là biến python hợp lệ không
- Chuyển đến thư mục dữ liệu và truy cập tệp country-data.py.
- Tạo một hàm có tên là Most_spoken_Language trên thế giới. Nó sẽ trả về 10 hoặc 20 ngôn ngữ được sử dụng nhiều nhất trên thế giới theo thứ tự giảm dần
- Tạo một hàm có tên là Most_populated_countries. Nó sẽ trả về 10 hoặc 20 quốc gia đông dân nhất theo thứ tự giảm dần.
```
# Create an empty dictionary called dog
dog = {}

# Add name, color, breed, legs, age to the dog dictionary
dog['name'] = 'Buddy'
dog['color'] = 'Brown'
dog['breed'] = 'Labrador'
dog['legs'] = 4
dog['age'] = 3

# Create a student dictionary
student = {
    'first_name': 'John',
    'last_name': 'Doe',
    'gender': 'Male',
    'age': 22,
    'marital_status': 'Single',
    'skills': ['Python', 'JavaScript'],
    'country': 'USA',
    'city': 'New York',
    'address': '123 Main Street'
}

# Get the length of the student dictionary
length_of_student_dict = len(student)
print("Length of the student dictionary:", length_of_student_dict)

# Get the value of skills and check the data type, it should be a list
skills_value = student['skills']
print("Skills:", skills_value)
print("Data type of skills:", type(skills_value))

# Modify the skills values by adding one or two skills
student['skills'].extend(['React', 'Node'])
print("Updated Skills:", student['skills'])

# Get the dictionary keys as a list
keys_list = list(student.keys())
print("Keys as list:", keys_list)

# Get the dictionary values as a list
values_list = list(student.values())
print("Values as list:", values_list)

# Change the dictionary to a list of tuples using items() method
list_of_tuples = list(student.items())
print("List of tuples:", list_of_tuples)

# Delete one of the items in the dictionary
del student['marital_status']

# Delete one of the dictionaries
del dog
```