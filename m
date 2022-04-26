Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00449C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Apr 2022 00:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hGr9N85iT6/5uOLzU+dpDxjcrwBP6XsViwvBljr9n9s=; b=gacJrmWiTP6HLn
	9cADqrkYhz5NXXG5IrNoU4avATcR4YR77B1zoaFGbl984aCsE6Vwy40xz1hBepSvKYcJqtxEem0Vg
	AC1ITPwx5jt/sJ/1cu9eNX64VpdEUs/i9Gtlkh1jQ2DSySMhW3YHHsoGaNcF+sxC4T5A8hpbduTgW
	sx3rHhIURZrg2MmyQ6bSekzcASvdamn5LKavWJHI6soMGv3Uz4CEkSj/rjUWGz4wJBBPx5oXL12UU
	wqzMMKvDUg+WOm3tXE3mEkePee3oEG22sh6VLa9MH2yXVvvMGi9td77VFO/1gZREmhWBZ64j5Cf43
	XjJvTb39uRB82LT9/qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj9HK-00ByQE-Gz; Tue, 26 Apr 2022 00:42:06 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj9HH-00ByNY-U6
 for linux-snps-arc@lists.infradead.org; Tue, 26 Apr 2022 00:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650933723; x=1682469723;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=MMbvmHnyHTi+LwuQwDlkQnBVChKjFO2/kj4vi/wOjKU=;
 b=VFdC8gr0Z6dVsdUrw+KFQNxgltR1AxZeob51tREcV4MJtNRKi6I0umwD
 XQe3nhXygz60MSbQrErGA7KV3EH2S17TRAGWKGevKW5VjNKra3E+bRejN
 2b5DKhFfUSsF8ScbrRwdL1s/HG8BYhccu8DlgDdxvDdtBhaF780ECM1r2
 pKz2nafXPPBNX89Kn9ELwNMav6OtuDgbaFY9Qnr8n6F3TJ9SHMjjNYusx
 cA2qWPyTwF+1hZtGfMqkwK/WsiPCKBD5U2QEtt9MGNMPaHAI3/dUAGHL+
 oG9fMAuS6b+G9IGtdo2Plghl8+P1T0oXcthCvuVaVEU+iIySn6xlMjVTU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265571849"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="265571849"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 17:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="512888381"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 25 Apr 2022 17:42:00 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nj9HD-00034A-FU;
 Tue, 26 Apr 2022 00:41:59 +0000
Date: Tue, 26 Apr 2022 08:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>
Subject: [vgupta-arc:for-next 3/4] arch/arc/kernel/disasm.c:494:23: error:
 'struct pt_regs' has no member named 'gp'; did you mean 'fp'?
Message-ID: <202204260826.d9fdltJm-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_174204_054993_BD0D3510 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-next
head:   e88856183749fd59759cd4c617f9ecec8280d8fa
commit: b08a66fb680018b621fd8be641c537c625132ab3 [3/4] ARC: disasm: handle ARCv2 case in kprobe get/set functions
config: arc-randconfig-r012-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260826.d9fdltJm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/commit/?id=b08a66fb680018b621fd8be641c537c625132ab3
        git remote add vgupta-arc https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
        git fetch --no-tags vgupta-arc for-next
        git checkout b08a66fb680018b621fd8be641c537c625132ab3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arc/kernel/disasm.c: In function 'disasm_instr':
   arch/arc/kernel/disasm.c:28:19: warning: variable 'ins_ptr' set but not used [-Wunused-but-set-variable]
      28 |         uint16_t *ins_ptr;
         |                   ^~~~~~~
   arch/arc/kernel/disasm.c: In function 'set_reg':
>> arch/arc/kernel/disasm.c:494:23: error: 'struct pt_regs' has no member named 'gp'; did you mean 'fp'?
     494 |                 regs->gp = val;
         |                       ^~
         |                       fp


vim +494 arch/arc/kernel/disasm.c

   475	
   476	void __kprobes set_reg(int reg, long val, struct pt_regs *regs,
   477			struct callee_regs *cregs)
   478	{
   479		long *p;
   480	
   481	#if defined(CONFIG_ISA_ARCOMPACT)
   482		switch (reg) {
   483		case 0 ... 12:
   484			p = &regs->r0;
   485			p[-reg] = val;
   486			break;
   487		case 13 ... 25:
   488			if (cregs) {
   489				p = &cregs->r13;
   490				p[13 - reg] = val;
   491			}
   492			break;
   493		case 26:
 > 494			regs->gp = val;
   495			break;
   496		case 27:
   497			regs->fp = val;
   498			break;
   499		case 28:
   500			regs->sp = val;
   501			break;
   502		case 31:
   503			regs->blink = val;
   504			break;
   505		default:
   506			break;
   507		}
   508	#else /* CONFIG_ISA_ARCV2 */
   509		switch (reg) {
   510		case 0 ... 11:
   511			p = &regs->r0;
   512			p[reg] = val;
   513			break;
   514		case 12:
   515			regs->r12 = val;
   516			break;
   517		case 13 ... 25:
   518			if (cregs) {
   519				p = &cregs->r13;
   520				p[13 - reg] = val;
   521			}
   522			break;
   523		case 26:
   524			regs->r26 = val;
   525			break;
   526		case 27:
   527			regs->fp = val;
   528			break;
   529		case 28:
   530			regs->sp = val;
   531			break;
   532		case 30:
   533			regs->r30 = val;
   534			break;
   535		case 31:
   536			regs->blink = val;
   537			break;
   538	#ifdef CONFIG_ARC_HAS_ACCL_REGS
   539		case 58:
   540			regs->r58 = val;
   541			break;
   542		case 59:
   543			regs->r59 = val;
   544			break;
   545	#endif
   546		default:
   547			break;
   548		}
   549	#endif
   550	}
   551	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
