exports = module.exports = {
    appid: 'wxef31174b9f28d7d3',
    apiBaseUrl: 'https://red.doomisoft.com/',
    // apiBaseUrl: 'http://192.168.10.216:3000/',
    imageBaseUrl: 'https://storage-1257410363.file.myqcloud.com/',
    pageSize: 20,
    navbarHeight: 46,
    ///队列中采集了多少的formid后，自动发送给服务器端
    maxformidcount:5,
    wxSetting: {
        userLocation: {
            type: 'scope.userLocation',
            name: '地理位置'
        },
        address: {
            type: 'scope.address',
            name: '通讯地址'
        },
        writePhotosAlbum: {
            type: 'scope.writePhotosAlbum',
            name: '保存到相册'
        },
        camera: {
            type: 'scope.camera',
            name: '摄像头'
        },
        record: {
            type: 'scope.record',
            name: '录音功能'
        },
        werun: {
            type: 'scope.werun',
            name: '微信运动步数'
        },
        invoiceTitle: {
            type: 'scope.invoiceTitle',
            name: '发票抬头'
        },
        invoice: {
            type: 'scope.invoice',
            name: '获取发票'
        }
    }
}