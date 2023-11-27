- [Linux history](#linux-history)
- [Distro](#distro)
- [Licensing](#licensing)
- [Các câu lệnh được sử dụng như thế nào](#các-câu-lệnh-được-sử-dụng-như-thế-nào)
  - [Man page](#man-page)
  - [học về thư mục](#học-về-thư-mục)
    - [pwd (Print Working Directory)](#pwd-print-working-directory)
    - [cd  (Change Directory)](#cd--change-directory)
    - [cd ~](#cd-)
    - [cd ..](#cd--1)
    - [cd -](#cd--)
    - [Đường dẫn tuyệt đối và đường dẫn tương đối](#đường-dẫn-tuyệt-đối-và-đường-dẫn-tương-đối)
    - [Phím Tab](#phím-tab)
    - [ls (list)](#ls-list)
    - [mkdir (make directory)](#mkdir-make-directory)
    - [file](#file)
    - [touch](#touch)
    - [rm (remove)](#rm-remove)
    - [cp (copy)](#cp-copy)
    - [rename](#rename)
    - [Hiển thị nội dung file](#hiển-thị-nội-dung-file)
  - [Shell expansion](#shell-expansion)
    - [Tìm hiểu đơn giản](#tìm-hiểu-đơn-giản)
    - [command](#command)
      - [External commands và Builtin commands](#external-commands-và-builtin-commands)
  - [Các toán tử điều khiển](#các-toán-tử-điều-khiển)
    - [`;`](#)
    - [`&`](#-1)
    - [`&&`](#-2)
    - [`||`](#-3)
    - [`#`](#-4)
    - [`\`](#-5)
  - [Các biến trong shell](#các-biến-trong-shell)
    - [`$`](#-6)
    - [Biến môi trường](#biến-môi-trường)
  - [Các tùy chọn trong shell](#các-tùy-chọn-trong-shell)
    - [shell option](#shell-option)
  - [shell history](#shell-history)
  - [file globbing](#file-globbing)
  - [pipes and commands](#pipes-and-commands)
    - [stdin, stdout, and stderr](#stdin-stdout-and-stderr)
    - [noclobber](#noclobber)
    - [`2>&1`](#21)
  - [input tiêu chuẩn](#input-tiêu-chuẩn)
    - [`<`](#-7)
    - [`<<`](#-8)
    - [`<<<`](#-9)
  - [filter](#filter)
    - [grep](#grep)
    - [cut](#cut)
    - [tr(trim)](#trtrim)
    - [wc (word counting)](#wc-word-counting)
    - [sort](#sort)
    - [uniq](#uniq)
    - [comm](#comm)
    - [od](#od)
    - [sed](#sed)
  - [basic Unix tools](#basic-unix-tools)
    - [find](#find)
    - [locate](#locate)
    - [date](#date)
    - [Cal](#cal)
    - [sleep](#sleep)
    - [time](#time)
    - [gzip và gunzip](#gzip-và-gunzip)
    - [zcat và zmore](#zcat-và-zmore)
    - [bzip2 vaf bunzip2](#bzip2-vaf-bunzip2)
    - [bzcat và bzmore](#bzcat-và-bzmore)
  - [Biểu thức](#biểu-thức)
    - [grep](#grep-1)
  - [trình soạn thảo vi](#trình-soạn-thảo-vi)
  - [scripting](#scripting)
    - [comment](#comment)
    - [Varb](#varb)
    - [sourcing a script](#sourcing-a-script)
  - [scripting loops](#scripting-loops)
    - [test](#test)
    - [if then else](#if-then-else)
    - [if then elif](#if-then-elif)
    - [for loop](#for-loop)
    - [while loop](#while-loop)
    - [until loop](#until-loop)
  - [scripting parameters](#scripting-parameters)
    - [read](#read)
    - [sourcing a config file](#sourcing-a-config-file)
    - [getopts](#getopts)
  - [more scripting](#more-scripting)
    - [eval](#eval)
    - [(( ))](#-)
    - [let](#let)
    - [case](#case)
    - [shell functions](#shell-functions)
  - [local user management](#local-user-management)
    - [whoami](#whoami)
    - [who](#who)
    - [W](#w)
    - [id](#id)
    - [su và các biến thể của su](#su-và-các-biến-thể-của-su)
  - [user management](#user-management)
    - [/etc/passwd](#etcpasswd)
    - [root](#root)
    - [useradd](#useradd)
    - [/etc/default/useradd](#etcdefaultuseradd)
    - [userdel](#userdel)
    - [usermod](#usermod)
    - [login shell](#login-shell)
    - [chsh](#chsh)
  - [user passwords](#user-passwords)
    - [passwd](#passwd)
    - [shadow file](#shadow-file)
- [Tài liệu tham khảo](#tài-liệu-tham-khảo)
# Linux history
- Năm 1969 Dennis Ritchie và Ken
Thompson cùng nhau phát triển ngôn ngữ C hệ điều hành unix và họ đã chia sẻ ra cho toàn thế giới 
- Năm 1975 AT&T bắt đầu bán ra unix với hơn 1 nữa source code là của Dennis Ritchie và Ken
Thompson ,họ đã không vui dẫn đến kết quả họ đã phát triển ra phiên bản 2 của unix kèm theo free BSD Unix.
- Nắm 1980 có rất nhiều công ty hưởng ứng và bắt đầu phát triển Unix của riêng họ và đã tạo ra một mớ hỗn độn .Lúc này Richard Stallman bắt đầu muốn phát triển ra 1 hệ điều hành miễn phí cho người dùng mà bắt đầu với GNU chứ ko phải UNIX
- Năm 1990 Nineties bắt đầu Linus Torvalds và đưa source lên trên mạng . Lúc này rất nhiều người kết hợp với GNU tool và cho rằng nó là một bước đột phá
- 2015 đến nay linux đã phát triển rất phổ biến và trải rộng trên khắp thế giới

# Distro
- Hiện tại Linux đã có rất nhiều distro và có kể đén các ông lớn như: REDHAT, UBUNTU ,DEBIAN ,...

|Distro|Mục đích sử dụng|
|------|----------------|
|Red Hat Enterprise (RHEL)|Bạn là người quản lý và muốn có sự suport tốt|
|Centos|Bạn muốn sử dụng Red Hat mà không có sự suport của red hat|
|Fedora|Bạn muốn sử dụng Red Hat trên laptop và desktop|
|Debian|Sử dụng với mục đích dùng cho server,laptop hay các thiết bị khác|
|Ubuntu|Rất phổ biến và dựa trên Debian|
|Kali|Bạn muốn có một giao diện hack chỉ bằng một cú nhấp chuột|

# Licensing
- Vấn đề bản quyền là vấn đề chúng ta rất muốn biết đúng không
- Ta có thể xem các giấy phép [ở trên đấy](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/linux/giayphepmanguonmo.md)

# Các câu lệnh được sử dụng như thế nào
## Man page
- Hay còn được gọi là manual page 
- Man là câu lệnh trợ giúp bạn hiểu thêm về cách dùng các câu lệnh khác
- Ví dụ bạn muốn hỏi câu lệnh systemctl dùng như thế nào 

```
man systemctl
```

![Alt](/thuctap/anh/Screenshot_230.png)

## học về thư mục
Phần này sẽ học về các câu lệnh liên quan đến thư mục như pwd, cd, ls, mkdir và rmdir
### pwd (Print Working Directory)
- Đây là câu lệnh xem đường dãn mà vị trí hiện tại bạn đang đứng

![Alt](/thuctap/anh/Screenshot_231.png)

### cd  (Change Directory)
- Đây là câu lệnh giúp bạn di chuyển đến thư mục chỉ đinh bằng cách chỉ ra đường dẫn của nó

![Alt](/thuctap/anh/Screenshot_232.png)

### cd ~
khi bạn gõ `cd`=`cd ~` nó sẽ đua bạn về thư mục chính của bạn

![Alt](/thuctap/anh/Screenshot_233.png)

### cd ..
- đưa bạn về thư mục cao hơn vị trí bạn đang đứng 1 cấp

![Alt](/thuctap/anh/Screenshot_234.png)

### cd - 
- Đưa bạn về thư mục trước đó bạn đang đứng

![Alt](/thuctap/anh/Screenshot_235.png)

### Đường dẫn tuyệt đối và đường dẫn tương đối
- Đường dẫn tuyệt đối sẽ lấy thư mục root làm chuẩn bắt đầu bằng ký tự `/` còn đường dẫn tương đối lấy vị trí bạn đang đứng làm chuẩn sẽ không bắt đầu bằng kí tự gì cả

### Phím Tab
- Nó giúp bạ không cần nhớ đầy đủ lệnh ví dụ bạn chỉ cần gõ `cd /et`+`Tab` thì nó sẽ hiện ra câu lệnh đầy đủ `cd /etc/`

### ls (list)
- Bạn có thể xem list những nội dung có trong thư mục đang đứng
- Nó có một vài tùy chọn như:
  - `ls -a` show tất cả bao gồm cà file ẩn
  - `ls -l` nó sẽ show cho bạn các file dưới dạng chi tiết hơn như phân quyền ,chủ sở hưu hay dung lượng
  - `ls -lh` nó cũng tương tự như `ls -l` nhưng được cho là trình bày đẹp hơn

![Alt](/thuctap/anh/Screenshot_236.png)

### mkdir (make directory)
- Dùng để tạo thư mục ,nó tương tự như new forder trong windows vậy
- Ta có một vài biến thể như
  - `mkdir [file-name]` :tạo thư mục trống
  - `mkdir -p [file-name]` :khi bạn muốn tạo thư mục con trong thư mục con
  - `rmdir [file-name]`: xóa thư mục trống
  - `rmdir -p [file-name]` :xóa thư mục con trong thư mục

![Alt](/thuctap/anh/Screenshot_237.png)

### file
- là câu lệnh giúp ta biết chi tiết về file hơn

![Alt](/thuctap/anh/Screenshot_238.png)

### touch 
- là câu lệnh tạo ra file mới và ta cũng có biến thể như `touch -t` để chỉnh sửa thời gian tạo ra file đó đồng thời cấp quyền cho file đó

![Alt](/thuctap/anh/Screenshot_239.png)

### rm (remove)
- dùng để xóa file hay thư mục
- Một số biến thể như 
  - `rm -i`: hỏi trước khi xóa
  - `rm -rf` : xóa thư mục bình thường rm chỉ xóa được thư mục rỗng nhưng rm-rf xóa được cả thư mục có nội dung

![Alt](/thuctap/anh/Screenshot_240.png)

### cp (copy)
- Dùng để copy file 
- Có các biến thể như
  - `cp` copy 1 file
  - `cp -r` copy tất cả các file mà nằm trong thư mục đó
  - `cp -i` copy file nếu có file trùng sẽ hỏi xem có được đè lên file đấy ko

### rename 
- ta dùng để kết hợp với rm để có thể đổi tên nhiều file cùng 1 lúc
- ví dụ như ta muốn đổi tên các file có đuôi .txt thành file .img

```
rename 's/\.txt/\.png/' *.txt
```

![Alt](/thuctap/anh/Screenshot_241.png)

### Hiển thị nội dung file
- `head`: Dùng để hiển thị 10 dòng đầu của file
- `tail`: dùng để hiển thị 10 dòng cuối cùng của file
- `cat`: dùng để hiển thị toàn bộ file

![Alt](/thuctap/anh/Screenshot_242.png)

- Ta có 1 vài biến thể có thể sử dụng cat như sắp xếp nội dung file nối liền kiểu trình bày file 1 rồi trình bày file 2`cat file1 file2`

- Ta có thể thêm vào nội dung các dòng bằng `<<`
- Dùng `>` để copy file

![Alt](/thuctap/anh/Screenshot_243.png)

![Alt](/thuctap/anh/Screenshot_244.png)

## Shell expansion

Nói một cách đơn giản, shell là một chương trình nhận lệnh từ bàn phím và đưa chúng cho hệ điều hành thực hiện.
### Tìm hiểu đơn giản
- khoảng trắng trong shell : nhiều khoảng trắng liên tiếp sẽ chỉ được tính là một

![Alt](/thuctap/anh/Screenshot_245.png)

- Để loại bỏ khoảng trắng thì ta phải thêm dấu ngoặc kép vào 

![Alt](/thuctap/anh/Screenshot_246.png)

- Ta cũng có thể hiển thị xuống dòng bằng option `-e` và dấu `/n`

![Alt](/thuctap/anh/Screenshot_247.png)

### command
#### External commands và Builtin commands
- External commands :là lệnh bên ngoài và là những lệnh có hệ nhị phân riêng và nằm ở đâu đó trong file system
- Builtin commands : là lệnh có sẵn và là một phần không thể thiếu của shell bản thân chương trình

- Ta có thể xem lệnh nào là External commands và Builtin commands bằng lệnh type và cũng biết được nơi mà câu lệnh được đặt

![Alt](/thuctap/anh/Screenshot_248.png)

- Ta có thể xem đường dẫn đặt các câu lệnh bằng lệnh `which`

![Alt](/thuctap/anh/Screenshot_249.png)

- Ta có thể đặt bí danh cho lệnh để dễ nhớ và mỗi khi cần dùng đến lệnh chỉ cần gọi bí danh thay vì lệnh

```
 alias dog=cat
```
  
![Alt](/thuctap/anh/Screenshot_250.png)

- ta có thể tận dụng alias để làm ngắn gọn câu lênh ví dụ`clear=c` thì khi ta gõ `c` enter thì đã xóa rồi không cần gõ dài dòng làm gì

- Ta có thể tìm bí danh đã được gắn bằng câu lệnh `alias + bí danh` những câu lệnh nào 
- để xóa bí danh ta sử dụng lệnh `unalias`

![Alt](/thuctap/anh/Screenshot_251.png)

## Các toán tử điều khiển 
### `;`
- Khi bạn sử dụng dấu `;` để ngăn cách các câu lệnh cùng 1 dòng thì máy sẽ hiểu là thực hiện tuần tự các câu lệnh đến khi kết thúc

![Alt](/thuctap/anh/Screenshot_252.png)
### `&`
- Khi bạn thêm dấu `&` ở cuối câu lệnh thì máy sẽ hiểu rằng sau khi thực hiện xong câu lệnh và đang đợi bạn gõ câu lệnh tiếp theo

![Alt](/thuctap/anh/Screenshot_253.png)

### `&&`
- Dùng để thực hiện xong câu lệnh 1 rồi đến câu lệnh 2

![Alt](/thuctap/anh/Screenshot_254.png)

### `||`
- Nó có nghĩa là hoặc .hoặc làm cái này hoặc làm cái kia,nếu cái trước không đúng thì mới xét đến cái sau

![Alt](/thuctap/anh/Screenshot_255.png)

### `#`
- Ta dùng nó đẻ viết comment hay giải thích câu lệnh

![Alt](/thuctap/anh/Screenshot_256.png)

### `\`
-  dùng khi ta muốn thêm kí tự đặc biệt mà không muốn hiểu kí tự đó như 1 câu lệnh

![Alt](/thuctap/anh/Screenshot_257.png)

## Các biến trong shell
### `$`
- Ta hiểu nó như là tên gọi của biến vậy ví dụ như khi ta đặt x=name thì khi ta gọi $x thì nó sẽ hiểu là name
- ví dụ : Đặt name=quang và gọi biến đó ra

![Alt](/thuctap/anh/Screenshot_258.png)

- Ta có thể sử dụng lệnh `set` và `unset` để đặt tên biến và xóa nó đi

![Alt](/thuctap/anh/Screenshot_259.png)

### Biến môi trường
- Biến môi trường là biến mà đã được định nghĩa sẵn rồi mà chúng ta không cần phải định nghĩa bằng set nữa, nó đã được thiết lập sẵn khi chạy hệ điều hành rồi

![Alt](/thuctap/anh/Screenshot_260.png)

- Ta có thể dung lệnh `env` để xem các biến môi trường

![Alt](/thuctap/anh/Screenshot_261.png)

- Làm thế nào để tạo ra một biến môi trường .Ta có thể sử dụng lệnh `export`

```
export VAR="value"
```
trong đó VAR là tên biến còn value là giá trị của biến

![Alt](/thuctap/anh/Screenshot_262.png)

- lưu ý : ta chỉ có thể dùng biến thay thế cho 1 cụm từ chứ ko phải 1 vài từ trong 1 cụm từ


## Các tùy chọn trong shell
- Shell có thể được nhúng trên các dòng lệnh nhưng nó chỉ có tác dụng ngay lúc đó thôi . hãy nhìn vào ví dụ để hiểu rõ

![Alt](/thuctap/anh/Screenshot_263.png)

- ta đã nhúng shell vào câu lệnh echo nhưng biến var1 chỉ có tác dụng ngay lúc đó thôi

- hãy lưu ý dấu tích ngược nó dùng có thể dùng để chạy một loạt các câu lệnh
- hãy nhìn vào hình và phân tích

![Alt](/thuctap/anh/Screenshot_264.png)

- Câu dòng lênh này sẽ in ra kết quả mà trong dấu tích ngược trả về là in ra những file mà có chư pass
### shell option
- Theo mặc định shell sẽ hiểu các biến mà chưa được đặt sẽ là biến trống ,không có giá trị ,ta có thể loại bỏ điều này bằng lệnh `set -u` và đặt lại bằng lệnh `set +u`

![Alt](/thuctap/anh/Screenshot_265.png)

## shell history
- shell history sẽ giúp bạn dễ dàng nhắc lại các câu lệnh trước đó

- ta có thể xem các câu lệnh đã thực hiện trước đó bằng `!!` và tìm kiếm câu lệnh có từ gì đấy bằng dấu `![từ]`

![Alt](/thuctap/anh/Screenshot_266.png)

- Ta có thể xem 20 câu lệnh trước đó bằng lệnh `history 20`
- hay để xem câu lệnh số 2 thì `!2`

![Alt](/thuctap/anh/Screenshot_267.png)

- ta có thể dùng `ctrl +r` để tìm kiếm các lệnh đã dùng bằng cách gõ các từ trùng

![Alt](/thuctap/anh/Screenshot_268.png)

- Ta có thể xem size lịch sử tối đa có thể lưu
- và chỉnh sửa size của nó
- hay xem file history được lưu ở đâu

![Alt](/thuctap/anh/Screenshot_270.png)

## file globbing
- sự khác biệt giữa `*` `?` : `*` có thể thay thế cho nhiều kí tự còn `?` chỉ thay thế cho 1 kí tự

![Alt](/thuctap/anh/Screenshot_271.png)

- `[]` cung cấp cho ta sự lựa chọn ,chỉ cần q trong những từ trong ngoặc phù hợp là được 

![Alt](/thuctap/anh/Screenshot_272.png)

- Ta có thể viết gọn các số từ 1 đến 9 thành 1-9 hoặc từ a đến z thành a-z

```
paul@RHELv4u4:~/test$ ls [A-Z]ile?
file1 file2 file3 File4
paul@RHELv4u4:~/test$ ls [a-z]ile?
file1 file2 file3 File4
paul@RHELv4u4:~/test$ echo $LANG
en_US.UTF-8
paul@RHELv4u4:~/test$ LANG=C
paul@RHELv4u4:~/test$ echo $LANG
C
paul@RHELv4u4:~/test$ ls [a-z]ile?
file1 file2 file3
paul@RHELv4u4:~/test$ ls [A-Z]ile?
File4
paul@RHELv4u4:~/test$

```
Hãy nhìn vào ví dụ này khi ta thay biến `LANG` hay language thif a-z hay 1-9 sẽ không còn khả dụng nữa

##  pipes and commands
### stdin, stdout, and stderr

![Alt](/thuctap/anh/Screenshot_273.png)

- Đây chính là 3 luồng điều diễn ra trong bash 
  - Luồng 1 là standard in :là dữ liệu chuẩn đầu vào
  - Luồng 2 là standard out :là dữ liệu đầu ra chuẩn ,chỉ khi có kết quả thì mới đến luồng này
  - Luồng 3 là standard error : khi đầu ra bị sai sẽ đưa vào luồng này
  - Hãy tưởng tượng rằng nếu câu lệnh bị lỗi thì sẽ có thông báo là lỗi còn câu lệnh đúng thì nó sẽ thực hiện và trả ra kết quả

### noclobber
- Ta có thể sử dụng câu lệnh echo để thêm nội dung vào file và để ngăn chặn điều đó ta sử dụng noclobber

```
set -o noclobber
```
![Alt](/thuctap/anh/Screenshot_274.png)

### `2>&1`
- Ta hiểu rằng `2` chính là đầu ra lỗi
- `1` chính là đầu ra tiêu chuẩn
- Nên `2>&1` ngụ ý rằng hãy coi tất cả những lỗi như là không có gì ta có thể hiểu đơn giản hơn là không in ra thông báo lỗi nữa

![Alt](/thuctap/anh/Screenshot_275.png)

## input tiêu chuẩn
### `<`
- Ta có thể sử dụng `<` với hàm ý chỉ đây chính là input (bình thường khi gõ lệnh ta sẽ không cần mà máy vẫn có thể hiểu được)

### `<<`
- với ký tự này ta hiểu rằng ta có thể nhập thêm rất nhiều input cho đến khi có từ giống với từ sau ký tự `<<` thì mới kết thúc lệnh

### `<<<`
- Ta hiểu rằng nó sẽ truyền trục tiếp 1 chuỗi đến câu lệnh 

![Alt](/thuctap/anh/Screenshot_276.png)

## filter
### grep
- Câu lệnh này dùng để lọc thông tin .chi tiết [tại đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/linux/caulenhhaydung.md#grep)

### cut
- Lệnh `cut` dùng để hiển thị ra các kí tự mà ta chỉ định và trong lệnh `cut` một vài option như
- b cắt theo vị trí byte
- C cắt theo vị trí kí tự
- f trích xuất theo 1 trường cụ thể 

![Alt](/thuctap/anh/Screenshot_277.png)

### tr(trim)
- trương tự như lệnh cut thì lệnh `tr` lại là ngược lại của lệnh `cut`. `cut` thì hiển thị cái đã chọn còn `tr` thì loại bỏ hoặc thay thế cái đã chọn

![Alt](/thuctap/anh/Screenshot_278.png)

### wc (word counting)
- lệnh này dùng để đếm số dòng ,string ,số kí tự

![Alt](/thuctap/anh/Screenshot_279.png)

### sort
- Là lệnh dùng để sắp xếp dòng theo tiêu chuẩn alphabetical, a-z

![Alt](/thuctap/anh/Screenshot_280.png)

### uniq
- Bạn có thể xóa bỏ các dòng trùng nhau liên tiếp với lệnh này

![Alt](/thuctap/anh/Screenshot_281.png)

### comm
- Dùng để so sánh file ,nó sẽ xuất ra 2 cột ,cột 1 file 1 có file 2 không có, cột 2 cả 2 file cùng có và dòng chú thích về dòng khác biệt

![Alt](/thuctap/anh/Screenshot_282.png)

### od
- là câu lệnh xuất dữ liệu dưới dnagj số bát phân ,nó cũng có thể xuất ra dưới dạng số thập lục phân hay thập phân
- b : duói dạng bát phân
- c : dưới dạng ascii

![Alt](/thuctap/anh/Screenshot_283.png)

### sed

- Câu lệnh sed dùng để thay thế chữ trong file
- cấu trúc câu lệnh sed

```
sed 's/[từ được thay]/[từ thay]/'
```

![Alt](/thuctap/anh/Screenshot_285.png)

- Nhưng sed chỉ có thể thay thế ngay từ đầu tiên thôi còn nếu muốn thay thế tất cả các từ xuất hiện ta phải thêm chứ g vào cuối


```
sed 's/[từ được thay]/[từ thay]/g'
```

- Ta có thể xóa kí tự nào đó ra khỏi 

```
sed '/[từ cần xóa]/d'
```
![Alt](/thuctap/anh/Screenshot_286.png)

- Ta hãy nhớ thêm option -i nữa khi muốn thay đổi hẳn nội dung file

![Alt](/thuctap/anh/Screenshot_287.png)


- Ta có thể tìm hiểu thêm 1 số chức năng khác [ở đây](https://github.com/thanhquang99/thuctap/blob/master/bash_script/part7.md)

## basic Unix tools
### find 
- Ta có thể tìm kiếm bằng câu lệnh find kết hợp với `>` để thêm điều kiện

![Alt](/thuctap/anh/Screenshot_288.png)

Tìm trong file /etc/ có file nào có dạng etcfiles.txt

![Alt](/thuctap/anh/Screenshot_289.png)

### locate
- gần giống với find nó cũng dùng để định vị đường dẫn đén file chỉ định và trong file chỉ định có chứa những cái gì

![Alt](/thuctap/anh/Screenshot_290.png)

### date
- câu lệnh xem ngày giờ

![Alt](/thuctap/anh/Screenshot_291.png)

### Cal
- Câu lệnh xem lịch

![Alt](/thuctap/anh/Screenshot_292.png)

### sleep
- Câu lệnh tạm thời dừng mọi việc trong thời gian ấn định
- tạm dừng 5s

```
sleep 5
```
### time
- Dùng để hiển thị chênh lệch thời gian so với chuẩn

![Alt](/thuctap/anh/Screenshot_293.png)

### gzip và gunzip
- khi ổ đĩa của bạn cần tiết kiệm tài nguyên bạn cần phải nén file lại thì hãy nghĩ đến nó 1 là nén 1 là giải nén

![Alt](/thuctap/anh/Screenshot_294.png)

### zcat và zmore
- các file được nén bằng gzip có thể được xem bằng zcat và zmore

![Alt](/thuctap/anh/Screenshot_295.png)

### bzip2 vaf bunzip2 
- là bản nâng cấp của gzip

### bzcat và bzmore
- dùng để xem bản nén bzip2

## Biểu thức
### grep
- Ta hãy hiểu rằng bất kỳ một câu lệnh đều sẽ có thêm cách dùng ví dụ như khi dùng câu lệnh grep để tìm kiếm thì ta còn có lựa chọn tìm kiếm những dòng mà không có kí tự đấy
- Một vài ký tự đặc biệt cần nhớ
  - `$` : ví dụ 1$ ám chỉ từ có kết thúc bằng ký tự 1
  - `^`: ví dụ 1^ ám chỉ từ có bắt đầu bằng ký tự 1 
  - `\\b` :từ trong ngoặc


![Alt](/thuctap/anh/Screenshot_296.png)

## trình soạn thảo vi
- Các bạn có thể tìm hiểu thêm [ở đây](https://github.com/thanhquang99/thuctap2023/blob/main/thuctap/linux/vi-linux.md)

## scripting
- Khi nhiều các câu lệnh được gộp lại thì người ta gọi nó là bash shell

- Đầu tiên ta phải tìm hiểu quá trình tạo ra bash
  - tạo file
  - cấp quyền file để file có thể chạy `chmod +x [tên file]`
  - viết nội dung file. Có 1 lưu ý rằng câu lệnh bắt buộc phải có ở dòng đầu tiên trong bash `#!/bin/bash` để hướng dẫn một shell chạy tập lệnh ở đâu

### comment
- Để ám chỉ 1 dòng là chú thích hay bình luận thì dòng đó sẽ bắt đầu bằng dấu `#`
### Varb
- Để gắn các biến thì ta làm tương như bình thường

```
[tên biến]=[giá trị biến]
```

### sourcing a script
- Để chạy tệp bash ta có 2 cách dùng

```
source ./[tên file]
./[tên file]

```
- Một cách khác để chạy tập bash 

```
bash [tên file]
```
- Ta có thể thêm tiền tố -x để xem có những lệnh nào trong file

![Alt](/thuctap/anh/Screenshot_297.png)

![Alt](/thuctap/anh/Screenshot_298.png)

- ta có thể sử dụng `#!/bin/bash--` để Để cải thiện tính bảo mật của tập lệnh và tránh giả mạo trình thông dịch

## scripting loops
### test
- là lệnh kiểm tra kết quả đúng sai nếu đúng trả về 1 sai trả về 2 hoặc true và false cũng được tính

![Alt](/thuctap/anh/Screenshot_299.png)

### if then else
- Ý nghĩa của lệnh này là nếu đúng điều kiện của if thì làm việc của else

```
if <some-condition>
then
<some-commands>
else
<some-commands>
fi
```

###  if then elif
- elif sẽ tạo ra thêm 1 điều kiện nữa
```
if [ <some-condition> ]
then
 <some-commands>
elif [<some-condition> ]
then
 <some-commands>
else
 <some-commands>
fi
```

![Alt](/thuctap/anh/Screenshot_299.png)

### for loop
- Đây là câu lệnh lặp . nó tạo ra 1 vòng lặp ,nếu cứ lặp 1 lần  thì câu lệnh sẽ được thực hiện 1 lần

```
for var in list
do
<some-commands-here>
done
```

![Alt](/thuctap/anh/Screenshot_301.png)

### while loop 
- Trong khi điều kiện vẫn đúng thì vẫn tiếp tục thực hiện lệnh bên dưới
- 
```
i=100;
while [ $i -ge 0 ] ;
do
 echo Counting down, from 100 to 0, now at $i;
 let i--;
done

```
### until loop
- Cho đến khi điều kiện sai thì ngừng thực hiện lênh

```
let i=100;
until [ $i -le 0 ] ;
do
 echo Counting down, from 100 to 1, now at $i;
 let i--;
done
```

## scripting parameters
- ta có thể truyền giá trị của biến kết hợp lúc chạy file. Hãy nhìn vào ví dụ sau để hiểu rõ hơn. và đặc biến $0 ám chỉ tên file

![Alt](/thuctap/anh/Screenshot_302.png)

### read
- Đây là lệnh nhập giá trị vào biến

```
#!/bin/bash
echo -n Enter a number:
read number
```

![Alt](/thuctap/anh/Screenshot_303.png)

### sourcing a config file
- Sử dụng file bash trong file bash
- Ta hãy nhìn ví dụ này để phân tích


![Alt](/thuctap/anh/Screenshot_304.png)

- Nhìn vào hình ảnh ta thấy file12 dùng đẻ nhập giá trị cho biến number còn file2s đã lấy file12 để giảm thiểu công việc và để gọi được file12 thì sẽ dùng lệnh `. ./file12`

### getopts

![Alt](/thuctap/anh/Screenshot_306.png)
- Lệnh getopts kết hợp vòng lặp while sẽ cung cấp cho ta những option để thực hiện
- Hãy phân tích hình ảnh trên . khi bạn chạy fileA với option -a thì kết quả sẽ nhận đc 1 a cái khác cũng tương tự

## more scripting
### eval
- Dùng để lưu trữ lệnh trong 1 biến ,hay thay thế lệnh

![Alt](/thuctap/anh/Screenshot_307.png)

### (( ))
- cho phép đánh giá các biểu thức số

![Alt](/thuctap/anh/Screenshot_308.png)

### let
- Là lệnh dùng để tính toán giá trị biểu thức số học

![Alt](/thuctap/anh/Screenshot_309.png)

### case
- Đôi khi ta có thể dùng case để đơn giản câu lệnh if else
- Phân tích ví dụ bên dưới ta thấy nếu kết quả trùng với kết quả của case thì sẽ làm việc bên dưới

![Alt](/thuctap/anh/Screenshot_310.png)

### shell functions
- Trong một chương trình có những hàm được sử dụng nhiều lần ta có thể viết 1 function riêng cho nó khi nòa dùng chỉ việc gọi ra thôi

```
function [tên function] {Nội dung function}
```

![Alt](/thuctap/anh/Screenshot_311.png)

## local user management

### whoami
- Lệnh dùng để xem bạn đang thuộc user nào

### who
- Lệnh cung cấp thông tin cho bạn về những người đã đăng nhập vào hệ thống

### W
- Cho bạn biết ai đã đăng nhập và đang làm gì

### id
Lệnh id sẽ cung cấp cho bạn id người dùng, id nhóm chính và danh sách các nhóm bạn thuộc về

![Alt](/thuctap/anh/Screenshot_312.png)

### su và các biến thể của su
- `su user-khác` : chuyển sang tài khoản khác thực hiện lệnh
- `su -` : khi không có tên người dùng khác được cung cấp thì root sẽ được chọn
- `-m user-khác` : chạy lệnh với quyền của user khác
- `  sudo su -` : tiến hành login tk khác

## user management
### /etc/passwd
- cơ sở dữ liệu của người dùng trên local sẽ được chứa trong file /etc/passwd

![Alt](/thuctap/anh/Screenshot_313.png)

### root
- Đây được coi là người có quyền cao nhất ,nó có mọi quyền được cung cấp

### useradd
- Đây là lệnh dùng để add user 
- Ta có 1 số tùy chọn khi thêm user
  - `-m` : đồng thời tạo thư mục ở home
  - `-d` : tên thư mục tạo ở home
  - `-c` : thêm mô tả về thư mục đó

![Alt](/thuctap/anh/Screenshot_314.png)

### /etc/default/useradd
- Đây là file chứa các tùy chọn mặc định của useradd . Ta có thể xem bằng lệnh `useradd -D.`

![Alt](/thuctap/anh/Screenshot_315.png)

### userdel
- Dùng để xóa user ,kèm theo option `-r` để xóa cả thư mục mà user này tạo ra

###  usermod
- Dùng để thực hiện sửa đổi thuộc tính người dùng
- Ví dụ tôi sẽ sửa mô tả khi tạo user khuongquang trước đó

![Alt](/thuctap/anh/Screenshot_316.png)

### login shell
- Tệp /etc/passwd chỉ định shell đăng nhập cho người dùng. Và ta có thể sửa đổi điều đó


### chsh
- Người dùng có thể chỉnh sửa login shell của họ bằng lệnh chch

```
chsh -s /bin/thanhquang
```
## user passwords
### passwd
- Để thay đổi password của user đang đăng nhập ta có thể nhập lệnh `passwd` và để chỉ định user thay đổi password thì ta nhập lệnh `passwd [user-name]`, lưu ý để chỉ định được user thì ta phải có quyền root

![Alt](/thuctap/anh/Screenshot_317.png)

### shadow file
- user password được mã hóa và lưu trên file `/etc/shadow` và file này chỉ được đọc dưới quyền root
- 



# Tài liệu tham khảo

https://linux-training.be/linuxfun.pdf 