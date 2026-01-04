struct Opt[T] {
	value T
pub:
	some bool
}

fn some[T](v T) Opt[T] {
	return Opt[T]{
		value: v
		some:  true
	}
}

fn non[T]() Opt[T] {
	return Opt[T]{
		some: false
	}
}

fn Opt.some[T](v T) Opt[T] {
	return Opt[T]{
		value: v
		some:  true
	}
}

fn Opt.non[T]() Opt[T] {
	return Opt[T]{
		some: false
	}
}

fn (o Opt[T]) map[U](f fn (T) U) Opt[U] {
	if o.some {
		v := f(o.value)
		return some[U](v)
	}
	return non[U]()
}

fn typed[T, U](f fn (T) U) fn (T) U {
	return f
}

fn main() {
	a := Opt.some('hello')
	map_len := fn (x string) int {
		return x.len
	}

	println(a.map(map_len))
	println(a.map(typed[string, int](|x| x.len)))
	// // expect but not working
	// println(a.map(|x| x.len)) 
	// // type hint
	// println(a.map(|x string| x.len))
	// println(a.map[int](|x| x.len))
	// println(a.map[int](|x string| x.len))
}
