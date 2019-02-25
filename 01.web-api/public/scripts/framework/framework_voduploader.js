function voduploader(option) {
	var _this = this;
	if (option.type==null) option.type="video";
    var _option  = option;
    var lastSearchParam = {};
    ///获取上传的签名
    this.getSignature = function(callback){
		ApiCaller.Post({url:_option.signatureUrl,successFunc:function(result){
			callback(result.signature);
		}})
	};
    var init= function(){
		var bindCtrl = $('#'+option.uploadControl);
        var ctrlType = bindCtrl[0].hasOwnProperty("type")?bindCtrl[0].type:'';
        //if ($.isNullOrEmpty(bindCtrl[0].type) || bindCtrl[0].type!='file') {
        if (ctrlType!='file'){
			 _this.uploaderID = option.uploadControl+'_'+Math.ceil(Math.random() * 1000000);
            bindCtrl.parent().append('<div style="display:none"><input type="file" name="'+_this.uploaderID
									   +'" id="'+_this.uploaderID+'" '+(option.multiUpload?"multiple":"")+'/></div>')
			///添加一个进度窗口
			if (_option.uploadWindow && _option.uploadWindow.Id && _option.uploadWindow.progressBar) {
				_this.progressWindow = $('#'+_option.uploadWindow.Id);	
				_this.progressBar = $('#'+_option.uploadWindow.progressBar);
				_this.progressWindow.window('close');
			}
			////定义上传的函数
			$('#'+ _this.uploaderID).on('change', function (e) {
				//var num = addUploaderMsgBox('hasVideo');
				var upfile = this.files[0];
				var param ={
						getSignature: _this.getSignature,
						success: function(result){
							if(result.type == 'video') {
								$.messager.alert('info','文件上传成功','');
								if(_option.transferCode===true){
									///启动视频转码
								}
								//$('[name=videoresult'+num+']').text('上传成功');
								//$('[name=cancel'+num+']').remove();
								//cosBox[num] = null;
							} else if (result.type == 'cover') {
								//$('[name=coverresult'+num+']').text('上传成功');
								$.messager.alert('info','文件上传成功','');
							}
						},
						error: function(result){
							if (_this.progressWindow) _this.progressWindow.window('close');
							if(result.type == 'video') {
								$.messager.alert('info','文件上传失败!','error');
								//$('[name=videoresult'+num+']').text('上传失败>>'+result.msg);
							} else if (result.type == 'cover') {
								$.messager.alert('info','封面上传失败!','error');
								//$('[name=coverresult'+num+']').text('上传失败>>'+result.msg);
							}
						},
						progress: function(result){
							if(result.type == 'video') {
								//$('[name=videoname'+num+']').text(result.name);
								//$('[name=videosha'+num+']').text(Math.floor(result.shacurr*100)+'%');  sha进度
								//$('[name=videocurr'+num+']').text(Math.floor(result.curr*100)+'%');
								if (_this.progressWindow){
									//$('#'+_option.progressbar).progressbar('setValue',result.curr*100);
									_this.progressBar.progressbar('setValue',Math.floor(result.curr*100));
								}
								//$('[name=cancel'+num+']').attr('taskId', result.taskId);
								//cosBox[num] = result.cos;
							} else if (result.type == 'cover') {
								//$('[name=covername'+num+']').text(result.name);
								//$('[name=coversha'+num+']').text(Math.floor(result.shacurr*100)+'%');
								//$('[name=covercurr'+num+']').text(Math.floor(result.curr*100)+'%');
							}
							
						},
						finish: function(result){
							if (_this.progressWindow) _this.progressWindow.window('close');
							if (_option.uploadFinished!=null && typeof(_option.uploadFinished)=='function')
							{
								///替换掉腾讯云输入的域名
								result.videoUrl = result.videoUrl.replaceAll(urlConfig.base.replaceVideoDomain,'');
								//alert(result.videoUrl );
								_option.uploadFinished(result);
							}
								
							// $('[name=videofileId'+num+']').text(result.fileId);
							// $('[name=videourl'+num+']').text(result.videoUrl);
							// if(result.message) {
							// 	$('[name=videofileId'+num+']').text(result.message);
							// }
						}
					};
				///上传视频文件
				if (_option.type.toLowerCase()==="video"){
					param.videoFile 	= upfile;
					param.allowAudio	= 1;
				}
				else if (_option.type.toLowerCase()==="cover"){
					if (_option.getFileId!=null && typeof(_option.getFileId)=="function"){
						param.fileId		= _option.getFileId();
					}
					if ($.isNullOrEmpty(param.fileId)){
						$.messager.alert('提示','请先上传视频文件后，再添加视频封面！')
						return;
					}
					param.coverFile 	= upfile;
				}
				if (_this.progressWindow){
					_this.progressBar.progressbar('setValue',0);
					_this.progressWindow.window('open');
				}
				var resultMsg = qcVideo.ugcUploader.start(param);
				// if(resultMsg){
				// 	$('[name=box'+num+']').text(resultMsg);
				// }
				//$('#form1')[0].reset();
			});
            bindCtrl.bind('click', function () {$('#'+ _this.uploaderID).click() });
        }
    }
    init();
}
/*
var index = 0;
	var cosBox = [];
	// 计算签名
	var addUploaderMsgBox = function(type){
		var html = '<div class="uploaderMsgBox" name="box'+index+'">';
		if(!type || type == 'hasVideo') {
			html += '视频名称：<span name="videoname'+index+'"></span>；' + 
				'计算sha进度：<span name="videosha'+index+'">0%</span>；' + 
				'上传进度：<span name="videocurr'+index+'">0%</span>；' + 
				'fileId：<span name="videofileId'+index+'">   </span>；' + 
				'上传结果：<span name="videoresult'+index+'">   </span>；<br>' + 
				'地址：<span name="videourl'+index+'">   </span>；'+
				'<a href="javascript:void(0);" name="cancel'+index+'" cosnum='+index+' act="cancel-upload">取消上传</a><br>';
		}
		
		if(!type || type == 'hasCover') {
			html += '封面名称：<span name="covername'+index+'"></span>；' + 
			'计算sha进度：<span name="coversha'+index+'">0%</span>；' + 
			'上传进度：<span name="covercurr'+index+'">0%</span>；' + 
			'上传结果：<span name="coverresult'+index+'">   </span>；<br>' + 
			'地址：<span name="coverurl'+index+'">   </span>；<br>' + 
			'</div>'
		}
		html += '</div>';
		
		$('#resultBox').append(html);
		return index++;
	};

	
	// * 示例1：直接上传视频
	
	$('#uploadVideoNow-file').on('change', function (e) {
		var num = addUploaderMsgBox('hasVideo');
		var videoFile = this.files[0];
		$('#result').append(videoFile.name +　'\n');
		var resultMsg = qcVideo.ugcUploader.start({
		videoFile: videoFile,
		getSignature: getSignature,
		allowAudio: 1,
		success: function(result){
			if(result.type == 'video') {
				$('[name=videoresult'+num+']').text('上传成功');
				$('[name=cancel'+num+']').remove();
				cosBox[num] = null;
			} else if (result.type == 'cover') {
				$('[name=coverresult'+num+']').text('上传成功');
			}
		},
		error: function(result){
			if(result.type == 'video') {
				$('[name=videoresult'+num+']').text('上传失败>>'+result.msg);
			} else if (result.type == 'cover') {
				$('[name=coverresult'+num+']').text('上传失败>>'+result.msg);
			}
		},
		progress: function(result){
			if(result.type == 'video') {
				$('[name=videoname'+num+']').text(result.name);
				$('[name=videosha'+num+']').text(Math.floor(result.shacurr*100)+'%');
				$('[name=videocurr'+num+']').text(Math.floor(result.curr*100)+'%');
				$('[name=cancel'+num+']').attr('taskId', result.taskId);
				cosBox[num] = result.cos;
			} else if (result.type == 'cover') {
				$('[name=covername'+num+']').text(result.name);
				$('[name=coversha'+num+']').text(Math.floor(result.shacurr*100)+'%');
				$('[name=covercurr'+num+']').text(Math.floor(result.curr*100)+'%');
			}
			
		},
		finish: function(result){
			$('[name=videofileId'+num+']').text(result.fileId);
			$('[name=videourl'+num+']').text(result.videoUrl);
			if(result.message) {
				$('[name=videofileId'+num+']').text(result.message);
			}
		}
		});
		if(resultMsg){
			$('[name=box'+num+']').text(resultMsg);
		}
		$('#form1')[0].reset();
	});
	$('#uploadVideoNow').on('click', function () {
		$('#uploadVideoNow-file').click();
	});
	
	 //取消上传绑定事件，示例一与示例二通用
	 
	$('#resultBox').on('click', '[act=cancel-upload]', function() {
		var cancelresult = qcVideo.ugcUploader.cancel({
			cos: cosBox[$(this).attr('cosnum')],
			taskId: $(this).attr('taskId')
		});
		console.log(cancelresult);
	});


	
	// * 示例2：上传视频+封面
	var videoFileList = [];
	var coverFileList = [];
	// 给addVideo添加监听事件
	$('#addVideo-file').on('change', function (e) {
		var videoFile = this.files[0];
		videoFileList[0] = videoFile;
		$('#result').append(videoFile.name +　'\n');

	});
	$('#addVideo').on('click', function () {
		$('#addVideo-file').click();
	});
	// 给addCover添加监听事件
	$('#addCover-file').on('change', function (e) {
		var coverFile = this.files[0];
		coverFileList[0] = coverFile;
		$('#result').append(coverFile.name +　'\n');

	});
	$('#addCover').on('click', function () {
		$('#addCover-file').click();
	});

	var startUploader = function(){
		if(videoFileList.length){
			var num = addUploaderMsgBox();
			if(!coverFileList[0]){
				$('[name=covername'+num+']').text('没有上传封面');
			}
			var resultMsg = qcVideo.ugcUploader.start({
				videoFile: videoFileList[0],
				coverFile: coverFileList[0],
				getSignature: getSignature,
				allowAudio: 1,
				success: function(result){
					if(result.type == 'video') {
						$('[name=videoresult'+num+']').text('上传成功');
						$('[name=cancel'+num+']').remove();
						cosBox[num] = null;
					} else if (result.type == 'cover') {
						$('[name=coverresult'+num+']').text('上传成功');
					}
				},
				error: function(result){
					if(result.type == 'video') {
						$('[name=videoresult'+num+']').text('上传失败>>'+result.msg);
					} else if (result.type == 'cover') {
						$('[name=coverresult'+num+']').text('上传失败>>'+result.msg);
					}
				},
				progress: function(result){
					if(result.type == 'video') {
						$('[name=videoname'+num+']').text(result.name);
						$('[name=videosha'+num+']').text(Math.floor(result.shacurr*100)+'%');
						$('[name=videocurr'+num+']').text(Math.floor(result.curr*100)+'%');
						$('[name=cancel'+num+']').attr('taskId', result.taskId);
						cosBox[num] = result.cos;
					} else if (result.type == 'cover') {
						$('[name=covername'+num+']').text(result.name);
						$('[name=coversha'+num+']').text(Math.floor(result.shacurr*100)+'%');
						$('[name=covercurr'+num+']').text(Math.floor(result.curr*100)+'%');
					}
				},
				finish: function(result){
					$('[name=videofileId'+num+']').text(result.fileId);
					$('[name=videourl'+num+']').text(result.videoUrl);
					if(result.coverUrl) {
						$('[name=coverurl'+num+']').text(result.coverUrl);
					}
					if(result.message) {
						$('[name=videofileId'+num+']').text(result.message);
					}
				}
			});
			if(resultMsg){
				$('[name=box'+num+']').text(resultMsg);
			}
		} else {
			$('#result').append('请添加视频！\n');
		}
		
	}

	// 上传按钮点击事件
	$('#uploadFile').on('click', function () {
		var secretId = $('#secretId').val();
		var secretKey = $('#secretKey').val();
		startUploader();
		$('#form2')[0].reset();
	});

 
	// * 示例3：直修改封面
	$('#changeCover-file').on('change', function (e) {
		var num = addUploaderMsgBox('hasCover');
		var changeCoverFile = this.files[0];
		var fileId = $('[name=fileId]').val();
		var resultMsg = qcVideo.ugcUploader.start({
		fileId: fileId,
		coverFile: changeCoverFile,
		getSignature: getSignature,
		success: function(result){
			if(result.type == 'video') {
				$('[name=videoresult'+num+']').text('上传成功');
			} else if (result.type == 'cover') {
				$('[name=coverresult'+num+']').text('上传成功');
			}
		},
		error: function(result){
			if(result.type == 'video') {
				$('[name=videoresult'+num+']').text('上传失败>>'+result.msg);
			} else if (result.type == 'cover') {
				$('[name=coverresult'+num+']').text('上传失败>>'+result.msg);
			}
		},
		progress: function(result){
			if(result.type == 'video') {
				$('[name=videoname'+num+']').text(result.name);
				$('[name=videosha'+num+']').text(Math.floor(result.shacurr*100)+'%');
				$('[name=videocurr'+num+']').text(Math.floor(result.curr*100)+'%');
			} else if (result.type == 'cover') {
				$('[name=covername'+num+']').text(result.name);
				$('[name=coversha'+num+']').text(Math.floor(result.shacurr*100)+'%');
				$('[name=covercurr'+num+']').text(Math.floor(result.curr*100)+'%');
			}
			
		},
		finish: function(result){
			$('[name=coverurl'+num+']').text(result.coverUrl);
			if(result.message) {
				$('[name=coverurl'+num+']').text(result.message);
			}
		}
		});
		if(resultMsg){
			$('[name=box'+num+']').text(resultMsg);
		}
		$('#form1')[0].reset();
	});
	$('#changeCover').on('click', function () {
		$('#changeCover-file').click();
	});
*/