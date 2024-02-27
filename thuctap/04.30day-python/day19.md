# Ngày 19 học về Python
## 1. Xử lý tập tin
- Xử lý tệp là một phần quan trọng của lập trình, cho phép chúng ta tạo, đọc, cập nhật và xóa tệp. Trong Python để xử lý dữ liệu, chúng tôi sử dụng hàm dựng sẵn open()
    ```
    # Syntax
    open('filename', mode) # mode(r, a, w, x, t,b)  could be to read, write, update
    ```
  - `r` - Đọc - Giá trị mặc định. Mở một file để đọc, nó trả về lỗi nếu file không tồn tại
  - `a` - Nối- Dùng để nối thêm tệp vào tệp đã cho trước
  - `w` - Viết- Dùng để chỉnh sửa nội dung file, có thể là tạo file mới nếu file chưa tồn tại
  - `x` - Tạo - Dùng để tạo tệp được chỉ định
  - `t` - văn bản- Chế độ văn bản
  - `b`- Nhị phân - chuyển sang chế độ nhị phân ví dụ như hình ảnh
### 1.1 Mở tệp tin để đọc
- Khi mở tập tin để đọc thì ta không cần chỉ định mode cho nó 
- hãy tham khảo ví dụ
    ```
    f = open('./files/reading_file_example.txt')
    print(f) # <_io.TextIOWrapper name='./files/reading_file_example.txt' mode='r' encoding='UTF-8'>
    ```
- Khi mở file thì chúng ta cùng cần phải chọn phương thức để đọc file và đi kèm với nó là việc đóng file
- Các phướng thức đọc file 
  - `read()` : đọc toàn bộ văn bản dưới dang chuối ta có thể giới hạn số lượng ký tự bằng cách thêm số vào trong dấu ngoặc ví dụ `read(2)`
  - `readline()` : chỉ đọc dòng đầu tiên
  - `readlines()` : đọc từng dòng văn bản và trả về danh sách các dòng
  - `Splitlines()` : lấy tất cả các dòng dưới dạng danh sách
- sử dụng hàm `close()` để đóng file lại
- Ta cũng có thể sử dụng phương thức `with` kèm với hàm `open()` để tự động đóng file
- Ví dụ đối với read còn readline() và readlines() thì tương tự
    ```
    f = open('./files/reading_file_example.txt')
    txt = f.read()
    print(type(txt))
    print(txt)
    f.close()
    ```
### 1.2 Mở tập tin để viết và cập nhật