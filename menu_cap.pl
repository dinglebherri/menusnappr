#!/usr/bin/perl

# 2018 by Ari Feldman

# setup
$| = 1;

# Eliminate persistence errors witnessed on some machines
my $fixer = `read NSGlobalDomain`;
	if ($fixer =~ m/ApplePersistence/) {
		my $fixer = `defaults delete NSGlobalDomain ApplePersistence`;
	}

my $version_num = "1.5";

&init;

# text string loader
$resource_file = "en_resource.def";
open my $handle, '<',$resource_file or die "$menu[42]' $!";
chomp(my @menu = <$handle>);
close $handle;

# Build dynamic menu 
# Full capture with or without timer
if ($cap_delay == 0) {
	
	if ($cap_dark_mode == 0){
		print "MENUITEMICON|full_screen_icon.png|$menu[0]\n";
	} else {
		print "MENUITEMICON|inv_full_screen_icon.png|$menu[0]\n";
	}
	
} elsif ($cap_delay == 1) {
	
	if ($cap_dark_mode == 0) {
		
		if ($cap_timer == 3 ) {
			print "MENUITEMICON|timer_icon.png|$menu[23]\n";
		} elsif ($cap_timer == 5) {
			print "MENUITEMICON|timer_icon.png|$menu[24]\n";
		}
		
	} else {
		
		if ($cap_timer == 3 ) {
			print "MENUITEMICON|inv_timer_icon.png|$menu[23]\n";
		} elsif ($cap_timer == 5) {
			print "MENUITEMICON|inv_timer_icon.png|$menu[24]\n";
		}
	}
}

# Other capture options
if ($cap_dark_mode == 0) {
	print "MENUITEMICON|selection_icon.png|$menu[2]\n";
	print "MENUITEMICON|window_icon.png|$menu[3]\n";
} else {
	print "MENUITEMICON|inv_selection_icon.png|$menu[2]\n";
	print "MENUITEMICON|inv_window_icon.png|$menu[3]\n";
}

if ($os_version == 1) {
	print "----\n";
	
	if ($cap_dark_mode == 0) {
		
		if ($vid_cap_timer == 15) {
			print "MENUITEMICON|video_cap_icon.png|$menu[59]\n";
		} elsif ($vid_cap_timer == 30) {
			print "MENUITEMICON|video_cap_icon.png|$menu[60]\n";
		} elsif ($vid_cap_timer == 10) {
			print "MENUITEMICON|video_cap_icon.png|$menu[58]\n";
		} else {
			print "MENUITEMICON|video_cap_icon.png|$menu[59]\n";
		}
	
	} else {
		
		if ($vid_cap_timer == 15) {
			print "MENUITEMICON|inv_video_cap_icon.png|$menu[59]\n";
		} elsif ($vid_cap_timer == 30) {
			print "MENUITEMICON|inv_video_cap_icon.png|$menu[60]\n";
		} elsif ($vid_cap_timer == 10) {
			print "MENUITEMICON|inv_video_cap_icon.png|$menu[58]\n";
		} else {
			print "MENUITEMICON|inv_video_cap_icon.png|$menu[59]\n";
		}
	}
}

print "----\n";

if ($cap_cc != 1) {
	# file format options
	if ($ext eq "png") {
		print "SUBMENU|$menu[4]|✓ $menu[8]|    $menu[9]|    $menu[10]|    $menu[11]\n";
	} elsif ($ext eq "jpeg") {
		print "SUBMENU|$menu[5]|    $menu[8]|✓ $menu[9]|    $menu[10]|    $menu[11]\n";
	} elsif ($ext eq "tiff") {
		print "SUBMENU|$menu[6]|    $menu[8]|    $menu[9]|✓ $menu[10]|    $menu[11]\n";
	} elsif ($ext eq "bmp") {
		print "SUBMENU|$menu[7]|    $menu[8]|    $menu[9]|   $menu[10]|✓ $menu[11]\n";
	}
	
# save locations
my $who = `whoami`;
chomp($who);
my $gdrive = "/Users/ari/Google Drive/";
$gdrive =~ s/ari/$who/g;

	if (-e $gdrive) {
		
		if ($cap_dir eq "~/desktop/") {
			print "SUBMENU|$menu[12]|✓ $menu[15]|    $menu[16]|    $menu[17]|    $menu[57]\n";
		} elsif ($cap_dir eq "~/documents/") {
			print "SUBMENU|$menu[13]|    $menu[15]|✓ $menu[16]|    $menu[17]|    $menu[57]\n";
		} elsif ($cap_dir eq "~/downloads/") {
			print "SUBMENU|$menu[14]|    $menu[15]|    $menu[16]|✓ $menu[17]|    $menu[57]\n";
		} elsif ($cap_dir eq "~/\'Google Drive/\'") {
			print "SUBMENU|$menu[56]|    $menu[15]|    $menu[16]|    $menu[17]|✓ $menu[57]\n";
		}
		
	} else {
		
		if ($cap_dir eq "~/desktop/") {
			print "SUBMENU|$menu[12]|✓ $menu[15]|    $menu[16]|    $menu[17]\n";
		} elsif ($cap_dir eq "~/documents/") {
			print "SUBMENU|$menu[13]|    $menu[15]|✓ $menu[16]|    $menu[17]\n";
		} elsif ($cap_dir eq "~/downloads/") {
			print "SUBMENU|$menu[14]|    $menu[15]|    $menu[16]|✓ $menu[17]\n";
		}
	}
}

print "----\n";

# pre-capture options
if ($cap_mp == 0) {
	$menu[27] =~ s/$menu[27]/    $menu[27]/g;
} elsif ($cap_mp == 1) {
	$menu[27] =~ s/$menu[27]/✓ $menu[27]/g;
}

if ($cap_ds == 0) {
	$menu[28] =~ s/$menu[28]/    $menu[28]/g;
} elsif ($cap_ds == 1) {
	$menu[28] =~ s/$menu[28]/✓ $menu[28]/g;
}

if ($cap_sfx == 0) {
	$menu[29] =~ s/$menu[29]/    $menu[29]/g;
} elsif ($cap_sfx == 1) {
   $menu[29] =~ s/$menu[29]/✓ $menu[29]/g;
}

if ($cap_kc == 0) {
	$menu[61] =~ s/$menu[61]/    $menu[61]/g;
} elsif ($cap_kc == 1) {
	$menu[61] =~ s/$menu[61]/✓ $menu[61]/g;
}

if ($os_version != 1) {
	print "SUBMENU|$menu[26]|$menu[27]|$menu[28]|$menu[29]\n";
} else {
	print "SUBMENU|$menu[26]|$menu[27]|$menu[28]|$menu[29]|$menu[61]\n";
}

# post-capture options
if ($cap_op == 0) {
	$menu[31] =~ s/$menu[31]/    $menu[31]/g;
} elsif ($cap_op == 1) {
	$menu[31] =~ s/$menu[31]/✓ $menu[31]/g;
}

if ($cap_cc == 0) {
	$menu[32] =~ s/$menu[32]/    $menu[32]/g;
} elsif ($cap_cc == 1) {
	$menu[32] =~ s/$menu[32]/✓ $menu[32]/g;
}

if ($cap_reveal == 0) {
	$menu[34] =~ s/$menu[34]/    $menu[34]/g;
} elsif ($cap_reveal == 1) {
	$menu[34] =~ s/$menu[34]/✓ $menu[34]/g;
}

print "SUBMENU|$menu[30]|$menu[31]|$menu[32]|$menu[34]\n";
print "----\n";

# timer delay and auto-login options
if ($cap_delay == 0) {
	$menu[18] =~ s/$menu[18]/    $menu[18]/g;
} elsif ($cap_delay == 1) {
	$menu[18] =~ s/$menu[18]/✓ $menu[18]/g;
}

if ($cap_login == 0) {
	$menu[35] =~ s/$menu[35]/    $menu[35]/g;
} elsif ($cap_login == 1) {
	$menu[35] =~ s/$menu[35]/✓ $menu[35]/g;
}

if ($cap_notify == 0) {
	$menu[33] =~ s/$menu[33]/    $menu[33]/g;
} elsif ($cap_notify == 1) {
	$menu[33] =~ s/$menu[33]/✓ $menu[33]/g;
}

print "SUBMENU|$menu[49]|$menu[18]|$menu[33]|$menu[35]\n";
print "----\n";
print "$menu[36]\n";

# parse user selections
my $line = shift(@ARGV);

# video capture
if ($line =~ m/Capture Full Screen Video/) {

	if ($cap_op == 1) {
		$op = "-P ";
	}

	if ($cap_kc == 1) {
		$kc = "-k ";
	}

	my $cap_type = "video_";
	my $time_stamp = `date "+%m%d%H%M%Y%s".mp4`;
	
	for (my $i = 5; $i >= 0; $i--) {
			print "NOTIFICATION: $i $menu[48]\n";
	}
		sleep(5);
		my $clear_notifications = `defaults write ~/Library/Preferences/ByHost/com.apple.notificationcenterui.*.plist doNotDisturb -boolean true; killall NotificationCenter`;
		my $set_notifications = `defaults write ~/Library/Preferences/ByHost/com.apple.notificationcenterui.*.plist doNotDisturb -boolean false; killall NotificationCenter`;
		system("afplay /System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds/WebPageLoaded.aiff");
		my $command = `screencapture -v -V$vid_cap_timer $kc $op $cap_dir$capture_filename$cap_type$time_stamp`;

	if ($cap_reveal == 1) {
		my $command = `open -R $cap_dir$capture_filename$cap_type$time_stamp`;
	}
	
	if ($cap_notify == 1) {
		print "NOTIFICATION: $menu[63]\n";
	}
}

# full screen capture
if ($line =~ m/$menu[0]/) {
	if ($cap_op == 1) {
		$op = "-P ";
	}
	if ($cap_cc == 1) {
		$cc = "-c ";
	}
	if ($cap_sfx == 0) {
		$sfx = "-x ";
	}
	if ($cap_ds == 1) {
		$ds = "-o ";
	}
	if ($cap_mp == 1) {
		$mp = "-C ";
	}

	if ($ext eq "png") {
		my $fmt = "-t png";
	} elsif ($ext eq "jpeg") {
		my $fmt = "-t jpeg";
	} elsif ($ext eq "tiff") {
		my $fmt = "-t tiff";
	} elsif ($ext eq "bmp") {
		my $fmt = "-t bmp";
	}

	my $cap_type = "full_";
	my $time_stamp = `date "+%m%d%H%M%Y%s".$ext`;

# Take delayed screen capture on delay
	if ($cap_delay == 0) {
		my $command = `screencapture -t $ext $cc $mp $sfx $ds $op $cap_dir$capture_filename$cap_type$time_stamp`;
	} elsif ($cap_delay == 1) {
		for (my $i = $cap_timer; $i >= 0; $i--) {
			print "NOTIFICATION: $i $menu[48]\n";
		}
# Hacky way of doing a count down and clearing the screen of the notification but it works!
	sleep($cap_timer);
	my $clear_notifications = `defaults write ~/Library/Preferences/ByHost/com.apple.notificationcenterui.*.plist doNotDisturb -boolean true; killall NotificationCenter`;
	my $set_notifications = `defaults write ~/Library/Preferences/ByHost/com.apple.notificationcenterui.*.plist doNotDisturb -boolean false; killall NotificationCenter`;
	my $command = `screencapture -T2 -t $ext $cc $mp $sfx $ds $op $cap_dir$capture_filename$cap_type$time_stamp`;
	}

	if ($cap_reveal == 1) {
		my $command = `open -R $cap_dir$capture_filename$cap_type$time_stamp`;
	}

	if ($cap_notify == 1 && $cap_cc == 0) {
		print "NOTIFICATION: $menu[38] $cap_dir$capture_filename$cap_type$time_stamp\n";
	} elsif ($cap_notify == 1 && $cap_cc == 1) {
		print "NOTIFICATION: $menu[45]\n";
	}
}

# area screen capture
if ($line =~ m/$menu[2]/) {
	
	if ($cap_op == 1) {
		$op = "-P ";
	}
	
	if ($cap_cc == 1) {
		$cc = "-c ";
	}
	
	if ($cap_sfx == 0) {
		$sfx = "-x ";
	}
	
	if ($cap_ds == 1) {
		$ds = "-o ";
	}
	
	if ($cap_mp == 1) {
		$mp = "-C ";
	}
	
	if ($ext eq "png") {
		$fmt = "-t png";
	} elsif ($ext eq "jpeg") {
		$fmt = "-t jpeg";
	} elsif ($ext eq "tiff") {
		$fmt = "-t tiff";
	} elsif ($ext eq "bmp") {
		$fmt = "-t bmp";
	}

	my $cap_type = "area_";
	my $time_stamp = `date "+%m%d%H%M%Y%s".$ext`;
	my $command = `screencapture \"-s\" $fmt $cc $mp $sfx $ds $op $cap_dir$capture_filename$cap_type$time_stamp`;
	
	if ($cap_reveal == 1) {
		my $command = `open -R $cap_dir$capture_filename$cap_type$time_stamp`;
	}

	if ($cap_notify == 1 && $cap_cc == 0) {
		print "NOTIFICATION: $menu[39] $cap_dir$capture_filename$cap_type$time_stamp\n";
	} elsif ($cap_notify == 1 && $cap_cc == 1) {
		print "NOTIFICATION: $menu[46]\n";
	}
}

# screen window capture
if ($line =~ m/$menu[3]/) {
	
	if ($cap_op == 1) {
		$op = "-P ";
	} else {
		$op = "";
	}

	if ($cap_cc == 1) {
		$cc = "-c ";
	} else {
		$cc = "";
	}

	if ($cap_sfx == 0) {
		$sfx = "-x ";
	} else {
		$sfx = "";
	}
	
	if ($cap_ds == 0) {
		$ds = "-o ";
	} else {
		$ds = "";
	}
	
	if ($cap_mp == 1) {
		$mp = "-C ";
	} else {
		$mp = "";
	}

	if ($ext eq "png") {
		$fmt = "-t png";
	} elsif ($ext eq "jpeg") {
		$fmt = "-t jpeg";
	} elsif ($ext eq "tiff") {
		$fmt = "-t tiff";
	} elsif ($ext eq "bmp") {
		$fmt = "-t bmp";
	}

	my $cap_type = "window_";
	my $time_stamp = `date "+%m%d%H%M%Y%s".$ext`;
	my $command = `screencapture \"-w\" $fmt $cc $mp $sfx $ds $op $cap_dir$capture_filename$cap_type$time_stamp`;

	if ($cap_reveal == 1) {
		my $command = `open -R $cap_dir$capture_filename$cap_type$time_stamp`;
	}

	if ($cap_notify == 1 && $cap_cc == 0) {
		print "NOTIFICATION: $menu[40] $cap_dir$capture_filename$cap_type$time_stamp\n";
	} elsif ($cap_notify == 1 && $cap_cc == 1) {
		print "NOTIFICATION: $menu[47]\n";
	}
}

# save format
if ($line =~ m/$menu[8]/) {
	$ext = "png";
	my $command = `defaults write com.ari.MenuSnappr format 0`;
} elsif ($line =~ m/$menu[9]/) {
	$ext = "jpeg";
	my $command = `defaults write com.ari.MenuSnappr format 1`;
} elsif ($line =~ m/$menu[10]/) {
	$ext = "tiff";
	my $command = `defaults write com.ari.MenuSnappr format 2`;
} elsif ($line =~ m/$menu[11]/) {
	$ext = "bmp";
	my $command = `defaults write com.ari.MenuSnappr format 3`;
}

# storage directory
if ($line =~ m/$menu[15]/) {
	$cap_dir = "~/desktop/";
	my $command = `defaults write com.ari.MenuSnappr store 0`;
} elsif ($line =~ m/$menu[16]/) {
	$cap_dir = "~/documents/";
	my $command = `defaults write com.ari.MenuSnappr store 1`;
} elsif ($line =~ m/$menu[17]/) {
	$cap_dir = "~/downloads/";
	my $command = `defaults write com.ari.MenuSnappr store 2`;
} elsif ($line =~ m/$menu[57]/) {
	$cap_dir = "~/\'Google Drive/\'";
	my $command = `defaults write com.ari.MenuSnappr store 3`;
}

# pre-capture options
if ($line =~ m/$menu[27]/) {
	$cap_mp = 1 - $cap_mp;
	my $command = `defaults write com.ari.MenuSnappr mp $cap_mp`;
}
if ($line =~ m/$menu[28]/) {
	$cap_ds = 1 - $cap_ds;
	my $command = `defaults write com.ari.MenuSnappr ds $cap_ds`;
}
if ($line =~ m/$menu[29]/) {
	$cap_sfx = 1 - $cap_sfx;
	my $command = `defaults write com.ari.MenuSnappr sfx $cap_sfx`;
}

# post-capture options
if ($line =~ m/$menu[31]/) {
	$cap_op = 1 - $cap_op;
	my $command = `defaults write com.ari.MenuSnappr op $cap_op`;
}

if ($line =~ m/$menu[32]/) {
	$cap_cc = 1 - $cap_cc;
	my $command = `defaults write com.ari.MenuSnappr cc $cap_cc`;
}

if ($line =~ m/$menu[33]/) {
	$cap_notify = 1 - $cap_notify;
	my $command = `defaults write com.ari.MenuSnappr notify $cap_notify`;
}

if ($line =~ m/$menu[34]/) {
	$cap_reveal = 1 - $cap_reveal;
	my $command = `defaults write com.ari.MenuSnappr reveal $cap_reveal`;
}

if ($line =~ m/$menu[61]/) {
	$cap_kc = 1 - $cap_kc;
	my $command = `defaults write com.ari.MenuSnappr kc $cap_kc`;
}

if ($line =~ m/$menu[35]/) {
	$cap_login = 1 - $cap_login;
	my $command = `defaults write com.ari.MenuSnappr login $cap_login`;
	
	if ($cap_login == 1) {
		my $command = `osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Menu Snappr.app", hidden:false}'`;
	} elsif ($cap_login == 0) {
		my $command = `osascript -e 'tell application "System Events" to delete login item "Menu Snappr"'`;
	}
}

if ($line =~ /$menu[18]/) {
	$cap_delay = 1 - $cap_delay;
	my $command = `defaults write com.ari.MenuSnappr delay $cap_delay`;
}

if ($line =~ /$menu[36]/) {
	if ($os_version == 0) {
		my $icon = `cp appIcon.icns /tmp/icon.icns`; 
	} elsif ($os_version == 1) {
		
		if ($cap_dark_mode == 1) {
			my $icon = `cp inv_app_icon.png /tmp/icon.icns`;
		} else {
			my $icon = `cp appIcon.icns /tmp/icon.icns`;
		}
	}
	
	&dialog("Menu Snappr $version_num\n\n$menu[37]\n\nAri Feldman (1 December 2018)\ninfo\@widgetworx.com");
	my $command = `rm /tmp/icon.icns`;
}

# hack that sets up preferences and UI values if no pref file exists
sub init {
	$os_detect = `sw_vers -productVersion`;
	if ($os_detect  =~ m/10.14/ || $os_detect =~ m/10.15/) {
		$os_version = 1;
	} else {
		$os_version = 0;
	}
	
	if (-e "~/library/preferences/com.ari.MenuSnappr.plist") {
		goto PREFS;
 	} else {
		my $temp = `defaults write com.ari.MenuSnappr temp 1`;
		$cap_sfx = 1;
		$cap_mp = 1;
		$cap_ds = 1;
		$cap_op = 0;
		$cap_cc = 0;
		$cap_notify = 1;
		$cap_login = 0;
		$cap_reveal = 0;
		$cap_delay = 1;
		$cap_store = 1;
		$cap_kc = 1;
		$ext = "png";
		$cap_dir = "~/documents/";
		$capture_filename = "ms_capture_";
		$cap_timer = 5;
		$vid_cap_timer = 15;
		
		my $command = `osascript <<EOF
		tell application "System Events"
			tell appearance preferences
				if dark mode is true then
					do shell script "/usr/bin/defaults write com.ari.MenuSnappr dm 1"
				else
					do shell script "/usr/bin/defaults write com.ari.MenuSnappr dm 0"
				end if
			end tell
		end tell
	EOF`;
	}

PREFS:
	$capture_filename = "ms_capture_";
	$cap_prefs = `defaults read com.ari.MenuSnappr`;

		if ($cap_prefs =~ m/format = 0/) {
			$ext = "png";
		} elsif ($cap_prefs =~ m/format = 1/) {
			$ext = "jpeg";
		} elsif ($cap_prefs =~ m/format = 2/) {
			$ext = "tiff";
		} elsif ($cap_prefs =~ m/format = 3/) {
			$ext = "bmp";
		}

		if ($cap_prefs =~ m/store = 0/) {
			$cap_dir = "~/desktop/";
		} elsif ($cap_prefs =~ m/store = 1/) {
			$cap_dir = "~/documents/";
		} elsif ($cap_prefs =~ m/store = 2/) {
			$cap_dir = "~/downloads/";
		} elsif ($cap_prefs =~ m/store = 3/) {
			$cap_dir = "~/\'Google Drive/\'";
		}
		
		if ($cap_prefs =~ m/sfx = 0/) {
			$cap_sfx = 0;
		} elsif ($cap_prefs =~ m/sfx = 1/) {
			$cap_sfx = 1;
		}

		if ($cap_prefs =~ m/mp = 0/) {
			$cap_mp = 0;
		} elsif ($cap_prefs =~ m/mp = 1/) {
			$cap_mp = 1;
		}

		if ($cap_prefs =~ m/ds = 0/) {
			$cap_ds = 0;
		} elsif ($cap_prefs =~ m/ds = 1/) {
			$cap_ds = 1;
		}

		if ($cap_prefs =~ m/cc = 0/) {
			$cap_cc = 0;
		} elsif ($cap_prefs =~ m/cc = 1/) {
			$cap_cc = 1;
		}

		if ($cap_prefs =~ m/op = 0/) {
			$cap_op = 0;
		} elsif ($cap_prefs =~ m/op = 1/) {
			$cap_op = 1;
		}
		
		if ($cap_prefs =~ m/kc = 0/) {
			$cap_kc = 0;
		} elsif ($cap_prefs =~ m/kc = 1/) {
			$cap_kc = 1;
		}

		if ($cap_prefs =~ m/notify = 0/) {
			$cap_notify = 0;
		} elsif ($cap_prefs =~ m/notify = 1/) {
			$cap_notify = 1;
		}
		
		if ($cap_prefs =~ m/login = 0/) {
			$cap_login = 0;
		} elsif ($cap_prefs =~ m/login = 1/) {
			$cap_login = 1;
		}
		
		if ($cap_prefs =~ m/reveal = 0/) {
			$cap_reveal = 0;
		} elsif ($cap_prefs =~ m/reveal = 1/) {
			$cap_reveal = 1;
		}
		
		if ($cap_prefs =~ m/delay = 0/) {
			$cap_delay = 0;
		} elsif ($cap_prefs =~ m/delay = 1/) {
			$cap_delay = 1;
		}
		
		if ($cap_prefs =~ m/dm = 0/) {
			$cap_dark_mode = 0;
		} elsif ($cap_prefs =~ m/dm = 1/) {
			$cap_dark_mode = 1;
		}
		
 		if ($cap_prefs =~ m/timer = 3/) {
			$cap_timer = 3;
		} elsif ($cap_prefs =~ m/timer = 5/) {
			$cap_timer = 5;
		} else {
			$cap_timer = 5;
			my $command = `defaults write com.ari.MenuSnappr timer 5`;
		}
		
		if ($cap_prefs =~ m/vtimer = 10/) {
			$vid_cap_timer = 10;
		} elsif ($cap_prefs  =~ m/vtimer = 15/) {
			$vid_cap_timer = 15;
		} elsif ($cap_prefs =~ m/vtimer = 30/) {
			$vid_cap_timer = 30;
		} else {
		  	$vid_cap_timer = 15;
		  my $command = `defaults write com.ari.MenuSnappr vtimer 15`;
		}
}


sub dialog {
	my ($text) = @_;
	my $command = `osascript <<EOF
	tell application "System Events"
	(display dialog "$text" buttons {"OK"} default button 1 with icon alias \"Macintosh HD:tmp:icon.icns\")
	 end tell
	EOF`;
}
