function initImageUpload(container){
    if (container.length<=0) return;
    container.each(function(i) {
        var $this = $(this).html('');
        var option = filtrationData($(this).data().option);
       

        var plusImage = option.plusimage || '../images/pluspic_0.png';

        var style = $this.attr('style');
        /*设置上传文件的服务器地址*/
        option.url=urlConfig.base.ApiRoot+'/fileupload/'+ option.key;
        var userInfo    = ApiCaller.getUser();
        var ctrlid =  $(this).attr("id");
        if ($.isNullOrEmpty(ctrlid)) ctrlid = Math.ceil(Math.random() * 1000000);
        
        if (userInfo!=null){
            var queryParam  = [];
            Object.keys(userInfo).forEach(function(item){
                queryParam.push(item+'='+userInfo[item]);
            })
            if (queryParam.length>0)
                option.url = option.url+'?'+queryParam.join('&');
        }
        if (option.multiUpload==null) option.multiUpload=false;
        option.imageBase = option.imageBase || urlConfig.base.imageBase;
        option.type = option.type || 'image';
        // console.log(option);
        // debugger;
        var imageSection = !$.isNullOrEmpty(option.default)?(' src="'+option.imageBase+option.default+'"'):'';
        var contentSection =!$.isNullOrEmpty(option.default)?(' value="'+option.default+'"'):'';

        var imageScript = '<img class="image_upload_file" id="image_'+ctrlid+'" '+imageSection+'/>';
        if (option.type=='video')  imageScript = '<video class="image_upload_file" controls id="image_'+ctrlid+'" '+imageSection+'/>';
        if (option.type=='audio')  imageScript = '<audio class="image_upload_file" controls id="image_'+ctrlid+'" '+imageSection+'/>';
            var html = 
            // '<input class="image_uploader uploadInstance" type="file" ' + (option.multiUpload ? "multiple" : "") + ' accept="image/*"/>'+
            '<div class="image_upload_box" style="background-image: url(' + plusImage + ')">' +
                '<div class="image_upload_img">' +
                    //'<img class="image_upload_file" id="image_'+ctrlid+'" '+imageSection+'/>' +
                    imageScript+
                    (!$.isNullOrEmpty(option.name)?
                    ('<input class="image_upload_content" id="hid_'+ctrlid+'" '+contentSection+' type="hidden" name="'+option.name+'" />'):'')+
                '</div>' +
                '<img class="image_upload_del" src="../images/del.png"/>' +
            '</div>';
        $this.html(html);
        var $imageUploadImg = $this.find('.image_upload_img'); // 图片容器
        var $imageUploader = $('.image_uploader'); // 真实的上传控件
        $imageUploader.click(function() {
            event.stopPropagation(); // 停止冒泡
        })
        var $imageUploadDel = $this.find('.image_upload_del'); // 删除按钮
        var $imageUploadFile = $this.find('.image_upload_file'); // 上传的图片
        var $imageContent = $this.find('.image_upload_content'); // 图片的字符串

        if (!$.isNullOrEmpty(option.default)) $imageUploadImg.css('display', 'flex');
        // var styleIndex = style.indexOf('border-radius');
        $this.css('borderRadius', 0)
        // if (styleIndex !== -1) {
        //     console.log(style.slice(styleIndex))
        //     // imageUploadImg.css()
        // }
        $imageUploadDel.click(function() {
            $imageUploadImg.css('display', 'none');
            $imageContent.val('');
            dataForm.callFunc(option.removeFunc,{id:option.id})
            event.stopPropagation(); // 停止冒泡
        });
        $this.find('.image_upload_box').click(function() {
            if (option.multiUpload)  
                $imageUploader.attr("multiple","multiple")
            else
                $imageUploader.removeAttr("multiple");
            $imageUploader.click();
            doUpload($imageUploader,$imageUploadFile,$imageContent,option,$imageUploadImg);
            // event.stopPropagation(); // 停止冒泡
        })
        $this[0].setImage = function(imagePath) {

            if ($.isNullOrEmpty(imagePath)) return;
            $imageUploadImg.css('display', 'flex');
            if ($.startWith(imagePath,'http'))
                $imageUploadFile.attr('src',imagePath);
            else
                $imageUploadFile.attr('src',option.imageBase+imagePath);
            if ($imageContent)    $imageContent.val(imagePath);
        }
        ///获取图片的路径
        $this[0].getImage = function() {
            
            return $imageContent.val();
        }
    })
    

    /*
    * 执行上传的操作
    */
    function doUpload(fileItem,imageItem,contentItem,option,imageUploadImg){
        fileItem.fileupload({
            url: option.url,
            dataType: 'json',
            formData:option.data,
            done: function (e, data) {
                console.log(data)
                var retValue = data.result[0];
                ///文件上传失败
                if (!retValue || retValue.result!=0) return dataForm.callFunc(option.failFunc,retValue);
                if (contentItem.length>0){
                    if (!option.multiUpload)
                        contentItem.val(retValue.path);
                    else{
                        var fileValue  = contentItem.val() + ','+retValue.path;
                        if ($.startWith(fileValue,','))
                            contentItem.val(fileValue.substr(1));
                        else
                            contentItem.val(fileValue);
                    }
                }
                if(imageItem){
                    imageUploadImg.css('display', 'flex');
                    imageItem.attr('src',option.imageBase + retValue.path);
                }

                dataForm.callFunc(option.successFunc, {...retValue,id:option.id})
            },
            progressall: option.progressFunc
        });
    }
    // 过滤option数据
    function filtrationData(option) {
        if ($.isNullOrEmpty(option)) return {};
        return eval('({' + option + '})');
        //return JSON.parse('{'+option+'}');
    }
}



$(document).ready(function () {
    //var fileExist = $('.uploadInstance').length>0;
    var uploadContainer = '<input class="image_uploader uploadInstance" style="display:none" type="file"  accept="image/*,video/*,audio/*"/>';
    $(uploadContainer).appendTo($('body'));
    /* 图片上传组件 */
    initImageUpload($('imageUpload'));
});