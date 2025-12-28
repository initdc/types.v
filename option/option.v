module option

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

fn (o Opt[T]) is_some() bool {
	return o.some
}

fn (o Opt[T]) is_none() bool {
	return !o.some
}

fn (o Opt[T]) is_some_and(f fn (T) bool) bool {
	if !o.some {
		return false
	}
	return f(o.value)
}

fn (o Opt[T]) map[U](f fn (T) U) Opt[U] {
	if o.some {
		v := f(o.value)
		return some[U](v)
	}
	return non[U]()
}

fn (o Opt[T]) map_or[U](def U, f fn (T) U) U {
	if o.some {
		return f(o.value)
	}
	return def
}
