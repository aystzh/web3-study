// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract InsertSort {

    function ifElseTest(uint256 _number) public  pure returns(bool) {
        if(_number > 0){
            return true;
        }else{
            return false;
        }
    }

   uint constant CONSTANT_UINT = 2;

    //for循环
   function forTest() public pure   returns (uint){
        uint sum =0;
        for (uint i=0;i<CONSTANT_UINT;i++){
            sum +=i;
        }
        return 1;
    }

    //while循环
    function whileTest() public pure returns(uint256){
        uint i =1;
        uint sum=0;
        while(sum<100){
            sum +=i;
            i++;
        }
        return sum;
    }

    //doWhile循环
    function doWhileTest() public pure returns(uint256){
        uint i =0;
        uint sum = 0;
        do {
            sum +=i;
            i++;
        }while(i<10);
        return sum;
    }

    //三元运算符
    function ternaryTest(uint256 x,uint256 y) public pure returns(uint256){
        return x>y?x:y;
    }

    //错误的插入排序
    function insertWrong(uint [] memory a) public pure returns(uint [] memory){
        for(uint i=1;i<a.length;i++){
            uint temp = a[i];
            uint j = i-1;
            while ((j>=0) && (temp<a[j])){
                a[j+1] =a[j];
                j--;
            }
            a[j+1] =temp;
        }
        return a;
    }

    //Solidity中最常用的变量类型是uint，也就是正整数，
    //取到负值的话，会报underflow错误。而在插入算法中，变量j有可能会取到-1，引起报错。这里，我们需要把j加1，让它无法取到负值
    function insertSort(uint [] memory a) public pure returns(uint [] memory){
        for(uint i=1;i<a.length;i++){
              uint temp = a[i];
              uint j=i;
              while ((j>=1)&&temp<a[j-1]){
                a[j] = a[j-1];
                 j--;
              }
              a[j] = temp;
        }
        return a;
    }
}
