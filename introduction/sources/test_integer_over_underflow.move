module 0x42::TestUnderOverflows
{
    struct Person has drop 
    {
        age: u8
    }

    #[test]
    fun test_overflow()
    {
        let person = Person { age: 254};
        //uint8 max value is 255
        assert!(person.age + 1 == 255, 1);
        //assert!(person.age + 2 == 0, 1);
    }

    #[test]
    fun test_underflow()
    {
        let person = Person { age: 1};
        assert!(person.age - 1 == 0, 1);
        //assert!(person.age - 2 == 255, 1);
    }

    #[test]
    fun test_division()
    {
        let person1 = Person {age: 5};
        person1.age = person1.age / 2;
        assert!(person1.age == 2, 1);
    }

    //Conclusion:
    //move throws error on under/overflow
    //move rounds down eg: 5/2 results in 2
}