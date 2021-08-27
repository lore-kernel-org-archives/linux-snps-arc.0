Return-Path: <SRS0=vGok=NS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E7DC432BE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Aug 2021 01:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9CB260FD7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Aug 2021 01:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9CB260FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aubWkW99UBRYedX+1JLIVTlla4qRAc1dxrP7lOp2So=; b=QnOHj76Qf4GizhCvlQV++eNcaf
	4q3ljTZQINtaoFZtltuTZmoV4LE72rJ6EeEMQKUWlbxQuLrjxpHPrOVEmsyblbQzIaNo+T+AJjS+J
	P3YpRSXr4WrQ5IVQQIio9+os0vAr2W0RgXPb6TMp7NHILzQg4zJx1xH0KsT2+BPE7UBJ9QyFAehCv
	08B0WiURn49qEVTwRCrKJXDWloKFxbfOJB07yJFQ7cOanuX7mBpCT16mZYOF7pMOI4svAWaduQ/HM
	68obtfvVPzOW/tjboZ1Xpv+xUTWxGsRy8JOCx7fwU7kiYOUdbqx6zjeijf0oK/2K8ePF+d4aUfb/v
	9nMcchNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQSs-00BIIN-P8; Fri, 27 Aug 2021 01:15:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQN5-00BGHJ-3u
 for linux-snps-arc@lists.infradead.org; Fri, 27 Aug 2021 01:09:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0429160698;
 Fri, 27 Aug 2021 01:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630026566;
 bh=XwuUCQSEDzl5nlvr8LUNjMZUBVFQB2QvKB3zGRKthP8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oiVgDzQEu/BViUr/MOnxQQSvPy+xqpouo1xJAxr5AlaxI5Qg9KGAFGljDa5h80qqG
 bCUnU/FFFFTgp4KCP+i9vGOMBlxzz4CpgF74yO6ic/vI9xyf4lVahbBwi+WmR7K6oh
 FIWQF9S1UZuG7jog4lqzrD6EtsWmkghYm3piAfwrMUNAD653vjsFs75TucfKBr0jst
 leEzIMgAT1JOccz5h7jGw7QpBYkkVVZ1izT3JHBo/k/QPqyekQkl9ayqRoyWV7cunr
 owvZXlaMP1SwQ5AObTuHN1VEs1o0rh2iyWh2A9ER75/rTM2OpqYXtdg6q+t2n+oeH/
 Bmqd60xkfrD5A==
Subject: Re: [arc:for-next 29/33] arch/arc/include/asm/page.h:52:30: error:
 'struct page' has no member named 'pte'; did you mean 'ptl'?
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
References: <202108261644.ZyrrjSub-lkp@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <07db0892-1c6a-6461-400b-c928e34d2f41@kernel.org>
Date: Thu, 26 Aug 2021 18:09:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108261644.ZyrrjSub-lkp@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_180927_246883_0CC52302 
X-CRM114-Status: GOOD (  14.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 8/26/21 1:35 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-next
> head:   c80ef1151c91db05e9ed03d7b61ada7af63ce59a
> commit: 4058fa6bf4da7f46a57cb33fe8f6b688052b3eb9 [29/33] ARC: mm: switch pgtable_t back to struct page *
> config: arc-allyesconfig (attached as .config)
> compiler: arceb-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/commit/?id=4058fa6bf4da7f46a57cb33fe8f6b688052b3eb9
>          git remote add arc https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
>          git fetch --no-tags arc for-next
>          git checkout 4058fa6bf4da7f46a57cb33fe8f6b688052b3eb9
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     arch/arc/mm/tlb.c:392:6: warning: no previous prototype for 'create_tlb' [-Wmissing-prototypes]
>       392 | void create_tlb(struct vm_area_struct *vma, unsigned long vaddr, pte_t *ptep)
>           |      ^~~~~~~~~~
>     In file included from include/linux/mm_types_task.h:16,
>                      from include/linux/mm_types.h:5,
>                      from include/linux/buildid.h:5,
>                      from include/linux/module.h:14,
>                      from arch/arc/mm/tlb.c:9:
>     arch/arc/mm/tlb.c: In function 'pgtable_trans_huge_withdraw':
>>> arch/arc/include/asm/page.h:52:30: error: 'struct page' has no member named 'pte'; did you mean 'ptl'?
>        52 | #define pte_val(x)      ((x).pte)
>           |                              ^~~
>     arch/arc/mm/tlb.c:568:9: note: in expansion of macro 'pte_val'
>       568 |         pte_val(pgtable[0]) = 0;
>           |         ^~~~~~~
>>> arch/arc/include/asm/page.h:52:30: error: 'struct page' has no member named 'pte'; did you mean 'ptl'?
>        52 | #define pte_val(x)      ((x).pte)
>           |                              ^~~
>     arch/arc/mm/tlb.c:569:9: note: in expansion of macro 'pte_val'
>       569 |         pte_val(pgtable[1]) = 0;
>           |         ^~~~~~~
>     arch/arc/mm/tlb.c: At top level:
>     arch/arc/mm/tlb.c:756:6: warning: no previous prototype for 'do_tlb_overlap_fault' [-Wmissing-prototypes]
>       756 | void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
>           |      ^~~~~~~~~~~~~~~~~~~~


Thx for the report. I've fixed this up by removing the now not-needed 
__HAVE_ARCH_PGTABLE_DEPOSIT and __HAVE_ARCH_PGTABLE_WITHDRAW from ARC code.

-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
