var a:string='lilei';
var b:number=123;
function fun (x:string) :string{
    return x
}
function fun2() :void{
    //void不能有返回值
}
class Person{
    name:string
    age:number
}
var zhangsan:Person=new Person
zhangsan.name='zs'
zhangsan.age=18
function sett(aa:string,bb?:number,cc:string='tom'){
    console.log(aa,bb,cc);
    
}