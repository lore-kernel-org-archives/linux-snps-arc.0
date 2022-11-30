Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7444EC433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Nov 2022 02:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+XbB1Uf0zfWNyrO6o20LQMIPnrl1DtAwYuTZ7KWjrA=; b=TCK8F41T9SFjht
	IA16pRRFJduTxLkYLEhmGXAfXDiKwLWN5j2m6BIOHPiSjMJc/nIw5TEiF2CsuN8hBTudC8QdHTNsX
	6K/sFZa4VV3I06kH8xHXP9ml74d7veBJCk9qkbLMAuGoamb9BVbDowB5JJMaeMLaOW1luvNCiCPuv
	6vFzgIdhKiXX3PYIR+ohWK2pLWU5uwOSOzpzwNUPAs6maRw2G1Fwy7YLH6kAE5GOmrWdXlCoZr5Aw
	5J/krS3cnOIkWStE3FJTYFbLaN4pH6L95AT6leKemoz/EKtjkyK8Bva3WDCAzvDyxW0FU4dHxDXha
	RB8i2DVLM1qWtk9NQGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CZm-00C3sj-5n; Wed, 30 Nov 2022 02:11:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CZi-00C3pX-LZ
	for linux-snps-arc@lists.infradead.org; Wed, 30 Nov 2022 02:11:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CF28619C5;
	Wed, 30 Nov 2022 02:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787A4C433D6;
	Wed, 30 Nov 2022 02:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1669774309; bh=+dsU6B0X3QmIi62LjjOeC3RcTi6Ig940qG5GPhiE1OQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rPuCJ9+A4pF7isWN4Dy0tubWY1FVpMApBY9F60qAtp1v2y3bcCmoSnb8FYSUBnkID
	 u9A6odnE1nRGk8GuolucCzK41Ma//QFFZ3Awq+P7jznxxMCDTLlOgmHTcOOcBR4CgG
	 MtPb0C67o5Bfd3TdOIMj11+eKmuK9uIdqmeL3UVU=
Message-ID: <09e0e231-e5f9-d357-ed95-31ac6fb4932b@linux.dev>
Date: Tue, 29 Nov 2022 18:11:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/2] ARC: update definitions in elf/elf.h
Content-Language: en-US
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>, libc-alpha@sourceware.org
Cc: Florian Weimer <fweimer@redhat.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <20221127173825.3106-1-shahab@synopsys.com>
 <20221127173825.3106-3-shahab@synopsys.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <20221127173825.3106-3-shahab@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_181150_812708_DED41914 
X-CRM114-Status: GOOD (  17.04  )
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

On 11/27/22 09:38, Shahab Vahedi via Libc-alpha wrote:
> While porting ARCv2 to elfutils [1], it was brought up that the
> necessary changes to the project's libelf/elf.h must come from
> glibc, because they sync it from glibc [2].  Therefore, this patch
> is to update ARC entries in elf/elf.h.
> 
> The majority of the update is about adding new definitions,
> specially for the relocations.  However, there is one rename, one
> deletion, and one change:
> 
> - R_ARC_JUMP_SLOT renamed to R_ARC_JMP_SLOT to match binutils.
> - R_ARC_B26 removed because it is unused and deprecated.
> - R_ARC_TLS_DTPOFF_S9 changed from 0x4a to the correct value 0x49.
> 
> Finally, a specific SHT class for ARC has been added to glibcelf.py.
> Else, it would result in a collision:
> 
>    _register_elf_h(Sht, ranges=True,
>   File "/src/glibc/scripts/glibcelf.py", line x, in _register_elf_h
>     raise ValueError('duplicate value {}: {}, {}'.format(
>                      ValueError: duplicate value 1879048193:
>                      SHT_ARC_ATTRIBUTES, SHT_X86_64_UNWIND
> 
> [1]
> https://sourceware.org/pipermail/elfutils-devel/2022q4/005530.html
> 
> [2]
> https://sourceware.org/pipermail/elfutils-devel/2022q4/005548.html
> 
> No regression has been observed after applying this patch.  Below
> follows the result:
> 
> UNSUPPORTED: crypt/cert
> UNSUPPORTED: elf/tst-audit22
> FAIL: elf/tst-audit25a
> FAIL: elf/tst-audit25b
> FAIL: elf/tst-bz15311
> FAIL: elf/tst-bz28937
> FAIL: elf/tst-dlmopen4
> UNSUPPORTED: elf/tst-dlopen-self-container
> UNSUPPORTED: elf/tst-dlopen-tlsmodid-container
> UNSUPPORTED: elf/tst-glibc-hwcaps-prepend-cache
> UNSUPPORTED: elf/tst-ldconfig-bad-aux-cache
> UNSUPPORTED: elf/tst-ldconfig-ld_so_conf-update
> UNSUPPORTED: elf/tst-pldd
> UNSUPPORTED: elf/tst-preload-pthread-libc
> XPASS: elf/tst-protected1a
> XPASS: elf/tst-protected1b
> FAIL: elf/tst-tls-allocation-failure-static-patched
> FAIL: elf/tst-tls1
> FAIL: elf/tst-tls3
> FAIL: elf/tst-tlsalign-extern
> UNSUPPORTED: elf/tst-valgrind-smoke
> UNSUPPORTED: grp/tst-initgroups1
> UNSUPPORTED: grp/tst-initgroups2
> UNSUPPORTED: io/tst-getcwd-smallbuff
> UNSUPPORTED: locale/tst-localedef-path-norm
> FAIL: localedata/sort-test
> UNSUPPORTED: localedata/tst-localedef-hardlinks
> FAIL: malloc/tst-malloc-thread-fail-malloc-check
> FAIL: malloc/tst-malloc_info-malloc-check
> UNSUPPORTED: math/test-fesetexcept-traps
> UNSUPPORTED: math/test-fexcept-traps
> UNSUPPORTED: math/test-nearbyint-except
> UNSUPPORTED: math/test-nearbyint-except-2
> UNSUPPORTED: misc/tst-adjtimex
> UNSUPPORTED: misc/tst-clock_adjtime
> FAIL: misc/tst-misalign-clone
> FAIL: misc/tst-misalign-clone-internal
> UNSUPPORTED: misc/tst-ntp_adjtime
> UNSUPPORTED: misc/tst-pkey
> UNSUPPORTED: misc/tst-rseq
> UNSUPPORTED: misc/tst-rseq-disable
> UNSUPPORTED: misc/tst-syslog
> UNSUPPORTED: misc/tst-ttyname
> FAIL: nptl/test-cond-printers
> FAIL: nptl/test-condattr-printers
> FAIL: nptl/test-mutex-printers
> FAIL: nptl/test-mutexattr-printers
> FAIL: nptl/test-rwlock-printers
> FAIL: nptl/test-rwlockattr-printers
> UNSUPPORTED: nptl/tst-pthread-gdb-attach
> UNSUPPORTED: nptl/tst-pthread-gdb-attach-static
> UNSUPPORTED: nptl/tst-pthread-getattr
> UNSUPPORTED: nptl/tst-rseq-nptl
> UNSUPPORTED: nss/tst-nss-compat1
> UNSUPPORTED: nss/tst-nss-db-endgrent
> UNSUPPORTED: nss/tst-nss-db-endpwent
> UNSUPPORTED: nss/tst-nss-files-hosts-long
> UNSUPPORTED: nss/tst-nss-gai-actions
> UNSUPPORTED: nss/tst-nss-test3
> UNSUPPORTED: nss/tst-reload1
> UNSUPPORTED: nss/tst-reload2
> UNSUPPORTED: posix/bug-ga2
> UNSUPPORTED: posix/bug-ga2-mem
> FAIL: posix/globtest
> UNSUPPORTED: posix/tst-vfork3
> UNSUPPORTED: posix/tst-vfork3-mem
> UNSUPPORTED: resolv/mtrace-tst-leaks2
> UNSUPPORTED: resolv/tst-leaks2
> UNSUPPORTED: resolv/tst-resolv-ai_idn
> UNSUPPORTED: resolv/tst-resolv-ai_idn-latin1
> UNSUPPORTED: resolv/tst-resolv-res_init
> UNSUPPORTED: resolv/tst-resolv-res_init-thread
> UNSUPPORTED: rt/tst-bz28213
> UNSUPPORTED: rt/tst-mqueue1
> UNSUPPORTED: rt/tst-mqueue10
> UNSUPPORTED: rt/tst-mqueue2
> UNSUPPORTED: rt/tst-mqueue3
> UNSUPPORTED: rt/tst-mqueue4
> UNSUPPORTED: rt/tst-mqueue5
> UNSUPPORTED: rt/tst-mqueue6
> UNSUPPORTED: rt/tst-mqueue8
> UNSUPPORTED: rt/tst-mqueue8x
> UNSUPPORTED: rt/tst-mqueue9
> UNSUPPORTED: stdlib/test-bz22786
> UNSUPPORTED: stdlib/tst-system
> UNSUPPORTED: string/test-bcopy
> UNSUPPORTED: string/test-memmove
> UNSUPPORTED: string/tst-memmove-overflow
> UNSUPPORTED: string/tst-strerror
> UNSUPPORTED: string/tst-strsignal
> UNSUPPORTED: time/tst-clock_settime
> UNSUPPORTED: time/tst-settimeofday
> Summary of test results:
>       21 FAIL
>     4184 PASS
>       69 UNSUPPORTED
>       16 XFAIL
>        2 XPASS
> 
> Signed-off-by: Shahab Vahedi<shahab@synopsys.com>
> ---

Committed !

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
