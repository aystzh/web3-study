// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Simple Inheritance简单继承
contract Yeye{

    //定义父类事件
    event Log(string msg);

    //virtual为父合约中的函数，如果希望子合约重写，需要加上virtual关键字
    function hip() public virtual {
        emit Log("yeye");
    }

    function pop() public virtual {
        emit Log("yeye");
    }

    function yeye() public virtual {
        emit Log("yeye");
    }
}


//爸爸继承爷爷
contract Baba is Yeye{
    //override：子合约重写了父合约中的函数，需要加上override关键字。
    function hip() public virtual override {
        emit Log("baba");
    }

    function pop() public virtual override {
        emit Log("baba");
    }

    //baba函数没有重写父类方法 所以不用加override关键字
    function baba() public virtual {
        emit Log("baba");
    }

    //直接调用：子合约可以直接用父合约名.函数名()的方式来调用父合约函数，例如Yeye.pop()
    function callParent() public {
        Yeye.pop();
    }
}

//多重继承
//继承时要按辈分最高到最低的顺序排。比如我们写一个Erzi合约，继承Yeye合约和Baba合约，那么就要写成contract Erzi is Yeye, Baba，
//而不能写成contract Erzi is Baba, Yeye，不然就会报错。
//2、如果某一个函数在多个继承的合约里都存在，比如例子中的hip()和pop()，在子合约里必须重写，不然会报错。
//3、重写在多个父合约中都重名的函数时，override关键字后面要加上所有父合约名字，例如override(Yeye, Baba)。

contract Erzi is Yeye,Baba {
    function hip() public virtual override (Yeye,Baba){
        emit Log("erzi");
    }

    function pop() public virtual override (Yeye,Baba){
        emit Log("erzi");
    }
    
    //调用父类方法
    //super关键字：子合约可以利用super.函数名()来调用最近的父合约函数。Solidity继承关系按声明时从右到左的顺序是：contract Erzi is Yeye, Baba，那么Baba是最近的父合约，super.pop()将调用Baba.pop()而不是Yeye.pop()：
    function callParentSuper() public {
         // 将调用最近的父合约函数，Baba.pop()
        super.pop();
    }
}

//修饰器的继承
//Solidity中的修饰器（Modifier）同样可以继承，用法与函数继承类似，在相应的地方加virtual和override关键字即可。
contract Base1 {
    modifier exactDivideBy2And3(uint _a) virtual {
        require(_a%2==0 && _a%3==0);
        _;
    }
}


contract Indentifier is Base1{
     //计算一个数分别被2除和被3除的值，但是传入的参数必须是2和3的倍数
    function getExactDivideBy2And3(uint _divide) public exactDivideBy2And3(_divide) pure  returns (uint,uint){

        return getExactDivideBy2And3WithOutModifier(_divide);
    }

    //计算一个数分别被2和3整出
    function getExactDivideBy2And3WithOutModifier(uint _divide) public pure returns(uint,uint){
        uint _divid2 = _divide %2;
        uint _divid3 = _divide %3;
        return (_divid2,_divid3);
    }
    
    //Identifier合约可以直接在代码中使用父合约中的exactDividedBy2And3修饰器，也可以利用override关键字重写修饰器：
    modifier exactDivideBy2And3(uint a) virtual override {
        _;
        require(a%2==0 && a%3==0);
    }
}

//构造函数的继承
//子合约有两种方法继承父合约的构造函数。举个简单的例子，父合约A里面有一个状态变量a，并由构造函数的参数来确定：
abstract contract A{
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}
//在子合约的构造函数中声明构造函数的参数
contract C is A{
    constructor(uint _c)  A(_c*_c){
        
    }
}
//在继承时声明父构造函数的参数，例如：
contract D is A(2){

}

//砖石继承
contract God{

/* 继承树：
  God
 /  \
Adam Eve
 \  /
people
*/
    event Log(string msg);

    function foo() public  virtual {
        emit Log("God.foo called");
    }

    function bat() public virtual {
        emit Log("God.bat called");
    }
}

contract Adam is God{
    function foo() public virtual override {
        emit Log("Adam.foo called");
        God.foo();
    }

    function bat() public virtual override {
        emit Log("Adam.bat called");
        super.bat();
    }
}


contract Eva is God{
    function foo() public virtual override {
        emit Log("Eva.foo called");
        God.foo();
    }

    function bat() public virtual override {
        emit Log("Eva.bat called");
        super.bat();
    }
}


contract person is Adam,Eva{
    //在这个例子中，调用合约people中的super.bar() 会依次调用Eve、Adam，最后是God合约。
    function foo () public override(Adam,Eva) {
        super.foo();
    }

    function bat () public override(Adam,Eva) {
        super.bat();
    }
    //虽然Eve、Adam都是God的子合约，但整个过程中God合约只会被调用一次。原因是Solidity借鉴了Python的方式，强制一个由基类构成的DAG（有向无环图）使其保证一个特定的顺序。更多细节你可以查阅Solidity的官方文档。
}



