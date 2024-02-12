# Ngày 8 học Python
## 1. Dictionaries là gì
- Từ điển là một tập hợp các loại dữ liệu không theo thứ tự, có thể sửa đổi (có thể thay đổi) (khóa: giá trị).
## 2. Cách tạo Dictionaries
```
my_dict = {"key1": "value1", "key2": "value2", "key3": "value3"}
```
ví dụ
```
# Dictionaries có thể chứa các kiểu dữ liệu khác nhau
complex_dict = {"name": "Alice", "age": 30, "is_student": False, "grades": [90, 85, 92]}
```
## 3. Truy cập các item của Dictionaries
- Ta có thể truy cập , tìm kiếm các item của Dictionaries bằng từ khóa của nó
```
my_dict = {"name": "quang", "age": 25, "city": "nam dinh"}

# Truy cập giá trị của key "name"
name_value = my_dict["name"]
print(name_value)  # Output: quang
```
- Ta cũng có thể lấy item bằng hàm get
```
my_dict = {"name": "quang", "age": 25, "city": "nam dinh"}

# Sử dụng phương thức get để truy cập giá trị của key "age"
age_value = my_dict.get("age")
print(age_value)  # Output: 25
```
## 4. Thêm item vào Dictionaries
```
# Dữ liệu hiện tại về "quang"
quang_info = {
    "name": "Quang",
    "age": 25,
    "hometown": "Nam Dinh",
    "education": "DHBKHN"
}

# Thêm thông tin mới
quang_info["occupation"] = "Systems Engineer"
quang_info["interests"] = ["Programming", "Reading", "Traveling"]

# In dictionary sau khi thêm thông tin mới
print(quang_info)

```
- Ta cũng có thể sửa đổi item trong Dictionaries: truy cập vào key và gắn giá trị mới
```
# Dữ liệu hiện tại về "quang"
quang_info = {
    "name": "Quang",
    "age": 25,
    "hometown": "Nam Dinh",
    "education": "DHBLHN",
    "occupation": "Software Engineer",
    "interests": ["Programming", "Reading", "Traveling"]
}

# Sửa đổi thông tin
quang_info["age"] = 26
quang_info["occupation"] = "Data Scientist"

# In dictionary sau khi sửa đổi thông tin
print(quang_info)
```
## 5. xóa Dictionaries
- Sử dụng del để xóa item bằng key
```
# Dữ liệu hiện tại về "quang"
quang_info = {
    "name": "Quang",
    "age": 26,
    "hometown": "Nam Dinh",
    "education": "DHBLHN",
    "occupation": "Data Scientist",
    "interests": ["Programming", "Reading", "Traveling"]
}

# Xóa item "interests" từ dictionary
del quang_info["interests"]

# In dictionary sau khi xóa item
print(quang_info)
```
- Sử dụng phương thức pop() để xóa và trả về giá trị của item bằng key:
```
# Dữ liệu hiện tại về "quang"
quang_info = {
    "name": "Quang",
    "age": 26,
    "hometown": "Nam Dinh",
    "education": "DHBLHN",
    "occupation": "Data Scientist",
    "interests": ["Programming", "Reading", "Traveling"]
}

# Xóa và trả về giá trị của item "interests"
removed_interests = quang_info.pop("interests")

# In dictionary sau khi xóa item
print(quang_info)

# In giá trị của item đã được xóa
print("Removed interests:", removed_interests)
# Removed interests: ['Programming', 'Reading', 'Traveling']
```
## 6. Bài tập
1. Tạo một từ điển trống tên là dog
2. Thêm tên, màu sắc, giống, chân, tuổi vào từ điển chó
3. Tạo từ điển sinh viên và thêm first_name, Last_name, giới tính, tuổi, tình trạng hôn nhân, kỹ năng, quốc gia, thành phố và địa chỉ làm khóa cho từ điển
4. Lấy độ dài của từ điển sinh viên
5. Lấy giá trị của các kỹ năng và kiểm tra kiểu dữ liệu, nó phải là một danh sách
6. Sửa đổi giá trị kỹ năng bằng cách thêm một hoặc hai kỹ năng
7. Lấy các khóa từ điển dưới dạng danh sách
8. Lấy các giá trị từ điển dưới dạng danh sách
9. Thay đổi từ điển thành danh sách các bộ dữ liệu bằng phương thức items()
10. Xóa một trong các mục trong từ điển
11. Xóa một trong các từ điển

```
# Tạo từ điển chó
dog = {}

# Thêm thông tin chó vào từ điển
dog["name"] = "Buddy"
dog["color"] = "Brown"
dog["breed"] = "Labrador"
dog["legs"] = 4
dog["age"] = 3

# Tạo từ điển sinh viên và thêm thông tin
student = {
    "first_name": "John",
    "last_name": "Doe",
    "gender": "Male",
    "age": 20,
    "marital_status": "Single",
    "skills": ["Programming", "Communication"],
    "country": "USA",
    "city": "New York",
    "address": "123 Main St"
}

# Lấy độ dài của từ điển sinh viên
student_length = len(student)

# Lấy giá trị của kỹ năng và kiểm tra kiểu dữ liệu
skills_value = student["skills"]
skills_type = type(skills_value)

# Sửa đổi giá trị kỹ năng
student["skills"].extend(["Problem Solving", "Teamwork"])

# Lấy các khóa từ điển dưới dạng danh sách
keys_list = list(student.keys())

# Lấy các giá trị từ điển dưới dạng danh sách
values_list = list(student.values())

# Thay đổi từ điển thành danh sách các bộ dữ liệu bằng items()
items_list = list(student.items())

# Xóa một mục trong từ điển
del student["marital_status"]

# Xóa toàn bộ từ điển
del student

# In kết quả
print("Dog Dictionary:", dog)
print("\nStudent Dictionary:", student)  # Điều này sẽ gây ra lỗi vì từ điển đã bị xóa
```