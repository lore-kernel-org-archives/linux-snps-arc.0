From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 18 Mar 2016 06:35:08 -0000
Subject: kisskb: OK linux-next/axs103_smp_defconfig/arcv2 Fri Mar 18, 17:34
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160318063508.1.67928@4cca3ee1040e>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs103_smp_defconfig/arcv2 Fri Mar 18, 17:34

http://kisskb.ellerman.id.au/kisskb/buildresult/12638735/

Commit:   Add linux-next specific files for 20160318
          5e3497cca281616e7930b74a0076b7324dcc2057
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

     harderr = icmp_err_convert[code].fatal;

Possible warnings (119)
----------------------

drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
<stdin>:1310:2: warning: #warning syscall preadv2 not implemented [-Wcpp]
<stdin>:1313:2: warning: #warning syscall pwritev2 not implemented [-Wcpp]
Warning (unit_address_vs_reg): Node /cpu_card has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /cpu_card/archs-intc at cpu has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /axs10x_mb has a reg or ranges property, but no unit name
kernel/sched/core.c:3080:1: warning: control reaches end of non-void function [-Wreturn-type]
kernel/sysctl.c:1949:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sysctl.c:1949:12: warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
ipc/shm.c:1252:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:787:21: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:95:8: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:665:17: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/time/posix-cpu-timers.c:1238:13: warning: 'now' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1713:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:1713:2: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/arc/include/asm/elf.h:58:29: warning: integer overflow in expression [-Woverflow]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/rbtree.h:83:28: warning: 'rb_parent' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/rbtree.h:86:11: warning: 'rb_link' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/mmap.c:558:17: warning: 'prev' may be used uninitialized in this function [-Wmaybe-uninitialized]
lib/cpumask.c:179:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:735:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/datagram.c:99:5: warning: 'last' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/usb/core/hub.c:2767:16: warning: 'portchange' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/core/hub.c:2740:20: warning: 'portstatus' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/ethtool.c:295:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:363:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:473:40: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/storage/transport.c:499:15: warning: 'partial' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/buffer_head.h:370:2: warning: 'blocknr' may be used uninitialized in this function [-Wmaybe-uninitialized]
block/cfq-iosched.c:3793:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:315:21: warning: 'handle' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:561:5: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/neighbour.c:3180:10: warning: 'p_name' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/inode.c:5638:6: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/tty/serial/8250/8250_core.c:163:19: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
include/net/inetpeer.h:141:6: warning: 'saddr.<Ue850>.key[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Ue850>.key[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:26: warning: 'saddr.<Ue850>.a4.vif' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Ue850>.a4.addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.<Ue850>.a4.addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/tcp_metrics.c:1080:7: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Ue850>.key[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'saddr.<Ue850>.key[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/net/inetpeer.h:141:6: warning: 'daddr.in6_u.u6_addr32[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_extents.h:224:8: warning: '*((void *)&zero_ex+8)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_extents.h:225:12: warning: '*((void *)&zero_ex+6)' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:3129:2: warning: 'zero_ex.ee_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/ext4_jbd2.h:409:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/tcp_input.c:4273:49: warning: array subscript is above array bounds [-Warray-bounds]
net/ipv4/ping.c:561:37: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:534:3: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:515:48: warning: 'icmph' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1721:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/packet/af_packet.c:2159:33: warning: 'hdrlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:692:21: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:478:63: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/xfrm/xfrm_policy.c:1599:7: warning: 'dst_ops' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1036:20: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/extents.c:2320:14: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1251:8: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1130:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/unix/af_unix.c:1721:9: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/sunrpc/svc_xprt.h:175:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/fib_trie.c:909:11: warning: 'local_tp' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/xfrm/xfrm_policy.c:1599:7: warning: 'dst_ops' may be used uninitialized in this function [-Wmaybe-uninitialized]
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
