## Логика

#### and - логичесоке умножение (конъюнкция)

and dest, src // dest = dest and src

```asm
  mov eax, 12
  and eax, 6 // eax and 6 = 4
```

#### or - логическое сложение (дизъюнкция)

or dest, src // dest = dest or source

#### xor - исключающее или 

xor dect, src // dest = dest xor src

#### not - отрицание

not dest; //dest = not dest

### neg - арифметическое отрицание

neg dest // dest = -dest; -dest = dest

### shl - сдвиг влево

shl dest, count

```asm
  mov eax, 2 // 10 = 2
  shl eax, 1; // 10 << 1 == 100 = 4
```

### shr - сдвиг вправо

shr dest, count

```asm
  mov eax, 2 // 10 = 2
  shr eax, 2
```

### rol - поворот влево

rol dest, count

```
mov al, 131 // 10000011
rol al, 2 // вращаем на 2 разряда влево; 10000011 << 2 = 00001110 = 14
```

### ror - вправо

ror dest, count

```
mov al, 131 // 10000011
ror al, 2 // вращаем на 2 разряда вправо; 11100000 << 2 = 00001110 = 224
```

