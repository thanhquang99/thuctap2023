# Ngày 17 học về python
## 1. Xử lý các ngoại lệ trong python
- Trong khi chạy chương trình bạn sẽ gặp phải một một vài trường hợp không có trong điều kiện và ta liệt kê nó vào exception handling (ngoại lệ)
- Trong python có 4 lệnh dùng để xử lý các ngoại lệ này
  - `try -except`: Nếu bạn biết chính xác loại ngoại lệ có thể xảy ra, bạn có thể sử dụng nhiều khối except để xử lý từng loại ngoại lệ một cách riêng biệt.
  - `else` : Sử dụng khi bạn muốn chạy một đoạn mã chỉ khi không có ngoại lệ nào xảy ra trong khối try.
  - `finally` : Sử dụng khi bạn muốn đảm bảo rằng một đoạn mã cụ thể sẽ luôn được thực hiện, dù có ngoại lệ hay không.
## 2. ví dụ
```
def divide_numbers(numerator, denominator):
    try:
        result = numerator / denominator
    except ZeroDivisionError:
        print("Lỗi: Mẫu số không được bằng 0.")
    except TypeError:
        print("Lỗi: Kiểu dữ liệu không hợp lý.")
    else:
        print(f"Kết quả phép chia: {result}")
    finally:
        print("Khối lệnh finally được thực hiện bất kể có lỗi hay không.")

# Thử nghiệm với các giá trị khác nhau
divide_numbers(10, 2)  # Kết quả phép chia: 5.0, Finally được thực hiện
divide_numbers(10, 0)  # Lỗi: Mẫu số không được bằng 0, Finally được thực hiện
divide_numbers("abc", 2)  # Lỗi: Kiểu dữ liệu không hợp lý, Finally được thực hiện
```
kết quả
```
Kết quả phép chia: 5.0
Khối lệnh finally được thực hiện bất kể có lỗi hay không.
Lỗi: Mẫu số không được bằng 0.
Khối lệnh finally được thực hiện bất kể có lỗi hay không.
Lỗi: Kiểu dữ liệu không hợp lý.
Khối lệnh finally được thực hiện bất kể có lỗi hay không.
```
## 3. packing và unpacking 
### 3.1 unpacking
- Giải nén dữ liệu ta có thể hiểu rằng gắn từng phần tử trong 1 dirt hay tuple cho 1 biến vậy
- Để giải nén với list và tuple ta sử dụng dấu `*`
- Để giải nén với dirt ta sử dụng dấu `**`
```
def sum_of_five_nums(a, b, c, d, e):
    return a + b + c + d + e

lst = [1, 2, 3, 4, 5]
print(sum_of_five_nums(*lst))  # 15
```
```
def unpacking_person_info(name, country, city, age):
    return f'{name} lives in {country}, {city}. He is {age} year old.'
dct = {'name':'Asabeneh', 'country':'Finland', 'city':'Helsinki', 'age':250}
print(unpacking_person_info(**dct)) # Asabeneh lives in Finland, Helsinki. He is 250 years old.
```

### 3.2 packing
- "Packing" thường được hiểu là việc đóng gói một số lượng lớn các giá trị vào một cấu trúc dữ liệu 
- Packing Lists
```
# Đóng gói giá trị vào tuple
my_tuple = (1, 'hello', 3.14)
```
- packing dirt
```
# Đóng gói (packing) giá trị vào một từ điển
person_info = {
    'name': 'John',
    'age': 25,
    'city': 'New York'
}

# In thông tin từ điển
print(person_info)
```
## 4. Spreading in Python
- Ta có thể hiểu rằng đây là cấu trúc ghép các kiểu dữ liệu lại với nhau
- để làm được điều đó ta cần sử dụng dấu `*`
```
lst_one = [1, 2, 3]
lst_two = [4, 5, 6, 7]
lst = [0, *lst_one, *lst_two]
print(lst)          # [0, 1, 2, 3, 4, 5, 6, 7]
country_lst_one = ['Finland', 'Sweden', 'Norway']
country_lst_two = ['Denmark', 'Iceland']
nordic_countries = [*country_lst_one, *country_lst_two]
print(nordic_countries)  # ['Finland', 'Sweden', 'Norway', 'Denmark', 'Iceland']
```
## 5. Enumerate
- Hàm enumerate trong Python được sử dụng để lặp qua một dãy dữ liệu (như danh sách, tuple hoặc chuỗi) và trả về cặp giá trị (index, value) cho mỗi phần tử trong dãy đó. 
```
my_list = ['apple', 'banana', 'orange']

for index, value in enumerate(my_list):
    print(f"Index: {index}, Value: {value}")
```
kết quả
```
Index: 0, Value: apple
Index: 1, Value: banana
Index: 2, Value: orange
```
## 6. Zip 
- Hàm zip trong Python được sử dụng để kết hợp các phần tử từ nhiều dãy dữ liệu thành các cặp giá trị tương ứng
```
names = ['Alice', 'Bob', 'Charlie']
ages = [25, 30, 35]

# Kết hợp danh sách tên và danh sách tuổi thành các cặp (tên, tuổi)
combined_data = zip(names, ages)

# In kết quả
for name, age in combined_data:
    print(f"Name: {name}, Age: {age}")
```
- Kết quả
```
Name: Alice, Age: 25
Name: Bob, Age: 30
Name: Charlie, Age: 35
```
## 7. Bài tập
Cho names = ['Finland', 'Sweden', 'Norway','Denmark','Iceland', 'Estonia','Russia'].
1. unpacking 5 phần tử đầu và lưu trữ vào biến nordic_countries
2. unpacking Estonia,Russia và lưu trữ vào biến es
```
names = ['Finland', 'Sweden', 'Norway','Denmark','Iceland', 'Estonia','Russia']
a, b, c, d, e, f ,g = names
nordic_countries=[a, b, c, d ,e]
es=[f,g]
print(nordic_countries)
print(es)
```