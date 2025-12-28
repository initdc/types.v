# types.v

Bring the Rust [Result Option] types to Vlang

> V has [builtin Option/Result types](https://docs.vlang.io/type-declarations.html#optionresult-types-and-error-handling) supporting, so the project only purpose to learn [generics](https://docs.vlang.io/type-declarations.html#generics) of V.

## Usage

```v
a := some(0)
b := non[int]()

assert a.is_some() == true
assert b.is_some() == false
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/initdc/types.v
