# Các câu lệnh xem nội dung file
## 1.1) head
- là lệnh xem nội dung của file mà chỉ hiển thị các dòng đầu
- Cấu trúc câu lệnh

    ```
    head -n [path-file]
    ```
    - trong đó n là số dòng muốn hiển thị tính từ dòng đầu

- ví dụ xem 15 dòng đầu file /etc/fstab

```
head -15 /etc/fstab
```

## 1.2) tail 
- Là lệnh xem nội dung file mà chỉ hiển thị các dòng cuối 
- Cấu trúc câu lệnh

    ```
    tail -n [path-file]
    ```

- ví dụ xem 15 dòng cuối file /etc/fstab

```
tail -15 /etc/fstab
```

## 1.3) Cat
- là lệnh xem toàn bộ nội dung của file

- Cấu trúc câu lệnh

    ```
    cat [path-file]
    ```

- Một số biến thể của cat
    - Ghép nội dung 2 file lại với nhau `cat file1 file2`
    - copy nội dung file này sang file kia `cat file1 > file2`
    - cat 1 đoạn văn vào file `cat >[tên file] << end ` (khi gặp từ end là kết thúc )

![Alt](/thuctap/anh/Screenshot_348.png)

![Alt](/thuctap/anh/Screenshot_349.png)

### 1.4) tac
- Là câu lệnh xem tòan bộ nội dung file nhưng mà đảo ngược từ dưới lên trên

```
tac [path-file]
```

### 1.5)more less
- Hai lệnh này sẽ hữu ích cho việc xem các tập tin mà chiếm nhiều màn hình ,ta có thể dùng dụng phím cách để next trang và phím q để thoát

