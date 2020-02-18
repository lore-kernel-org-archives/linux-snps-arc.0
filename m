Return-Path: <SRS0=r7t1=4G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5DDC34031
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Feb 2020 23:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B1424125
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Feb 2020 23:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCBa0LuT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B1424125
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrP9h6uFRIuMvWyTPdr7MOAvxVCak/dvMBINdcZMPwk=; b=FCBa0LuTnwnPPI
	fyh/4r/sN78HRauChu5OLcsos9lZk0devTFjQ+OdFwvPEl1UmckG+UJGAYoNV9fKf8HxtzqFVUOfM
	8tpSc3gLf0XMY+pfqNhn3sqnSrjMyI1rSBFCW3/0EvHtYXDei3y0Fp9cLDdnuQOkQp59R7+Poa78c
	w6cAV7wif80Yu3r5SPYwNT93wqVBJ8ZadkCrnM1LO2zC9xrK70dMcOQCz09EOFZx9ke8PH63KtBMo
	KQzLgC69thwZ5oRBWDFjGkXY2as+qo5ec6MU4LuhzYvMUPXtdvCjmZ7z+BzbdA/9i1a7PP57/vP7f
	vBVaGbOM7hUqtmQJjyvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4C3r-000439-P8; Tue, 18 Feb 2020 23:13:51 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4C3o-00042c-O0
 for linux-snps-arc@lists.infradead.org; Tue, 18 Feb 2020 23:13:50 +0000
IronPort-SDR: pjSFk3kLbx8gaVAaWxVAxSPA90oIkGZmEtJUoPkzJrY0cjApSU+lH39DCAc/Mz+51YzSI2iwu4
 GL4tff+OtDM1iNxVtiNwf6AzO1d9ZkyWNq0sQ72fVqkUIU6a6ZgLBvWooGpeoDDvWZHNcfdHlo
 hxg8z4YL8ISwfYpNSBI2J4tvnm/3A9I7PdMhs9Tj3Y7VLzuIuMCPTZ4f/Lq6PxXJEV2lveO0Ek
 qZg1WM1orpOkgEnQ4U37tzhWIzm7skLn9C+mVr7Nxj+GoqLKNHKv8HZcp/sd3Grepl7TueYh/J
 Gh4=
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="45953342"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 18 Feb 2020 15:13:45 -0800
IronPort-SDR: 885qo12RWYNMhCqMBkJGq7TRK5FPsNDz1xE3c4njqeVyum/TqY2iSUD3DU7Uj98oPjOMW0Cz7v
 4qBNOjBZMYKlmrNyjF4QTyJLxgLBW6XAdHrA5gJYjd2kkwVzeOauHRWRdk/8sNgsk+udlwsg4q
 7CBHFPzsl3FY+v3NcwyVH4yKnLZB22gPuZPXbehYVg3T/cgHTwsq8l7v4lW5GsctQKD8Oa6G28
 QA4cemS8NMdKP2bDUJBMzYz6Q0H/nCXE0dCSIZwmSV4/u8Jf2COplkXAdDivicmLPl0H4v9lJ0
 gUQ=
Date: Tue, 18 Feb 2020 23:13:38 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
In-Reply-To: <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
Message-ID: <alpine.DEB.2.21.2002182310580.8620@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_151348_830398_77B550A2 
X-CRM114-Status: UNSURE (   4.54  )
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
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 18 Feb 2020, Vineet Gupta wrote:

> An the reason this all works on RISCV is that your kernel doesn't define
> __ARCH_WANT_STAT64 -> lacks __NR_statat64 and instead uses the statx call which
> does itemized copy and would work fine when copying from 32-bits time (in kernel)
> to 64-bits container in glibc. Is this is right understanding or am I missing
> something here.

That looks right - so you'll need a way (e.g. a new macro in 
kernel_stat.h) to tell the stat implementations to use the statx path even 
though the older stat64 syscalls exist.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
