Return-Path: <SRS0=Hn5+=NE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4EBC4338F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 14:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593A46103A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 14:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 593A46103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dINw7ugqpw6Vd1jEJSOFkIhiLS/yavt1NCA37Y7VUxQ=; b=kG2D5yshO2PywFH3rCcuPOIGuU
	78Vvalxp4M/iRbr1VWWs2FTJsrauVw56QWTs6JeJwjfjPCBAxOmiKcBPsn+E4Mw0Ftr8c62KGa2JP
	4D+ovxnolE5QTA0IcU5uFl1XAiisUE7x/E6ZfTMbIdVmvn0E8VED9fwH7Q4rUdIz9XgL8MOgF9uop
	9pkfzaMKUv/dZjQJiiYnYg2As6LC+4+GpF2jmQkvsgqEy/byajnUQuHCsZKZqhgswyri3jzFIw8Gw
	SsQ7UzVGSJzJW4ypgvsD9WgjyBoID0RvHqGt3SrLZ8L05Onod/8wCY6MXSa2WS5QskpNyj3AAoCke
	p8Uxi6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEY7o-00CmSn-Tc; Fri, 13 Aug 2021 14:25:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEY7i-00CmRu-Rq
 for linux-snps-arc@lists.infradead.org; Fri, 13 Aug 2021 14:25:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7090F6103A;
 Fri, 13 Aug 2021 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628864723;
 bh=Pg8/Icgmmh9tdB5PBuJn/UBvXusnIC9tMqOURN6zA60=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iVTBeYI4OabSa6AWUh+yTGkBmA9jepG4TryvcTBebSyw0bdh7EYT+MvDTKsABAHWm
 9mWt7pSuszxRt7jQ5MpIBDuB735HL7iG0sngemdgSqnCf38hlnYXh9B1NbanT6twj/
 2JA9u0BDi0APPw3S3gPf2eYII6SSr58eJN1XB+h4bqlBgofm3U876V4jR8YImvosTq
 vDIpiRlzXptm9Gf4Z35aEBmw4U8Gmwx14R3agZ5qoyMnXNTkhX0uisUfHIqJUNG4v8
 1/q96YaNdvZRSC2pI7c03ceOQYShz69Uzyf1pDUimU8V54oQijYrRZcjT5JOW3Czyw
 LkLhCO/7BWqqQ==
Subject: Re: [PATCH v2 08/19] ARC: mm: switch pgtable_t back to struct page *
To: kernel test robot <lkp@intel.com>, linux-snps-arc@lists.infradead.org
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>
References: <20210812233753.104217-9-vgupta@kernel.org>
 <202108131844.wJYo94q5-lkp@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <ac88a90f-ca2e-4ba7-0eb5-cf1d1250f304@kernel.org>
Date: Fri, 13 Aug 2021 07:25:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108131844.wJYo94q5-lkp@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_072527_006496_9A58EA80 
X-CRM114-Status: GOOD (  19.31  )
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

On 8/13/21 3:45 AM, kernel test robot wrote:
> Hi Vineet,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on arc/for-next]
> [also build test ERROR on linux/master linus/master v5.14-rc5 next-20210812]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Vineet-Gupta/ARC-mm-updates-support-3-4-levels-and-asm-generic-pgalloc/20210813-074023
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-next
> config: arc-randconfig-s032-20210812 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 10.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # apt-get install sparse
>          # sparse version: v0.6.3-348-gf0e6938b-dirty
>          # https://github.com/0day-ci/linux/commit/36e618e081c5a49b2aff51823c5f012045e902ef
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Vineet-Gupta/ARC-mm-updates-support-3-4-levels-and-asm-generic-pgalloc/20210813-074023
>          git checkout 36e618e081c5a49b2aff51823c5f012045e902ef
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     arch/arc/mm/init.c:35:13: warning: no previous prototype for 'arc_get_mem_sz' [-Wmissing-prototypes]
>        35 | long __init arc_get_mem_sz(void)
>           |             ^~~~~~~~~~~~~~
>     arch/arc/mm/init.c:88:13: warning: no previous prototype for 'setup_arch_memory' [-Wmissing-prototypes]
>        88 | void __init setup_arch_memory(void)
>           |             ^~~~~~~~~~~~~~~~~
>     In file included from <command-line>:
>     arch/arc/mm/init.c: In function 'mem_init':
>>> include/linux/compiler_types.h:328:38: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON failed: (PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE
>       328 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |                                      ^
>     include/linux/compiler_types.h:309:4: note: in definition of macro '__compiletime_assert'
>       309 |    prefix ## suffix();    \
>           |    ^~~~~~
>     include/linux/compiler_types.h:328:2: note: in expansion of macro '_compiletime_assert'
>       328 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |  ^~~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>        39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>           |                                     ^~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>        50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>           |  ^~~~~~~~~~~~~~~~
>     arch/arc/mm/init.c:193:2: note: in expansion of macro 'BUILD_BUG_ON'
>       193 |  BUILD_BUG_ON((PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE);
>           |  ^~~~~~~~~~~~
>

Thx for the report. This is 4K page config, where PGDIR_SHIFT 21 causes 
32-21 = 11 bits or 2k entries which won't fit in 4k page.
I've added the fix and added Tested-by.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
