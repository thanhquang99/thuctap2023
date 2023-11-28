# Bước đầu thao tác với các dong lệnh
## 1) Xem các câu lệnh làm việc như thế nào (man)
### 1.1) Tác dụng của lệnh man
Đây là câu lệnh hỗ trợ cho ta biết cách các câu lệnh khác làm việc như thế nào

### 1.2) Cấu trúc câu lệnh man
```
man [lệnh cần hỏi]
```
### 1.3) Ví dụ
- Bạn muốn biết câu lệnh systemctl dùng để làm gì

![Alt](/thuctap/anh/Screenshot_230.png)

## 2) Các câu lệnh làm việc với thư mục
### 2.1) pwd (Print Working Directory)
- Đây là câu lệnh cho biết đường dẫn của vị trí đứng hiện tại của bạn

- cấu trúc lệnh
```
pwd
```
- ví dụ

![Alt](/thuctap/anh/Screenshot_231.png)

### 2.2) cd (Change Directory)
- Đây là câu lệnh giúp bạn di chuyển đến thư mục chỉ đinh bằng cách chỉ ra đường dẫn của nó
- Cấu trúc lệnh 

```
cd [path]
```

- Mở rộng của lệnh cd 
  - `cd ~` : đưa bạn về thư mục chính
  - `cd ..` :đưa bạn về thư mục cao hơn vị trí bạn đang đứng 1 cấp
  - `cd -` : Đưa bạn về thư mục trước đó bạn đang đứng

### 2.3) ls (list)
- Đây là câu lệnh giúp bạn xem danh sách thư mục
- Cấu trúc câu lệnh 

```
ls [options] [path]
```

    - `options`:
    - `-a` :show tất cả bao gồm cà file ẩn