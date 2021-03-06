<?php 

require dirname(__DIR__).'/db/connect.php';
$posID = $_SESSION['pos_id'];
?>
<aside class="aside">
	<!-- START Sidebar (left)-->
	<div class="aside-inner">
		<nav data-sidebar-anyclick-close="" class="sidebar">
			<!-- START sidebar nav-->
			<ul class="nav">
				<!-- START user info-->
				<li class="has-user-block">
					<div id="user-block" class="collapse">
						<div class="item user-block">
							<!-- User picture-->
							<div class="user-block-picture">
								<div class="user-block-status">
									<img src="/assets/img/user/02.jpg" alt="Avatar" width="60" height="60" class="img-thumbnail img-circle">
									<div class="circle circle-success circle-lg"></div>
								</div>
							</div>
							<!-- Name and Job-->
							<div class="user-block-info">
								<span class="user-block-name">Hello, <?php echo $_SESSION['firstname'].' '.$_SESSION['lastname']; ?></span>
								<span class="user-block-role"></span>
							</div>
						</div>
					</div>
				</li>
				<!-- END user info-->
				<!-- Iterates over all sidebar items-->
				<li class="nav-heading ">
					<span data-localize="sidebar.heading.HEADER">Main Navigation</span>
				</li>
				<li class=" ">
					<a href="admin" title="Dashboard">
						<em class="icon-speedometer"></em>
						<span data-localize="sidebar.nav.DASHBOARD">Dashboard</span>
					</a>
				</li>
				<!-- <li class="nav-heading ">
					<span data-localize="sidebar.heading.COMPONENTS">Equipments</span>
				</li>
				<li class=" ">
					<a href="#elements" title="IT Equipments" data-toggle="collapse">
					<em class="icon-chemistry"></em>
					<span data-localize="sidebar.nav.element.ELEMENTS">IT Equipments</span>
					</a>
					<ul id="elements" class="nav sidebar-subnav collapse">
						<li class="sidebar-subnav-header">IT Equipments</li>
						<li class=" ">
							<a href="#" title="List IT Equipments">
							<span data-localize="sidebar.nav.element.BUTTON">List IT Equipments</span>
							</a>
						</li>
						<li class=" ">
							<a href="#" title="Add IT Equipments">
							<span data-localize="sidebar.nav.element.BUTTON">Add IT Equipments</span>
							</a>
						</li>
						<li class=" ">
							<a href="#" title="IT Stock Count">
							<span data-localize="sidebar.nav.element.NOTIFICATION">IT Stock Count</span>
							</a>
						</li>
					</ul>
				</li>
				<li class=" ">
					<a href="#office" title="Office Supplies" data-toggle="collapse">
					<em class="icon-chemistry"></em>
					<span data-localize="sidebar.nav.element.ELEMENTS">Office Supplies</span>
					</a>
					<ul id="office" class="nav sidebar-subnav collapse">
						<li class="sidebar-subnav-header">Office Supplies</li>
						<li class=" ">
							<a href="#" title="List Office Supplies">
							<span data-localize="sidebar.nav.element.BUTTON">List Office Supplies</span>
							</a>
						</li>
						<li class=" ">
							<a href="#" title="Add Office Supplies">
							<span data-localize="sidebar.nav.element.BUTTON">Add Office Supplies</span>
							</a>
						</li>
						<li class=" ">
							<a href="#" title="Office Supply Stock Count">
							<span data-localize="sidebar.nav.element.NOTIFICATION">Office Supply Stock Count</span>
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-heading ">
					<span data-localize="sidebar.heading.MORE">Requests</span>
				</li>
				<li class=" ">
					<a href="#" title="All Requests">
						<em class="icon-doc"></em>
						<span data-localize="sidebar.nav.pages.LOGIN">All Requests</span>
					</a>
				</li>
				<li class=" ">
					<a href="#" title="Approved Requests">
						<em class="icon-doc"></em>
						<span data-localize="sidebar.nav.pages.REGISTER">Approved Requests</span>
					</a>
				</li>
				<li class=" ">
					<a href="#" title="Denied Requests">
						<em class="icon-doc"></em>
						<span data-localize="sidebar.nav.pages.RECOVER">Denied Requests</span>
					</a>
				</li>
				<li class=" ">
					<a href="#" title="Add Request">
						<em class="icon-doc"></em>
						<span data-localize="sidebar.nav.pages.LOCK">Add Request</span>
					</a>
				</li> -->
				<?php 

				if ($posID == 1) {
					
				

				?>

				<li class="nav-heading ">
					<span data-localize="sidebar.heading.People">Manage Account</span>
				</li>
				
				<li class="">
					<a href="#manage_account" title="Users" data-toggle="collapse">
						<em class="icon-people"></em>
						<span data-localize="sidebar.nav.element.ELEMENTS">Users</span>
					</a>
					<ul id="manage_account" class="nav sidebar-subnav collapse">
						<li class="sidebar-subnav-header">Users</li>
						<li class=" ">
							<a href="list_user" title="List Users">
								<span data-localize="sidebar.nav.pages.LOCK">List Users</span>
							</a>
						</li>
						<li class=" ">
							<a href="add_user" title="Add Users">
								<span data-localize="sidebar.nav.pages.LOCK">Add Users</span>
							</a>
						</li>
						<li class=" ">
							<a href="waiting_approval" title="Waiting Approval Users">
								<span data-localize="sidebar.nav.pages.LOCK">Waiting Approval Users</span>
							</a>
						</li>
						<li class=" ">
							<a href="locked_users" title="Locked Users">
								<span data-localize="sidebar.nav.pages.LOCK">Locked Users</span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#department_nav" title="Department" data-toggle="collapse">
						<!-- <em class="icon-organization"></em> -->
						<i class="fa fa-building-o"></i>
						<span data-localize="sidebar.nav.element.ELEMENTS">Department</span>
					</a>
					<ul id="department_nav" class="nav sidebar-subnav collapse">
						<li class=" ">
							<a href="list_department" title="List Department">
								<span data-localize="sidebar.nav.pages.LOCK">List Department</span>
							</a>
						</li>
						<li class=" ">
							<a href="add_department" title="Add Department">
								<span data-localize="sidebar.nav.pages.LOCK">Add Department</span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#position_nav" title="Position" data-toggle="collapse">
						<em class="icon-organization"></em>
						<span data-localize="sidebar.nav.element.ELEMENTS">Position</span>
					</a>
					<ul id="position_nav" class="nav sidebar-subnav collapse">
						<li class=" ">
							<a href="list_position" title="List Position">
								<span data-localize="sidebar.nav.pages.LOCK">List Position</span>
							</a>
						</li>
						<li class=" ">
							<a href="add_position" title="Add Position">
								<span data-localize="sidebar.nav.pages.LOCK">Add Position</span>
							</a>
						</li>
					</ul>
				</li>
				
					



				

				<?php
				}
				?>

				<li class="nav-heading ">
					<span data-localize="sidebar.heading.MORE">Settings</span>
				</li>
				<li class=" ">
					<a href="#" title="View Profile">
						<em class="icon-emotsmile"></em>
						<span data-localize="sidebar.nav.DOCUMENTATION">View Profile</span>
					</a>
				</li>
				<li class=" ">
					<a href="edit_profile" title="Edit Profile">
						<em class="icon-options"></em>
						<span data-localize="sidebar.nav.DOCUMENTATION">Edit Profile</span>
					</a>
				</li>
				<li class="nav-heading ">
					<span data-localize="sidebar.heading.MORE">Reports</span>
				</li>
				<li class=" ">
					<a href="#" title="Overview Chart">
						<em class="fa fa-folder-open-o"></em>
						<span>Overview Chart</span>
					</a>
				</li>
				<li class="">
					<a href="#it_reports" title="IT Equipments Reports" data-toggle="collapse">
						<em class="icon-chemistry"></em>
						<span data-localize="sidebar.nav.element.ELEMENTS">IT Equipment Reports</span>
					</a>
					<ul id="it_reports" class="nav sidebar-subnav collapse">
						<li class="sidebar-subnav-header">IT Equipments Reports</li>
						<li class=" ">
							<a href="#" title="IT Equipment Alerts">
							<span data-localize="sidebar.nav.element.BUTTON">IT Equipment Alerts</span>
							</a>
						</li>
						<li class=" ">
							<a href="#" title="Damage IT Equipment">
							<span data-localize="sidebar.nav.element.BUTTON">Damage IT Equipment</span>
							</a>
						</li>
					</ul>
				</li>
				<li class=" ">
					<a href="#it_reports" title="Office Supply Reports" data-toggle="collapse">
						<em class="icon-chemistry"></em>
						<span data-localize="sidebar.nav.element.ELEMENTS">Office Supply Reports</span>
					</a>
					<ul id="it_reports" class="nav sidebar-subnav collapse">
						<li class="sidebar-subnav-header">Office Supply Reports</li>
						<li class=" ">
							<a href="#" title="Office Supply Alerts">
							<span data-localize="sidebar.nav.element.BUTTON">Office Supply Alerts</span>
							</a>
						</li>
						<li class=" ">
							<a href="#" title="Damage Office Supply">
							<span data-localize="sidebar.nav.element.BUTTON">Damage Office Supply</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>
			<!-- END sidebar nav-->
		</nav>
	</div>
	<!-- END Sidebar (left)-->
</aside>