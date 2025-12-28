module option

fn test_new() {
	a := some(0)
	aa := Opt.some(0)
	assert a == aa

	b := non[int]()
	bb := Opt.non[int]()
	assert b == bb
}

fn test_is_some() {
	a := some(0)
	b := non[int]()

	assert a.is_some() == true
	assert b.is_some() == false
}

fn test_is_none() {
	a := some(0)
	b := non[int]()

	assert a.is_none() == false
	assert b.is_none() == true
}

fn test_is_some_and() {
	a := some('foo')
	b := non[string]()

	f1 := fn (x string) bool {
		return true
	}
	f2 := fn (x string) bool {
		return false
	}

	assert a.is_some_and(f1) == true
	assert a.is_some_and(f2) == false
	assert b.is_some_and(f1) == false
}

fn test_map() {
	a := some('foo')
	b := non[string]()

	f := fn (x string) int {
		return x.len
	}
	af := a.map(f)
	bf := b.map(f)
	assert af == some(3)
	assert bf == non[int]()
}

fn test_map_or() {
	a := some('foo')
	b := non[string]()

	f := fn (x string) int {
		return x.len
	}
	af := a.map_or(0, f)
	bf := b.map_or(0, f)
	assert af == 3
	assert bf == 0
}
