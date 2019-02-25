var charts = {
  // 绘制柱状图+线条
  renderCombinationForBarWithLine: function (elName, data) {
    var trainChart = echarts.init(document.getElementById(elName));
    var legend = [];

    for (var i=0; i<data.series.length; i++) {
      legend.push(data.series[i].name)
    }

    var option = {
      title: {
        text: data.title,
        textStyle: {
          align: 'center'
        }
      },
      color: data.colors,
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
      grid: {
        right: '20%'
      },
      dataZoom: [
        {
          show: true,
          realtime: true,
          endValue: 6
        },
        {
          type: 'inside',
          realtime: true
        }
      ],
      toolbox: {
        feature: {
          dataView: { show: true, readOnly: false },
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      legend: {
        data: legend
      },
      xAxis: [
        {
          type: 'category',
          axisTick: {
            alignWithLabel: true
          },
          data: data.categories
        }
      ],
      yAxis: data.yAxis,
      series: data.series
    };

    // 使用刚指定的配置项和数据显示图表。
    trainChart.setOption(option);

    console.log(data)
  },
  // 绘制柱状图
  renderBarChart: function (elName, data) {
    var trainChart = echarts.init(document.getElementById(elName));
    var series = data.series;
    var option = {
      //title:data.title?data.title:null,
      //color: data.colors,
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
      legend:data.legend?data.legend:null,
      toolbox: {
        feature: {
          dataView: { show: true, readOnly: false },
          magicType : {show: true, type: ['line', 'bar']},
          restore: { show: true },
          saveAsImage: { show: true }
        }
      },
      // dataZoom: [
      //   {
      //     show: true,
      //     realtime: true,
      //     endValue: 6
      //   },
      //   {
      //     type: 'inside',
      //     realtime: true
      //   }
      // ],
      xAxis: data.xAxis,
      yAxis: data.yAxis,
      series
    };

    // 使用刚指定的配置项和数据显示图表。
    trainChart.setOption(option);

    console.log(JSON.stringify(data))
  },
  renderSingleBarChart: function (elName, data) {
    var trainChart = echarts.init(document.getElementById(elName));
    var series = data.series;
    // var legend = [];
   
    // for (var i=0; i<data.series.length; i++) {
    //   series.push({
    //     data: data.series[i].data,
    //     name: data.series[i].name,
    //     type: data.series[i].type
    //   })
    //   legend.push(data.series[i].name)
    // }

    var option = {
      // title: {
      //   text: data.title
      // },
      // color: data.colors,
      // tooltip: {
      //   trigger: 'axis',
      //   axisPointer: {
      //     type: 'shadow'
      //   }
      // },
      // toolbox: {
      //   feature: {
      //     dataView: { show: true, readOnly: false },
      //     restore: { show: true },
      //     saveAsImage: { show: true }
      //   }
      // },
      // legend: {
      //   data: legend
      // },
      // dataZoom: [
      //   {
      //     show: true,
      //     realtime: true,
      //     endValue: 6
      //   },
      //   {
      //     type: 'inside',
      //     realtime: true
      //   }
      // ],
       xAxis: data.xAxis,
       //[
      //   {
      //     type: 'category',
      //     axisLabel: {
      //       rotate: 10,
      //       fontSize: 10
      //     },
      //     axisTick: {
      //       alignWithLabel: true
      //     },
      //     data: data.categories
      //   }
      // ],
      yAxis: data.yAxis,
      series
    };
    // 使用刚指定的配置项和数据显示图表。
    trainChart.setOption(option);
    //console.log(JSON.stringify(data))
  },
}