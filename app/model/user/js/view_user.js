$(document).ready(function() {
	$('.list_user').hide();
	$('.loader_holder').show();
	setTimeout(function() {
		$('.loader_holder').hide();
		$('.list_user').show();
		loadPagination(page = 1, total_data);
	}, 500);
	var total_data = 0;
	var paginate_container = $('.pagination');
	var page_num = 1;
	var pagination_num = 5;
	loadDepartment();
	loadPosition();
	loadStatus();
	loadUser(total_data, page_num);

	$('#per_page').on('change', function() {
		page_num = 1;
		loadUser(total_data, page_num);
		setTimeout(function(){
			loadPagination(page = 1, total_data);
		}, 300);
	});

	$('#department').on('change', function() {
		page_num = 1;
		loadUser(total_data, page_num);
		setTimeout(function(){
			loadPagination(page = 1, total_data);
		}, 300);
	});

	$('#position').on('change', function() {
		page_num = 1;
		loadUser(total_data, page_num);
		setTimeout(function(){
			loadPagination(page = 1, total_data);
		}, 300);
	});

	$('#status').on('change', function() {
		page_num = 1;
		loadUser(total_data, page_num);
		setTimeout(function(){
			loadPagination(page = 1, total_data);
		}, 300);
	});

	$('#search').keyup(function() {
		page_num = 1;
		loadUser(total_data, page_num);
		setTimeout(function(){
			loadPagination(page = 1, total_data);
		}, 300);
	});

	$('body').delegate('.status', 'click', function() {
		var element = this;
		var status = $(this).prop('checked');
		var userID = $(this).parents('tr').attr('data-id');
		var firstname = $(this).parents('tr').find('td:first-child').text();
		var lastname = $(this).parents('tr').find('td:nth-child(2)').text();
		var name = firstname + ' ' + lastname;
		var waiting = 0;
		var unlocked = 0;
		$.ajax({
			type: 'POST',
			url: '/app/model/user/php/update_status.php',
			data: {'userID' : userID, 'status' : status, 'waiting' : waiting, 'unlocked' : unlocked},
			success: function(data) {
				if (data.statusID == 1) {
					$(element).parent('label').attr('title', 'Active');
					swal("Success!", "The account of " + "<strong>" + name + "</strong>" + " has been activated!", "success");
				} else {
					$(element).parent('label').attr('title', 'Inactive');
					swal("Deactivated!", "You have deactivated the account of " + name + ".", "info");					
				}
			}
		});
	});

	$('body').delegate('.pagination li a', 'click', function(e) {
		e.preventDefault();
		if (!$(this).parent('li').hasClass('next') && !$(this).parent('li').hasClass('previous') && !$(this).parent('li').hasClass('active')) {
			// $(this).parent().parent().children('li.num').remove();
			var page_num = $(this).text()
			loadUser(total_data, page_num);
			loadPagination(page_num, total_data);
			// alert(page_num);
		} else if ($(this).parent('li').hasClass('next')) {
			page_num = parseInt($('.pagination li.active').text()) + 1;
			// $(this).parent().parent().children('li.num').remove();
			loadUser(total_data, page_num);
			loadPagination(page_num, total_data);
		} else if ($(this).parent('li').hasClass('previous')) {
			page_num = parseInt($('.pagination li.active').text()) - 1;
			// $(this).parent().parent().children('li.num').remove();
			loadUser(total_data, page_num);
			loadPagination(page_num, total_data);
			// alert(page_num);
		}
	});

	function loadDepartment() {
		$.ajax({
			type: 'POST',
			url: '/app/model/user/php/department.php',
			success: function(data) {
				var result = data.result;
				if (data.success == 1) {
					$.each(result, function(key, val) {
						var dep = val.split('#');
						$('#department').append($('<option></option>').attr('value', dep[0]).text(dep[1]));
					});
				}
			}
		});
	}

	function loadPosition() {
		$.ajax({
			type: 'POST',
			url: '/app/model/user/php/position.php',
			success: function(data) {
				var result = data.result;
				if (data.success == 1) {
					$.each(result, function(key, val) {
						var pos = val.split('#');
						$('#position').append($('<option></option>').attr('value', pos[0]).text(pos[1]));
					});

				}
			}
		});
	}

	function loadStatus() {
		$.ajax({
			type: 'POST',
			url: '/app/model/user/php/status.php',
			success: function(data) {
				var result = data.result;
				if (data.success == 1) {
					$.each(result, function(key, val) {
						var status = val.split('#');
						$('#status').append($('<option></option>').attr('value', status[0]).text(status[1]));
					});
				}
			}
		});
	}

	function loadUser(total_data, page_num) {
		var depID = $('#department').val();
		var posID = $('#position').val();
		var statID = $('#status').val();
		var search = $('#search').val();
		var per_page = $('#per_page').val();

		$.ajax({
			type: 'POST',
			url: '/app/model/user/php/load_user.php',
			data: { 'depID': depID, 'posID': posID, 'statID': statID, 'search': search, 'per_page': per_page, 'page_num' : page_num},
			beforeSend: function () {
				// $('.input').attr('disabled', true);
			},
			complete: function() {
				// $('.input').attr('disabled', false);
			},
			success: function(data) {
				var result = data.result;
				var show_result = per_page * page_num - per_page + result.length;
				if (data.success == 1) {
					$('#paginate').show();
					var tbl_row;
					$.each(result, function(key, val) {
						var user = val.split('#');
						tbl_row += '<tr data-id=' + user[0] + '><td>' + user[1] + '</td><td>' + user[2] + '</td><td>' + user[4] + '</td><td>' + user[3] + '</td><td>' + user[5] + '</td><td>' + user[6] + '</td>';
						if (user[7] == 'active') {
							tbl_row += '<td><label class="switch switch-sm" title="Active"><input type="checkbox" class="status" checked><span></span></label></td>';
						} else {
							tbl_row += '<td><label class="switch switch-sm" title="Inactive"><input type="checkbox" class="status"><span></span></label></td>';
						}
					});
					$('.list_user tbody').html(tbl_row);
					$('.num_result').attr('colspan', 4).removeClass('text-center').html('Showing <strong>' + show_result + ' of <strong>' + data.total_users + '</strong>');
					$('#paginate').show();
				} else {
					var num_row = '<strong>' + data.result + '</strong>';
					$('.list_user tbody').html('');
					$('.num_result').attr('colspan', 7).addClass('text-center').html(num_row);
					$('#paginate').hide();
				}
				total_data = parseInt(data.total_users);
				totalData(total_data);
				// alert(total_data);
			}
		});
	}

	function totalData(total) {
		total_data = total;
	}
	
	


	function loadPagination(page = 1, total_data) {
		$('.pagination li.num').remove();
		if (total_data != 0) {
			var insertPagination = '';
			var per_page = $('#per_page').val();
			// alert(total_data);
			var counter = Math.ceil(total_data / per_page );
			if (counter > 1 ) {
				$('.next').show();
			}
			var active;
			if (page <= (Math.ceil(pagination_num/2))) {

				start_page = 1;
				
				if (page == 1) {
					$('.previous').hide();
				} else {
					$('.previous').show();
				}
				if (counter == page) {
					$('.next').hide();
				} else{
					$('.next').show();
				}
			} else if ((counter - parseInt(pagination_num/2)) <= page ) {
				if (counter<=pagination_num) {
					start_page = 1;
				} else {
					if (pagination_num % 2 === 0) {
						start_page = (counter - parseInt(pagination_num/2)) - parseInt(pagination_num/2) + 1;
					} else {
						start_page = (counter - parseInt(pagination_num/2)) - parseInt(pagination_num/2);
					}
				}
				
				if (counter == page) {
					$('.next').hide();
				} else {
					$('.next').show();
				}
			} else {
				if (counter<=pagination_num) {
					start_page = 1;
				} else {
					start_page = page - parseInt(pagination_num/2);
				}
				$('.previous').show();
				$('.next').show();
			}
			
			for (i = start_page, a=1; i <= counter; i++,a++) {
				if (i == page) {
					active = ' class="active num"';
				} else {
					active = ' class="num"';
				}
				insertPagination += '<li' + active + '><a href="#">' + i + '</a></li>';

				
				if (a == pagination_num) {
					break;
				}
			}
			$('#paginate li:first-child').after(insertPagination);
		}
	}

});