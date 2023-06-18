module 0x42::MovePrj 
{
    use std::debug;

    struct Person has drop 
    {
        age: u8
    }

    public fun set_age(new_age: u8): u8
    {
        let person = Person {age: new_age};
        debug::print(&person.age);
        person.age //alternative return person.age
    }

    #[test]
    fun test_set_age()
    {
        let num = set_age(10);
        debug::print(&num);
    }
}