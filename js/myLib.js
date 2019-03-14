/**
 * Created by Administrator on 2018/1/12.
 */
if (typeof jQuery!=='function'){
    throw new Error('此插件依赖于jQuery')
}else{
    $.fn.sum = function () {
        var a=0;
        $(this).each((idx,obj)=>{
            a+=Number($(obj).html())
        })
        return a;
    }
    jQuery.fn.extend({
        a1:function () {
            console.log('扩展a1方法\n被调用');
            document.write('扩展a1方法被调用； <br/>')
        },
        a2:function () {
            console.log('扩展a2方法\n被调用')
            document.write('扩展a2方法被调用； ')
        }
    })
}