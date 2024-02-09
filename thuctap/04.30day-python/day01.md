# Ngày đầu tiên với Python
- Ngày đầu tiên ta sẽ học tính toán các phép toán đơn giản của python
  - Python hầu hết sẽ tính toán như ngôn ngữ C và để in màn hình thì sẽ sửu dụng hàm `print`
  - Để có thể kiểm tra 1 chuỗi hay số ta nhập vào là gì thì ta có thể dùng hàm `type()`
- Hãy tham khảo đoạn code sau:
```
print(2 + 3)   # in ra kết quả 2+3
print(3 - 1)   # in ra kết quả 3-1
print(2 * 3)   # in ra kết quả 2 nhân 3
print(3 / 2)   # in ra kết quả 3 chia 2
print(3 ** 2)  # in ra kết quả 3 mũ 2
print(3 % 2)   # in ra kết quae phần dư 3 chia 2
print(3 // 2)  # in ra phần nguyên của kết quả 3 chia 2

# Checking data types

print(type(10))                  # check xem 10 sẽ thuộc class số nguyên
print(type(3.14))                # check xem 3.14 sẽ thuộc class só thực
print(type(1 + 3j))              # check class số phức
print(type('Asabeneh'))          # check class chuỗi
print(type([1, 2, 3]))           # check class danh sách
print(type({'name':'Asabeneh'})) # check class tạo 1 thư viện là tập hợp các thông tin được liệt kê (dirt)
print(type({9.8, 3.14, 2.7}))    # check class tập hợp các thông tin được liệt kê (set)
print(type((9.8, 3.14, 2.7)))    # Tuple là một cấu trúc dữ liệu không thể thay đổi. Thường được sử dụng để lưu trữ các bộ giá trị liên quan và không thay đổi trong quá trình thực thi
```
- Đây là kết quả đầu ra khi chạy chương trình
```
>>> %Run -c $EDITOR_CONTENT
5
2
6
1.5
9
1
1
<class 'int'>
<class 'float'>
<class 'complex'>
<class 'str'>
<class 'list'>
<class 'dict'>
<class 'set'>
<class 'tuple'>
>>> 
```