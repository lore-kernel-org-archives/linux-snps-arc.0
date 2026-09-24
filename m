Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AD1C98314
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2026 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRH38hZQH2523XjVn706Aw1cnP3DmxIcq7Q20l9Y/zM=; b=SHgZwHfNCJkyCO
	bSZcfleiaB9UOdIBATlDbcfRL4YaQdX8N7cFUS3HVDdAi1ocMsE5paq4/AmM3ZM5Iu0elmmLSFxzX
	17/ImdV74JrV7jW/GXGRZBkgZ9u8z6uf+ShlkbG/rZbcXw+/XiXQN+HbeiDV2vJuOQsBbPcGyOPIk
	kWu5rKxTew8QGT+ZeiUITin4CXtzX25fXoLlhSpU7LnARQR1KJhyPBLP4z793EyiClJ9z5+cmirIV
	t5zxsGhbWuGuo8gwhPaYy1N/rzQ3SOEUDzvpxmbVQcZvJ0jG5Qap2VgS8CP7JrYLVgdiH1o3MvtGX
	HYE9gD9wqUhSWCbeAQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eFG-0000000ALVV-2jc3;
	Thu, 24 Sep 2026 07:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eFD-0000000ALV9-2tkU
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 24 Sep 2026 07:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9562Xo90TqOWWNbyatjz5XzvLEfMlzxdXTwdTQ2qGi8=; b=Ykl6V2oyLA/LxO9XaHA9nY0uO7
	8j7/zab07f3JPy3+kTFsVG7pEcCaRhVakVNDsmNTX67V+NK/DJ3sRRQeF1PuVP0mJF3zST9dcnTmj
	xcRXthZAEYdj0NcC4mVqOWI7hOd0O/qfybLVapcCTNCsZWvL4Nn4R0hNq8ZBS3pwTK+4lrRIADRbi
	LxrIEkHiMLD+l7Yxh2Xv9ahAc/I9k5k0XodLelDVG727vySXIAVokN9ho8NoFTzJpei3Z5Ce2M9/3
	tF2ZqfXgrT2Mf2PxF0mGPEH97wxi+4yxZTdkHQheAVkdrnQeoSW+L+chT2JKVEG+S3WnTZK6wo+qB
	QX+ReGEg==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9eF7-0000000Fg8k-4Apy
	for linux-snps-arc@lists.infradead.org;
	Thu, 24 Sep 2026 07:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790236306; x=1821772306;
  h=date:from:to:cc:subject:message-id;
  bh=RHmy0Can0xez2ljF2NxOHqoZ31lResgifk22BTLGvY8=;
  b=SmcktBB/4Dc/aFkM6H2JAPWvTA6SubRiQlo0RXNfEarRrESfVQl9HYLK
   sX1yOkHAF/lH4VUX18uj5xwGiwfAUJ/erp1p2TBjuRNg+ikq6pcYz6jqb
   DpIVq4VD6e5nKXvpL/pqKQTPgY7rfd3e9D3XyzB/W/EAntjhvTjsJxegX
   VlV1Q79EK/B7H25JSoWDpj5EVZSZkDP/NV4yQMVVpBe6Fd+zcXixjo0Ji
   36ON7awl5Wb5QonOR+s19CZu1FqOaGzzvlgqE+J4126TGdfZWaljRA8J6
   tZUQUjd2pfdazqWc/9sc73O10doywB182upONCNCErd0Yzaxy4MPpI7UP
   w==;
X-CSE-ConnectionGUID: 2f1M2ItJRFuycJuSxh88vQ==
X-CSE-MsgGUID: O6XB/rr0QruK12qa/Dkiww==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91016576"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91016576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:51:43 -0700
X-CSE-ConnectionGUID: 9yUfAK+vTb2XfiWzWqeNFg==
X-CSE-MsgGUID: xvEq+xDQRcuF/hvz1MZ7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277111298"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2026 00:51:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9eF1-00000000INy-2EfZ;
	Thu, 24 Sep 2026 07:51:39 +0000
Date: Thu, 24 Sep 2026 15:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
 conditional expression
Message-ID: <202609241517.SSV1Goz3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_085148_717975_D15325AC 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/fscrypt.h:16,
                    from fs/crypto/fscrypt_private.h:15,
                    from fs/crypto/hooks.c:10:
   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
      46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                                                          ^
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:51: note: first expression has type 'char *'
      46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                                                   ^~~~~~
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:60: note: second expression has type 'unsigned char *'
      46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                                                            ^~~~~
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~


vim +46 arch/arc/include/asm/cmpxchg.h

    41	
    42	#define arch_cmpxchg_relaxed(ptr, old, new)				\
    43	({									\
    44		__typeof__(ptr) _p_ = (ptr);					\
    45		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
  > 46		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
    47		__typeof__(*(ptr)) _prev_;					\
    48										\
    49		switch (sizeof(*(_p_))) {						\
    50		case 1:								\
    51			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, _old_, _new_);	\
    52			break;							\
    53		case 2:								\
    54			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, _old_, _new_);	\
    55			break;							\
    56		case 4:								\
    57			_prev_ = (__typeof__(*(ptr)))__cmpxchg(_p_, _old_, _new_);			\
    58			break;							\
    59		default:							\
    60			BUILD_BUG();						\
    61		}								\
    62		_prev_;								\
    63	})
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
