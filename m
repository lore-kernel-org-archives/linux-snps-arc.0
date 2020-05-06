Return-Path: <SRS0=I7CJ=6U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39523C28CBC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 21:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07977206D5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 21:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hh+xYOr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07977206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Q2uyvstjcPDfCU6a3lXZYBilHODxkg2yi3cql9PYigc=; b=hh+
	xYOr690M5dinQd2m18kIvFALuBsKMC1otnWjPpCZxRRexAN7OJd2zFkLjKDFLiiBf1jbqkTnclJx0
	0GuLfA7xxIHXTmyLv15HPyV+90ZwgrfXmb8ckW26GVD/3g0eYqU7ONig/JbbHJiD5VawLfQPfqRB6
	mxxoSh1vaOgHbzH3joPR6GSRrfFa0ZbDijnXOGOJOJJJsoE3bLyRuTNHkwWQkyb//gngilphVCxpN
	DSj7xx6qLOrtFnVFAj+FToRljPXmnZ97Gt3JQUvovesgOvr5/0QQqESyG4YQxYGFiPtCILZwX3Sls
	Nrg+vnEgIqCCeR+uSXy//sHxYwsBYag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWS3z-0007ov-Ko; Wed, 06 May 2020 21:58:47 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWS3w-0007oU-5N
 for linux-snps-arc@lists.infradead.org; Wed, 06 May 2020 21:58:46 +0000
IronPort-SDR: hMM7SVrcclcFnWHl6dVgUYKIMfgq58QPlcwSmIPfGiziyj5l4QYJ2QiXL/FEVK+j+d679COBNX
 0lSJVWPcYKXg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 14:58:41 -0700
IronPort-SDR: yIMo7t71QRWijurQxcr7FNEsdSH0qt6F86hP5lO7g6Q2KMY9LR8U0yb1FTxgkgZ2sH55yOvjMm
 cG0FJtBhDvwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; 
 d="gz'50?scan'50,208,50";a="461916704"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 06 May 2020 14:58:40 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jWS3r-000H9l-S8; Thu, 07 May 2020 05:58:39 +0800
Date: Thu, 7 May 2020 05:57:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [arc:topic-zol-remove 10/30] arch/arc/include/asm/checksum.h:46:
 Error: opcode 'ldd' not supported for target arc700
Message-ID: <202005070553.XnfuivOE%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_145844_272401_983C55DF 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org, kbuild-all@lists.01.org
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git topic-zol-remove
head:   8ce6b2a73b83a4a77f5444a0a2c27748bb27ea0f
commit: d033e9026a729efc2101065b8251f94f78e48566 [10/30] ARC: checksum: elide ZOL, use double load/stores
config: arc-tb10x_defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d033e9026a729efc2101065b8251f94f78e48566
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=arc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arc/include/asm/checksum.h: Assembler messages:
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
--
   arch/arc/include/asm/checksum.h: Assembler messages:
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
--
   arch/arc/include/asm/checksum.h: Assembler messages:
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700
>> arch/arc/include/asm/checksum.h:46: Error: opcode 'ldd' not supported for target arc700
   arch/arc/include/asm/checksum.h:47: Error: opcode 'ldd' not supported for target arc700

vim +/ldd +46 arch/arc/include/asm/checksum.h

ca15c8ecd588dd Vineet Gupta 2013-01-18  33  
ca15c8ecd588dd Vineet Gupta 2013-01-18  34  /*
ca15c8ecd588dd Vineet Gupta 2013-01-18  35   *	This is a version of ip_compute_csum() optimized for IP headers,
ca15c8ecd588dd Vineet Gupta 2013-01-18  36   *	which always checksum on 4 octet boundaries.
d033e9026a729e Vineet Gupta 2020-04-08  37   *	@ihl comes from IP hdr and is number of 4-byte words
d033e9026a729e Vineet Gupta 2020-04-08  38   *	optimized for 5 words (no loop taken)
ca15c8ecd588dd Vineet Gupta 2013-01-18  39   */
ca15c8ecd588dd Vineet Gupta 2013-01-18  40  static inline __sum16
ca15c8ecd588dd Vineet Gupta 2013-01-18  41  ip_fast_csum(const void *iph, unsigned int ihl)
ca15c8ecd588dd Vineet Gupta 2013-01-18  42  {
d033e9026a729e Vineet Gupta 2020-04-08  43  	unsigned int tmp, sum;
d033e9026a729e Vineet Gupta 2020-04-08  44  	u64 dw1, dw2;
ca15c8ecd588dd Vineet Gupta 2013-01-18  45  
ca15c8ecd588dd Vineet Gupta 2013-01-18 @46  	__asm__(
d033e9026a729e Vineet Gupta 2020-04-08  47  	"	ldd.ab %0, [%4, 8]	\n"
d033e9026a729e Vineet Gupta 2020-04-08  48  	"	ldd.ab %1, [%4, 8]	\n"
d033e9026a729e Vineet Gupta 2020-04-08  49  	"	sub    %5, %5,  4	\n"
d033e9026a729e Vineet Gupta 2020-04-08  50  	"	add.f  %3, %L0, %H0	\n"
d033e9026a729e Vineet Gupta 2020-04-08  51  	"	adc.f  %3, %3,  %L1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  52  	"	adc.f  %3, %3,  %H1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  53  	"1:	ld.ab  %2, [%4, 4]	\n"
d033e9026a729e Vineet Gupta 2020-04-08  54  	"	adc.f  %3, %3,  %2	\n"
d033e9026a729e Vineet Gupta 2020-04-08  55  #ifdef CONFIG_ARC_LACKS_ZOL
d033e9026a729e Vineet Gupta 2020-04-08  56  	"	dbnz   %5, 1b		\n"
d033e9026a729e Vineet Gupta 2020-04-08  57  #else
d033e9026a729e Vineet Gupta 2020-04-08  58  	"	sub_s  %5, %5,  1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  59  	"	brne_s %5, 0,   1b	\n"
d033e9026a729e Vineet Gupta 2020-04-08  60  #endif
d033e9026a729e Vineet Gupta 2020-04-08  61  	"	add.cs %3, %3,  1	\n"
d033e9026a729e Vineet Gupta 2020-04-08  62  
d033e9026a729e Vineet Gupta 2020-04-08  63  	: "=&r" (dw1), "=&r" (dw2), "=&r" (tmp), "=&r" (sum),
d033e9026a729e Vineet Gupta 2020-04-08  64  	  "+&r" (iph), "+&r"(ihl)
d033e9026a729e Vineet Gupta 2020-04-08  65  	:
d033e9026a729e Vineet Gupta 2020-04-08  66  	: "cc", "memory");
ca15c8ecd588dd Vineet Gupta 2013-01-18  67  
ca15c8ecd588dd Vineet Gupta 2013-01-18  68  	return csum_fold(sum);
ca15c8ecd588dd Vineet Gupta 2013-01-18  69  }
d033e9026a729e Vineet Gupta 2020-04-08  70  #define ip_fast_csum ip_fast_csum
ca15c8ecd588dd Vineet Gupta 2013-01-18  71  

:::::: The code at line 46 was first introduced by commit
:::::: ca15c8ecd588dda4377d18d6d27bc1e87b4177cb ARC: Checksum/byteorder/swab routines

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--lrZ03NoBR/3+SXJZ
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
G50AAA==

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--lrZ03NoBR/3+SXJZ--

