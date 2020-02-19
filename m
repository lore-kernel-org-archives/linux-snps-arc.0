Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39120C3404D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 08:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1094824670
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 08:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9MzBz3D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1094824670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPRi1DFZOcLvctShcQt+Uo1KbktphfYoewL82FNghfE=; b=p9MzBz3DibVCBR
	DPaitdcKqfrFpIHykKlOczp6E4WkGPz7X+1lfzGN1FNqPDBTRPL/yvTusKmWa94+v2Bpx2YOsITU3
	dLpHsm3YIf6iYDrwatLXD7XhcoIM6PWJEVJNClh3rUORnD9aKFZmYHuNWVGSvlArESTk03wm4EO++
	haB9zfLTPDJTzqIu5dBXaG+uq3mw2uni7sHVZL3MBMFr8KeNmdEI6OAGnnktsxC/hNjvicvoy0dSp
	0wdQpA/qqSsHo3XOIHkO7CqJDChh9YRocswlxGTwRA/8NLBOoiE65gd8vngKF4nVR9fwAt9JttENw
	jRaj+Z7gelQCMTRr+TLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Kl5-0005kc-63; Wed, 19 Feb 2020 08:31:03 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Kl2-0005k1-IY
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 08:31:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC701B145;
 Wed, 19 Feb 2020 08:30:57 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com>
X-Yow: World War Three can be averted by adherence to a strictly enforced
 dress code!
Date: Wed, 19 Feb 2020 09:30:56 +0100
In-Reply-To: <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com> (Vineet
 Gupta's message of "Wed, 19 Feb 2020 01:31:07 +0000")
Message-ID: <mvmimk3567z.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_003100_758858_AB33C069 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "joseph@codesourcery.com" <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Feb 19 2020, Vineet Gupta wrote:

> On 2/18/20 5:03 PM, Alistair Francis wrote:
>>>> +#define STAT_IS_KERNEL_STAT 1
>>> Isn't this irrelevant: seems to be only used for legacy __NR_stat/__NR_stat64
>>> syscalls based__xstat()/__xstat64().
>> Is it? It seems to be used in a few places, including:
>> 
>> sysdeps/unix/sysv/linux/fxstatat.c
>> sysdeps/unix/sysv/linux/xstatconv.c
>
> AFAIK that is not part of the asm-generic syscall ABI which ARC, RISCV et al use !

The latter is still included by everyone, though.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
