# Ngày thứ 9 học python
## 1. Câu lệnh điều kiện trong python
- Theo mặc định, các câu lệnh trong tập lệnh Python được thực thi tuần tự từ trên xuống dưới. Nếu logic xử lý yêu cầu như vậy thì luồng thực thi tuần tự có thể được thay đổi theo hai cách:
    - Thực thi có điều kiện: một khối gồm một hoặc nhiều câu lệnh sẽ được thực thi nếu một biểu thức nào đó là đúng
    - Thực thi lặp lại: một khối gồm một hoặc nhiều câu lệnh sẽ được thực thi lặp đi lặp lại miễn là một biểu thức nhất định là đúng. Trong phần này, chúng ta sẽ đề cập đến các câu lệnh if , else , elif . Ở đây, các toán tử so sánh và logic mà chúng ta đã học ở các phần trước sẽ rất hữu ích.
## 2. Câu lệnh if đơn:
```
x = 10
if x > 5:
    print("x lớn hơn 5")
```
## 3. Câu lệnh if-else:
```
x = 10
if x > 5:
    print("x lớn hơn 5")
else:
    print("x không lớn hơn hoặc bằng 5")
```
## 4. Câu lệnh if-elif-else:
```
x = 10
if x > 10:
    print("x lớn hơn 10")
elif x == 10:
    print("x bằng 10")
else:
    print("x nhỏ hơn 10")
```
## 5. Toán tử logic + điều kiện
- if + and : thỏa mãn đồng thời 2 điều kiện
- if + or : thỏa mãn 1 trong 2 điều kiện
## 6. Bài tập
Cho đoạn code sau:
```
        person={
    'first_name': 'Asabeneh',
    'last_name': 'Yetayeh',
    'age': 250,
    'country': 'Finland',
    'is_marred': True,
    'skills': ['JavaScript', 'React', 'Node', 'MongoDB', 'Python'],
    'address': {
        'street': 'Space street',
        'zipcode': '02210'
    }
    }
```
```
 * Check if the person dictionary has skills key, if so print out the middle skill in the skills list.
 * Check if the person dictionary has skills key, if so check if the person has 'Python' skill and print out the result.
 * If a person skills has only JavaScript and React, print('He is a front end developer'), if the person skills has Node, Python, MongoDB, print('He is a backend developer'), if the person skills has React, Node and MongoDB, Print('He is a fullstack developer'), else print('unknown title') - for more accurate results more conditions can be nested!
 * If the person is married and if he lives in Finland, print the information in the following format:
```

- Kết quả
```
person = {
    'first_name': 'Asabeneh',
    'last_name': 'Yetayeh',
    'age': 250,
    'country': 'Finland',
    'is_married': True,
    'skills': ['JavaScript', 'React', 'Node', 'MongoDB', 'Python'],
    'address': {
        'street': 'Space street',
        'zipcode': '02210'
    }
}

# Check if the person dictionary has skills key, if so print out the middle skill in the skills list.
if 'skills' in person:
    skills_list = person['skills']
    middle_skill_index = len(skills_list) // 2
    middle_skill = skills_list[middle_skill_index]
    print(f"Middle skill: {middle_skill}")

# Check if the person dictionary has skills key, if so check if the person has 'Python' skill and print out the result.
if 'skills' in person and 'Python' in person['skills']:
    print("The person has Python skill.")

# Check the person's skills and determine the title
if 'skills' in person:
    skills = person['skills']
    if skills == ['JavaScript', 'React']:
        print("He is a front end developer")
    elif set(['Node', 'Python', 'MongoDB']).issubset(skills):
        print("He is a backend developer")
    elif set(['React', 'Node', 'MongoDB']).issubset(skills):
        print("He is a fullstack developer")
    else:
        print("Unknown title")

# If the person is married and lives in Finland, print the information in the specified format
if person.get('is_married') and person.get('country') == 'Finland':
    print(f"{person['first_name']} {person['last_name']} is married and lives in Finland.")

```