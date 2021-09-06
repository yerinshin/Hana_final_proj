(function ($) {
 "use strict";

	/*----------------------------------------*/
	/*  2.  Bar Chart vertical
	/*----------------------------------------*/
	var ctx = document.getElementById("barchart1");
	var barchart1 = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ["기본금", "생활금", "비상금"],
			datasets: [{
                label: '또래 사용자',
				data: [180, 140, 250],
				borderWidth: 1,
                backgroundColor: [
					'rgba(255, 99, 132, 0.4)',
					'rgba(255, 99, 132, 0.4)',
					'rgba(255, 99, 132, 0.4)',
				],
				borderColor: [
					'rgba(255,99,132,1)',
					'rgba(255,99,132,1)',
					'rgba(255,99,132,1)',
					
				],
            }, {
                label: '나',
				data: [150, 160, 200],
                backgroundColor: [
					'rgb(50,205,50, 0.4)',
					'rgb(50,205,50, 0.4)',
					'rgb(50,205,50, 0.4)'
				],
				borderColor: [
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
				],
				borderWidth: 1
            }]
		},
		options: {
			responsive: true,
				scales: {
				yAxes: [{
					ticks: {
						min : 100,
						position: 'top',
						
					}
				}]
			},
		
			title: {
				display: true,
				text: 'Bar Chart Vertical'
			}
		}
	});
	
	
	/*----------------------------------------*/
	/*  2.  Bar Chart vertical
	/*----------------------------------------*/
	var ctx = document.getElementById("barchart2");
	var barchart2 = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ["기본금", "생활금", "비상금"],
			datasets: [{
                label: '또래 사용자',
				data: [180, 140, 250],
				borderWidth: 1,
                backgroundColor: [
					'rgba(255, 99, 132, 0.4)',
					'rgba(255, 99, 132, 0.4)',
					'rgba(255, 99, 132, 0.4)',
				],
				borderColor: [
					'rgba(255,99,132,1)',
					'rgba(255,99,132,1)',
					'rgba(255,99,132,1)',
					
				],
            }, {
                label: '나',
				data: [150, 160, 200],
                backgroundColor: [
					'rgb(50,205,50, 0.4)',
					'rgb(50,205,50, 0.4)',
					'rgb(50,205,50, 0.4)'
				],
				borderColor: [
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
				],
				borderWidth: 1
            }]
		},
		options: {
			responsive: true,
				scales: {
				yAxes: [{
					ticks: {
						min : 100,
						position: 'top',
						
					}
				}]
			},
		
			title: {
				display: true,
				text: 'Bar Chart Vertical'
			}
		}
	});
	
	
	
		
})(jQuery); 