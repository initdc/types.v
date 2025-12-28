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
		return Opt[U]{
			value: v
			some:  true
		}
	}
	return Opt[U]{
		some: false
	}
}

fn main() {
	a := Opt.some('hello')
	map_len := fn (x string) int {
		return x.len
	}
	println(a.map(map_len))
}
