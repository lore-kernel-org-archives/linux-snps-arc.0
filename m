Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8025FC35DEA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 00:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362DC2072D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 00:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aING1IJE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362DC2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Gy5s1bCnYihWWIYgJn1nTwjbnmTtPdAbZwX3IXfqJA=; b=aING1IJEXlhCk+
	6rmLUhoDDIZ6/fPCH58ZrglweObCGI6LRJn6qcZxCtv8DkuvDLM22B8a+32AV2kiT+o5YH0KkI2e8
	5HPzcno38bM8EWD3qU+HYoXGSgSA8DJ9dBT1AoawMrU/TpDglOdqnBUScP7NOyZCZX+w8J5IOg1b5
	vFD0ZunXQ2Z8GijFFwhxdZ/cb0FHIAB74H6n4IlrL8UWnOZIOAjHzXt3PWzZxh7ypTuujpXzczHa0
	Gr7d/4Y6/NE8L9bhcr7fn+NWdOYeWqrCXqkVW4aLlq6gS4hj5td7m9mAXkaw9m3rvVdK0b4+xy8HY
	WJuM1odmBqLlhoa6Ki8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Nht-0005Gd-Bl; Tue, 25 Feb 2020 00:04:13 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Nhp-0005G6-V3
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 00:04:11 +0000
IronPort-SDR: hhkvcLtAFim5YKhggiemZwi+w6TrAEnBvgAQMhWXAWAjGbe4F++Jlim4k6r530wQyceOQZtv/c
 oAr4MNnr/LtI4i5Qbow265FhDjXSxa5c32wOBnKaeAssGePDOfeHPvbIV0iOdxeVWxFmLIacmw
 1l3MJS398ESDBCAfQ3EK8v/a3WoTtSvvHDjWHM7w5Yu/PFHMiEASDrhmCa/kSCclwFnDw2Sc2V
 Avtsfh98m5gPjL0J3nO6jVCh5I6MhRMV98y5UCqTp18lz6WmXIroNVlZhOs3xq+nVi1EalG6HJ
 yAs=
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; d="scan'208";a="46123397"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 24 Feb 2020 16:04:07 -0800
IronPort-SDR: en83gkNC0NvRDkCpKhlJcHTftcldTkcWCVlBfpzCC1jXGT0qVoUC9QdrAnCh6pyAjX9Wq6MIEa
 5Uj1/mHsnYgCdWMyMF5GSOTbz3WPbJTiBvV0vVfpLyuOE7qlthMJF+f/CJfVn4Hfv4f7BaDqLc
 VOFZVgG1aRbCw0KP0O7Kcg0HYEDSC5efk3tQ4upjHVSIqc4BgTCtkhWsvtrNYcVQm12b11kSOb
 8gycgOlAoKmc3p/f23+DcfyjoUUknTyWlHJdavZWS3/lajoIdr/s+5rF6jLMYQHEoIJodjjZzL
 gB0=
Date: Tue, 25 Feb 2020 00:03:59 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
In-Reply-To: <20200224113658.275ea702@jawa>
Message-ID: <alpine.DEB.2.21.2002242353570.23654@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
 <20200224100051.2511d797@jawa> <mvmpne4xqpb.fsf@suse.de>
 <20200224111424.33759b2e@jawa> <mvmh7zgxozs.fsf@suse.de>
 <20200224113658.275ea702@jawa>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_160410_032523_A8BEF80C 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Andreas Schwab <schwab@suse.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Helmut Grohne <helmutg@debian.org>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 24 Feb 2020, Lukasz Majewski wrote:

> I'm probably not aware of something - but as done in the following
> patch:
> 
> https://github.com/lmajewski/y2038_glibc/commit/c96eeb73175961c4ac80fdd3b6adc132805387c9
> 
> I do need to remove librt_hidden_proto / librt_hidden_def to have
> proper symbols visible when I do want to use redirections.

You'll need to explain the actual problem you see, because 
lib<name>_hidden_proto / lib<name>_hidden_def are correct for any symbol 
that satisfies both of the following properties: (a) it is exported from 
shared lib<name> (whether at a public symbol version or version 
GLIBC_PRIVATE) and (b) it is also used within the library that defines it.  
They are useless but harmless for other symbols.

lib<name>_hidden_proto / lib<name>_hidden_def always need to be used 
together, and always need to have <name> matching the name of the shared 
library with the symbol.  In C code, lib<name>_hidden_proto causes the 
function, for both definition and calls, to be redirected to an internal, 
hidden-visibility alias, while lib<name>_hidden_def then adds back the 
exported name as a non-hidden alias to cause it to be exported from the 
shared library in question.

It's true that the redirection from lib<name>_hidden_proto doesn't work 
when there is another redirection for the same symbol in effect, but that 
should not be a concern here (there should be no reason to have an asm 
redirection from __mq_timedreceive_time64 to another name, for example).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
