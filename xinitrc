### Important information for X
xmodmap ~/.Xmodmap
xrdb -merge ~/.Xresources

KWIN_COMPOSE=N
TERM=vt102

export KWIN_COMPOSE TERM

### Start services.
/sbin/pidof mpd || mpd
/sbin/pidof mpdscribble || mpdscribble --conf ~/.mpdscribble/mpdscribble.conf

### Start wm
DEFAULT_SESSION=stumpwm
case $1 in
# fluxbox)
# 	exec fluxbox
#  	;;
# enlightenment)
# 	exec enlightenment_start
#  	;;
# blackbox)
# 	exec blackbox
# 	;;
# xfce4)
# 	exec startxfce4
# 	;;
stumpwm)
  	LANG=en_US.UTF-8 exec stumpwm
#  	#exec stumpwm
  	;;
# razorqt)
#	exec razorqt-session
# 	;;
# # ratpoison)
# # 	exec ratpoison
# # 	;;
*)
 	LANG=en_US.UTF-8 exec $DEFAULT_SESSION
  	;;
esac
