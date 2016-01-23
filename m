From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Sat, 23 Jan 2016 09:59:58 -0000
Subject: kisskb: OK linus/axs103_smp_defconfig/arcv2 Sat Jan 23, 20:59
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160123095958.1.55369@21ab0802fddb>
To: linux-snps-arc@lists.infradead.org

OK linus/axs103_smp_defconfig/arcv2 Sat Jan 23, 20:59

http://kisskb.ellerman.id.au/kisskb/buildresult/12595469/

Commit:   Merge branch 'for-linus-4.5' of git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs
          2101ae42899a14fe7caa73114e2161e778328661
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

      Btrfs: clean up an error code in btrfs_init_space_info()
      btrfs: fix iterator with update error in backref.c
     harderr = icmp_err_convert[code].fatal;

Possible warnings (104)
----------------------

kernel/sysctl.c:1928:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1928:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/core.c:3162:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/time/posix-cpu-timers.c:818:21: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:95:8: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:695:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
ipc/shm.c:1219:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:1268:13: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/kernel.h:752:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/linux/rbtree.h:83:28: warning: 'rb_parent' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/rbtree.h:86:11: warning: 'rb_link' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/mmap.c:672:17: warning: 'prev' may be used uninitialized in this function [-Wmaybe-uninitialized]
block/cfq-iosched.c:3775:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/namei.c:1760:10: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/base/regmap/regmap-mmio.c:113:1: warning: control reaches end of non-void function [-Wreturn-type]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1715:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:3223:10: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1130:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1036:20: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1251:8: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1724:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1724:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
lib/cpumask.c:178:1: warning: control reaches end of non-void function [-Wreturn-type]
include/net/inetpeer.h:141:6: warning: 'saddr.<Uc130>.key[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Uc130>.key[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:26: warning: 'saddr.<Uc130>.a4.vif' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Uc130>.a4.addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.<Uc130>.a4.addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/tcp_metrics.c:1079:7: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Uc130>.key[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Uc130>.key[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/packet/af_packet.c:2098:33: warning: 'hdrlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/xfrm/xfrm_policy.c:1599:7: warning: 'dst_ops' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/svcauth_unix.c:282:12: warning: 'sin6' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/sunrpc/svc_xprt.h:175:1: warning: control reaches end of non-void function [-Wreturn-type]
net/sunrpc/svcsock.c:779:6: warning: 'optname' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/svcsock.c:779:6: warning: 'level' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/ethtool.c:294:1: warning: control reaches end of non-void function [-Wreturn-type]
net/xfrm/xfrm_policy.c:1599:7: warning: 'dst_ops' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
net/core/neighbour.c:3180:10: warning: 'p_name' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/tcp_input.c:4227:49: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/buffer_head.h:363:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:370:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/fib_trie.c:911:11: warning: 'local_tp' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:559:37: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:532:3: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:513:48: warning: 'icmph' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:690:21: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:476:63: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_extents.h:224:8: warning: '*((void *)&zero_ex+8)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_extents.h:225:12: warning: '*((void *)&zero_ex+6)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:3113:2: warning: 'zero_ex.ee_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:2306:14: warning: 'lblock' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:2305:14: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:559:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:473:40: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/usb/storage/transport.c:499:15: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/tty/serial/8250/8250_core.c:163:19: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
