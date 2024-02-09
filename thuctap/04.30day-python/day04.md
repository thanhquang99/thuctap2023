# day 4 python
## 1. Tìm hiểu về string
- Bất kỳ loại dữ liệu nào được viết dưới dạng văn bản đều là một chuỗi
- Chuỗi thường được đặt trong dấu `''` hoặc dấu `""`
- để kiểm tra độ dài của chuỗi ta có thể sử dụng hàm `len()`
- Ví dụ:
  ```
  name='thanhquang'
  ```
## 2. Nối string
- Các string là độc lập với nhau. Để có thể nối chúng lại với nhau ta sử dụng phép toán công
- Dưới đây là ví dụ về nối string
  ```
    ho='khuong'
    ten='quang'
    ho_ten=ho+ten
  ```
## 3. Kí tự đặc biệt trong string
- `\n` :xuống dòng
- `\t` : tab
- `\\` : dấu gạch chéo
- `\'` : dấu ngoặc đơn
- `\"` : dấu ngoặc kép

Hãy nhìn vào ví dụ sau"
```
print('hom nay sap tet \n toi dang lam bai tap')
print('thu2\t thu3\t thư 4')
print('đây là dấu ngoặc chéo \\')
print('đây là dấu ngoặc kép \'')
print('đây là dấu ngoặc đơn \"')
```
out put
```
>>> %Run -c $EDITOR_CONTENT
hom nay sap tet 
 toi dang lam bai tap
thu2	 thu3	 thư 4
đây là dấu ngoặc chéo \
đây là dấu ngoặc kép '
đây là dấu ngoặc đơn "
>>> 
```
## 4. Các định dạng trong chỗi
Ta có thể thay đổi giá trị in ra bằng các định dạng khác nhau
- `%s` : chuỗi
- `%d` : số nguyên
- `%f` : số thực
- `%.f` : lấy chính xác số thực với vị trí sau dấu phẩy bao nhiêu chữ số

Ví dụ:
```
ho='khuong'
ten='quang'
loi_chao = 'chào bạn tôi là %s %s' %(ho, ten )
print(loi_chao)
tuoi=24.9999
gioi_thieu='toi năm nay %d tuổi hoặc %f tuổi hoặc %.2f tuổi '%(tuoi, tuoi, tuoi)
print(gioi_thieu)
```
out put
```
>>> %Run -c $EDITOR_CONTENT
chào bạn tôi là khuong quang
toi năm nay 24 tuổi hoặc 24.999900 tuổi hoặc 25.00 tuổi 
>>> 
```
Ta có thể đặt biến cho từng ký tự trong chỗi
```
name='quang'
a,b,c,d,e=name
print(a)
print(b)
print(c)
print(d)
```
out put
```
>>> %Run -c $EDITOR_CONTENT
q
u
a
n
>>> 
```
## 5. các hàm áp dụng với chuỗi
- Để có thể các sử dụng các hàm áp dụng với chuỗi thì ta cần phải áp dụng cấu trúc sau
```
bien=``
print(bien.[hàm được gọi])
```
- Một vài hàm bạn có thể tham khảo
  * `capitalize()`: Viết hoa chữ cái đầu tiên
  * `count()`: trả về số lần xuất hiện của chuỗi con trong chuỗi, đếm
  * `endwith()`: Kiểm tra xem một chuỗi có kết thúc bằng một phần cuối được chỉ định hay không
  * `expandtabs()`: Thay thế ký tự tab bằng dấu cách, kích thước tab mặc định là 8. Nó nhận đối số kích thước tab
  * `find()`: Trả về chỉ số thấp nhất của lần xuất hiện đầu tiên của một chuỗi con, nếu không tìm thấy thì trả về -1
  * `rfind()`: Trả về chỉ số cao nhất của lần xuất hiện đầu tiên của một chuỗi con, nếu không tìm thấy thì trả về -1
  * `format()`: định dạng chuỗi thành đầu ra đẹp hơn
  Thông tin thêm về định dạng chuỗi, hãy kiểm tra liên kết này
  * `index()`: Trả về chỉ số thấp nhất của một chuỗi con, các đối số bổ sung cho biết chỉ số bắt đầu và kết thúc (mặc định là 0 và độ dài chuỗi - 1)
  * `rindex()`: Trả về chỉ số cao nhất của một chuỗi con, các đối số bổ sung cho biết chỉ số bắt đầu và kết thúc (mặc định là 0 và độ dài chuỗi - 1)
  * `isalnum()`: Kiểm tra ký tự chữ và số
  isalpha(): Kiểm tra xem tất cả các phần tử chuỗi có phải là ký tự bảng chữ cái hay không (az và AZ)
  * `isdecimal()`: Kiểm tra xem tất cả các ký tự trong chuỗi có phải là số thập phân (0-9) không
  * `isdigit()`: Kiểm tra xem tất cả các ký tự trong một chuỗi có phải là số không (0-9 và một số ký tự unicode khác cho các số)
  * `isnumeric(`): Kiểm tra xem tất cả các ký tự trong một chuỗi là số hoặc có liên quan đến số (giống như isdigit(), chỉ cần chấp nhận nhiều ký hiệu hơn, như ½)
  * `isidentifier()`: Kiểm tra giá trị nhận dạng hợp lệ - có nghĩa là nó kiểm tra, nếu một chuỗi là tên biến hợp lệ
  * `islower()`: Kiểm tra xem tất cả các ký tự bảng chữ cái trong chuỗi có phải là chữ thường không
  * `isupper()`: Kiểm tra xem tất cả các ký tự bảng chữ cái trong chuỗi có phải là chữ hoa không
  * `join()`: Trả về một chuỗi được nối
  * strip(): Loại bỏ tất cả các ký tự đã cho bắt đầu từ cầu xin và kết thúc của chuỗi
  * `Replace()`: Thay thế chuỗi con bằng một chuỗi đã cho
  * `split()`: Tách chuỗi, sử dụng chuỗi đã cho làm dấu phân tách
  * `title()`: Trả về một chuỗi in nghiêng tiêu đề
  * `swapcase()`: Chuyển đổi tất cả các ký tự chữ hoa thành chữ thường và tất cả các ký tự chữ thường thành các ký tự chữ hoa
  * `startwith()`: Kiểm tra xem chuỗi có bắt đầu bằng chuỗi được chỉ định hay không

## 6. Bài tập
1. Sử dụng trình tự thoát tab để viết những dòng sau.
    ``` py
    Tên Tuổi Quốc gia Thành phố
    Asabeneh 250 Phần Lan Helsinki
    ```
2. Sử dụng phương pháp định dạng chuỗi để hiển thị như sau:

    ```sh
    bán kính = 10
    diện tích = 3,14 * bán kính ** 2
    Diện tích hình tròn có bán kính 10 là 314 mét vuông.
    ```

4. Thực hiện các thao tác sau bằng cách sử dụng các phương pháp định dạng chuỗi:

    ```sh
    8 + 6 = 14
    8 - 6 = 2
    8 * 6 = 48
    8/6 = 1,33
    8% 6 = 2
    8 // 6 = 1
    8 ** 6 = 262144
    ```

```
# Sử dụng trình tự thoát tab để viết dữ liệu
thong_tin = "Tên\t\tTuổi\tQuốc gia\tThành phố"
ghi_chu = "Asabeneh\t250\tPhần Lan\tHelsinki"
print(thong_tin)
print(ghi_chu)

# Sử dụng phương pháp định dạng chuỗi để hiển thị
bán_kính = 10
diện_tích = 3.14 * bán_kính ** 2
print(f"Diện tích hình tròn có bán kính {bán_kính} là {diện_tích} mét vuông.")

# Thực hiện các thao tác sử dụng phương pháp định dạng chuỗi
a = 8
b = 6
print(f"{a} + {b} = {a + b}")
print(f"{a} - {b} = {a - b}")
print(f"{a} * {b} = {a * b}")
print(f"{a} / {b} = {a / b:.2f}")
print(f"{a} % {b} = {a % b}")
print(f"{a} // {b} = {a // b}")
print(f"{a} ** {b} = {a ** b}")
```