//[widget morris charts Javascript]

//Project:	Crypto Admin - Responsive Admin Template
//Primary use:   Used only for the morris charts


$(function () {
    "use strict";


// LINE CHART
        var line = new Morris.Line({
          element: 'line-chart',
          resize: true,
          data: [
            {y: '2016 Q1', data1: 2566},
            {y: '2016 Q2', data1: 2678},
            {y: '2016 Q3', data1: 4812},
            {y: '2016 Q4', data1: 3867},
            {y: '2017 Q1', data1: 6910},
            {y: '2017 Q2', data1: 5770},
            {y: '2017 Q3', data1: 4920},
            {y: '2017 Q4', data1: 15173},
            {y: '2018 Q1', data1: 11687},
            {y: '2018 Q2', data1: 8632},
			{y: '2019 Q1', data2: 2566},
            {y: '2020 Q2', data2: 2678},
            {y: '2021 Q3', data2: 4812},
            {y: '2022 Q4', data2: 3867},
            {y: '2023 Q1', data2: 6910},
            {y: '2024 Q2', data2: 5770},
            {y: '2025 Q3', data2: 4920},
            {y: '2026 Q4', data2: 15173},
            {y: '2027 Q1', data2: 11687},
            {y: '2028 Q2', data2: 8632}
          ],
          xkey: 'y',
          ykeys: ['data1' , 'data2'],
          labels: ['실제 값' , '예측 값'],
          gridLineColor: '#eef0f2', 
          lineColors: ['#3e8ef7' , '#ffa800'],
          lineWidth: 1,
          hideHover: 'auto'
        });
 // donut chart
 
	
  });