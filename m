Return-Path: <SRS0=Hn5+=NE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71829C432BE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 14:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363A360F36
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 14:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 363A360F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtuPsIEAnPtQ0CokdVQ6yfV5noI7FGAqDlhcVs2FHIs=; b=bO5XtCmKeX7YoENOnWaCMFfiEM
	E7yd8tBM5jpZoHffk9x2XGHx+khTFMUQtOZTEMulCaZEkwBacymnndByt2ed2j6GMPfv2UeQtbTLO
	MGS4U56qkok+USWl02uHUPbIs5Jcb+tvQ1FgLPOu1LpZ9H5GStmSjVmxXSUxY1t1lvRnp763suFw/
	OkDymMXZF3nwlgW/XUX7fijgdA8Y95rmF8nOuL6qPOI0ddXMpAs0PoWB++iN4kTiBG0TA6vGBeipe
	QtCpOYVHqbzl1c1kIgS3xvNh26PDjlWxO2PbfsVuBAyn8JxcXhqz4+MKXC74RuW6aY5qtwbgNYuHE
	dA9zgGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEYTh-00Cqgj-Ok; Fri, 13 Aug 2021 14:48:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEYTc-00CqfB-Nu
 for linux-snps-arc@lists.infradead.org; Fri, 13 Aug 2021 14:48:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1156860F00;
 Fri, 13 Aug 2021 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628866083;
 bh=d0uhs55zTotKZsxm5M4Qposmy5Z1i6/X47n3w9NOB9s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NIM/x/+NU8M/txOQrL/XLVJ4ndJ9oZ8aWwjFpHJmalXdzxO+QM6dtczZUr08WgN3L
 iY1EmRJOZduObH05rMN857uH8v4keBD+iEFBZx7Q7CE8gzLq4Rs45aIrEia3AzOPk5
 0RoeWODcFboNlhHSLDX6g1zfa/OO3ukhhs6Scyyd2V2g5CHMb+3dstf4QRzqdLAoy3
 ESA5yToWyWmZ++gQ4mnQKjrDSAmMkh5eeKOW0luy+uZv9tesGIQGL4J9CXOKR8b7mq
 4dFV5WdDOpVHsuPdYbuNiEviEj81Du8gzFZ3c1WiU6KQKVsOnz5sMPEFV95rBoWsmX
 0Qq71LFHHjqTw==
Subject: Re: [PATCH v2 13/19] ARC: mm: disintegrate mmu.h (arcv2 bits out)
To: kernel test robot <lkp@intel.com>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>
References: <20210812233753.104217-14-vgupta@kernel.org>
 <202108131142.NfJFd0gO-lkp@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <99d09d5f-0655-18bf-54ac-27914a42aace@kernel.org>
Date: Fri, 13 Aug 2021 07:48:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108131142.NfJFd0gO-lkp@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_074804_840257_D111DBF2 
X-CRM114-Status: GOOD (  18.81  )
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

On 8/12/21 9:01 PM, kernel test robot wrote:
> Hi Vineet,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on arc/for-next]
> [also build test ERROR on next-20210812]
> [cannot apply to linux/master linus/master v5.14-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:https://github.com/0day-ci/linux/commits/Vineet-Gupta/ARC-mm-updates-support-3-4-levels-and-asm-generic-pgalloc/20210813-074023
> base:https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git  for-next
> config: arc-allyesconfig (attached as .config)
> compiler: arceb-elf-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>          wgethttps://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross  -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          #https://github.com/0day-ci/linux/commit/0411d3a95cb73722d026f7b3d9c9d8abab8c0d79
>          git remote add linux-reviewhttps://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Vineet-Gupta/ARC-mm-updates-support-3-4-levels-and-asm-generic-pgalloc/20210813-074023
>          git checkout 0411d3a95cb73722d026f7b3d9c9d8abab8c0d79
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=arc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot<lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     In file included from arch/arc/include/asm/mmu.h:19,
>                      from include/linux/mm_types.h:19,
>                      from include/linux/buildid.h:5,
>                      from include/linux/module.h:14,
>                      from lib/test_bitops.c:9:
>>> arch/arc/include/asm/mmu-arcv2.h:80:1: error: 'inline' is not at beginning of declaration [-Werror=old-style-declaration]
>        80 | static void inline mmu_setup_asid(struct mm_struct *mm, unsigned long asid)
>           | ^~~~~~
>     arch/arc/include/asm/mmu-arcv2.h:85:1: error: 'inline' is not at beginning of declaration [-Werror=old-style-declaration]
>        85 | static void inline mmu_setup_pgd(struct mm_struct *mm, void *pgd)
>           | ^~~~~~
>     cc1: all warnings being treated as errors

Strange my gcc11 is not tripping on this snafu. Fixed now.
Thx for the report as always.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
