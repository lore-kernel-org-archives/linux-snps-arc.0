From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 18 Dec 2015 08:52:00 -0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Fri Dec 18, 19:50
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151218085200.1.53295@21ab0802fddb>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs103_smp_defconfig/arcv2 Fri Dec 18, 19:50

http://kisskb.ellerman.id.au/kisskb/buildresult/12571320/

Commit:   Add linux-next specific files for 20151218
          f7ac28a6971b43a2ee8bb47c0ef931b38f7888cf
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

     harderr = icmp_err_convert[code].fatal;
kernel/time/timekeeping.c:1096: undefined reference to `stop_machine'
mm/page_alloc.c:4508: undefined reference to `stop_machine'
make[1]: *** [vmlinux] Error 1
make: *** [sub-make] Error 2

Possible warnings (111)
----------------------

kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/core.c:3162:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:818:21: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:95:8: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1914:12: warning: 'kbuf' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:695:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
ipc/shm.c:1219:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:1268:13: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/kernel.h:724:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/linux/rbtree.h:83:28: warning: 'rb_parent' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/rbtree.h:86:11: warning: 'rb_link' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/mmap.c:672:17: warning: 'prev' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1767:10: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpio/gpiolib.c:193:20: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]
block/cfq-iosched.c:3775:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/namei.c:3237:10: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/base/regmap/regmap-mmio.c:113:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
lib/cpumask.c:178:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:363:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:370:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/ethtool.c:260:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_extents.h:224:8: warning: '*((void *)&zero_ex+8)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_extents.h:225:12: warning: '*((void *)&zero_ex+6)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:3113:2: warning: 'zero_ex.ee_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/neighbour.c:3180:10: warning: 'p_name' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/extents.c:2306:14: warning: 'lblock' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:2305:14: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<U3c78>.key[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<U3c78>.key[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:26: warning: 'saddr.<U3c78>.a4.vif' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<U3c78>.a4.addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.<U3c78>.a4.addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/tcp_metrics.c:1079:7: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<U3c78>.key[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<U3c78>.key[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/tty/serial/8250/8250_core.c:163:19: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:473:40: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:499:15: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/tcp_input.c:4224:49: warning: array subscript is above array bounds [-Warray-bounds]
net/ipv4/ping.c:559:37: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:532:3: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:513:48: warning: 'icmph' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:690:21: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:476:63: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/fib_trie.c:909:11: warning: 'local_tp' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/xfrm/xfrm_policy.c:1599:7: warning: 'dst_ops' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1116:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/packet/af_packet.c:2098:33: warning: 'hdrlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1026:20: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1237:8: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/sunrpc/svc_xprt.h:174:1: warning: control reaches end of non-void function [-Wreturn-type]
net/unix/af_unix.c:1694:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/svcsock.c:779:6: warning: 'optname' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/svcsock.c:779:6: warning: 'level' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/svcauth_unix.c:282:12: warning: 'sin6' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1153:8: warning: 'subbuf.tail[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1149:17: warning: 'subbuf.page_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1149:17: warning: 'subbuf.pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1144:8: warning: 'subbuf.head[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1153:8: warning: 'subbuf.tail[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1149:17: warning: 'subbuf.page_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1149:17: warning: 'subbuf.pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1144:8: warning: 'subbuf.head[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1122:8: warning: 'subbuf.tail[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.page_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1113:8: warning: 'subbuf.head[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1694:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1122:8: warning: 'subbuf.tail[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.page_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1113:8: warning: 'subbuf.head[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1122:8: warning: 'subbuf.tail[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.page_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1207:12: warning: 'subbuf.head[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1122:8: warning: 'subbuf.tail[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.page_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1118:19: warning: 'subbuf.pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/xdr.c:1113:8: warning: 'subbuf.head[0].iov_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/xfrm/xfrm_policy.c:1599:7: warning: 'dst_ops' may be used uninitialized in this function [-Wmaybe-uninitialized]
