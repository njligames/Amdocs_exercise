'@TestSuite [PP] testTypeUtils
'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'@It tests testTypeUtils
'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

' file:///Users/jamesfolk/Downloads/core-video-sdk-roku_challenge-master/node_modules/rooibos/docs/module-BaseTestSuite.html#assertEqual

'@Setup
sub testTypeUtils_setup()
    m.testString = "<TEST STRING>"
    m.testInteger = 0
    m.testLongInteger = 0&
    m.testFloat = 0.0!
    m.testDouble = 0.0#
    m.testBool = true

    m.testArray = [
        m.testString,
        m.testInteger,
        m.testLongInteger,
        m.testFloat,
        m.testDouble,
        m.testBool,
        { "obj": 1 }
    ]
    m.testObject = {
        "testString": m.testString,
        "testInteger": m.testInteger,
        "testLongInteger": m.testLongInteger,
        "testFloat": m.testFloat,
        "testDouble": m.testDouble,
        "testBool": m.testBool,
        "testArray": m.testArray,
        "testObject": { "obj": 1 }
    }
    m.testFunction = function()
        print "test function"
    end function
    m.testDatetime = CreateObject("roDateTime")
    m.testNode = CreateObject("roSGNode", "Task")
    m.testList = CreateObject("roList")
end sub

'@Test
sub testTypeUtils_isString()
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isString(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isString(m.testList))
end sub

'@Test
sub testTypeUtils_isBool()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testDouble))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isBool(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBool(m.testList))
end sub

'@Test
sub testTypeUtils_isBoolean()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testDouble))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isBoolean(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isBoolean(m.testList))
end sub

'@Test
sub testTypeUtils_isInt()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testString))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isInt(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInt(m.testList))
end sub

'@Test
sub testTypeUtils_isInteger()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testString))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isInteger(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isInteger(m.testList))
end sub

'@Test
sub testTypeUtils_isLongInt()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isLongInt(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInt(m.testList))
end sub

'@Test
sub testTypeUtils_isLongInteger()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isLongInteger(m.testList))
end sub

'@Test
sub testTypeUtils_isArray()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testBool))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isArray(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isArray(m.testNode))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isArray(m.testList))
end sub

'@Test
sub testTypeUtils_isList()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isList(m.testNode))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isList(m.testList))
end sub

'@Test
sub testTypeUtils_isFloat()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testLongInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isFloat(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFloat(m.testList))
end sub

'@Test
sub testTypeUtils_isDouble()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testFloat))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isDouble(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDouble(m.testList))
end sub

'@Test
sub testTypeUtils_isDateTime()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testFunction))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isDateTime(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isDateTime(m.testList))
end sub

'@Test
sub testTypeUtils_isObject()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testArray))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isObject(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testDatetime))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isObject(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isObject(m.testList))
end sub

'@Test
sub testTypeUtils_isFunction()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testObject))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isFunction(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isFunction(m.testList))
end sub

'@Test
sub testTypeUtils_isSgNodeSubtype()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testString, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testInteger, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testLongInteger, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testFloat, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testDouble, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testBool, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testArray, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testObject, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testFunction, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testDatetime, "Task"))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testNode, "Task"))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isSgNodeSubtype(m.testList, "Task"))
end sub

'@Test
sub testTypeUtils_isComparable()
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isComparable(m.testString))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isComparable(m.testInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isComparable(m.testLongInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isComparable(m.testFloat))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isComparable(m.testDouble))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isComparable(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isComparable(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isComparable(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isComparable(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isComparable(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isComparable(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isComparable(m.testList))
end sub

'@Test
sub testTypeUtils_isNumber()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testString))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isNumber(m.testInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isNumber(m.testLongInteger))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isNumber(m.testFloat))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isNumber(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isNumber(m.testList))
end sub

'@Test
sub testTypeUtils_isUnitialized()
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testString))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testLongInteger))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testFloat))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testDouble))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testBool))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testArray))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testObject))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testFunction))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testDatetime))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testNode))
    m.assertFalse(NJLICSDK_UtilsTypeUtils().isUnitialized(m.testList))
    m.assertTrue(NJLICSDK_UtilsTypeUtils().isUnitialized(testUnitializedVariable))
end sub
