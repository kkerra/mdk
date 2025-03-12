# SP
## арифметические операции в asm

### add - сложение

add dest, src // dest = dest + src

Пример:
```asm
  mov eax, a;
  mov ebx, b;
  add eax, ebx;
  mov sum, eax;
```

### sub - вычитание

sub dest, src // dest = dest - src

Пример:
```asm
  mov eax, a;
  mov ebx, b;
  sub eax, ebx;
  mov subtract, eax;
```

### int - инкремент

inc dest

Пример:
```asm
  inc eax; // eac++
```

### dec - декремент 

dec dest

Пример:

```asm
  dec ecx; //ecx--
```

### mul и imul - умножение

умножает два числа. mul - беззнаковые числа. imul - со знаком

mul dest, source // dest = dest * source

mul src; // eax = eax * src

```asm
mov eax, 3
imul eax, 5 // eax = eax * 5 = 3 * 5 = 15
```

### div и idiv - деление

idiv - два числа со знаком. div - без знака.

div reg 8

div reg16

div reg 32
первый операнд всегда регистр. второй - регистр, переменная или константа. оба операнда должны совпадать по размеру регистра(16, 32, 64-разрядные)

```asm
  xor eax, eax;
  mov eax, 22; //32-разрядный регистр
  mov ebx, 5; //32-разрядный регистр
  div ebx; //eax = 4(result), edx = 2(остаток)
```

```asm
  xor eax, eax;
  xor edx, edx;
  mov eax, 12;
  mov ebx, 4;
  div ebx; eax / ebx
  mov re, eax;
  mov ost, ebx;
```

Для режима пошаговой отладки F10. Отладка -> Окна -> Регистры. ПКМ -> регистры ЦП
