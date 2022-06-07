%lang starknet

# Starknet storage can be though about as a hashmap

# TODO
# Create a storage named wallet, mapping a felt to another
# Create a storage named height_map, mapping two felts to another
# Create a storage named id, mapping a felt to an Id

# TESTS #

from starkware.cairo.common.cairo_builtins import HashBuiltin


struct Id:
    member a : felt
    member b : felt
    member c: felt
end

@storage_var
func wallet(key : felt) -> (res : felt):
end

@storage_var
func height_map(a : felt, b : felt) -> (res : felt):
end

@storage_var
func id(key : felt) -> (res : Id):
end



@external
func test_wallet{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    let (x) = wallet.read(0)
    assert x = 0

    wallet.write(0, 100)

    let (x) = wallet.read(0)
    assert x = 100

    return ()
end

@external
func test_height_map{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    let (z) = height_map.read(0, 0)
    assert z = 0

    height_map.write(0, 0, 5)

    let (z) = height_map.read(0, 0)
    assert z = 5

    return ()
end

@external
func test_id{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    let (mr_smith) = id.read(0)
    assert mr_smith = Id(0, 0, 0)

    id.write(0, Id(37, 185, 0))

    let (mr_smith) = id.read(0)
    assert mr_smith = Id(37, 185, 0)

    return ()
end
