Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AED8C35242
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 01:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B88C20724
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 01:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PhPmIVvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B88C20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZ2Y3jZQ4OHAWFub5GHx0JCstsSb5kk/VlQDDGBMrxw=; b=PhPmIVvqPKQSKb
	583Aiq680ubiKrmUTARnG9pAKoATdEakOE3g1sqDqtwOOqCavs4MgAsK+hvkrfGuMUnuL43oEBGwo
	h5b3wkQs5ZwlvsStibsDMgGyaBk9AfQ4GfcxnEfca9poOlJLk0IXKmmTiS+qKPJ/gBKFX5tUn0Ca7
	s2Ot2C6zp+2D22BY78ixXalhhO9JPcciuEPTw3qd7Bp14COZgVyg4OD6GOEcMaXhRWc9RJEUv+TG2
	EepM9B4d4M1XT3NN/qs63DcCt5tjrSs5irPeGNZFgtvrzP6YlZUB5ec/mqJ60WKeSdIE9UBu6sHBf
	RsLC7yIcdobWizATeYIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1grr-0007x6-Hp; Wed, 12 Feb 2020 01:31:07 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1gro-0007wH-Md
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 01:31:06 +0000
IronPort-SDR: Pg1dPlDEzzq+bnZG2Ia4A9R95m7+eFTArGIej1rqFhFsnj1F0Pu4oSzpJaRtswoIA/UsnKsa78
 orIn6AuXhTfmhLce5gT8Au6Hjdf4nuqygRTL0TKEDJaJUIc/p1yFxBp3dlw/B24hDsd4zjvvBH
 5zj6iTOV56jU7DH73counzeDorcHHCVLtxSW/3nqhJ1cDaoLu778i6J3wwX9kMJ2IhxsM67vju
 xO8RiAxfIIxVkGiLSG+XnzJD7Ht5euHHkN44JvmQOar3cWtwdV08qn6T76DW+OyvAsYVv/EWij
 T6M=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="47660493"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 11 Feb 2020 17:30:54 -0800
IronPort-SDR: old77eI9xHSg2mAv4TnadrF7BJ9t8k2EXfL/eorW6ZFyGDbqV1WxO1VUWAyz+AsmDB65X1ZnO+
 B7htnpC3BvDf4QAHsGGSTBc9OIuXIh6Bbc4506BUtNV5XNFxscMfUI7BSgIeGFNkJaRP0t+T81
 eN5fL6wb9eN18Qqa2aygE3Mlj8JwIkMXe3Fip1rFUPf/0Cjydak1E0a2bCGVTwBIN0c059B6mx
 1B3VCQOXzEWXhtu0/wg9gt9vLGN9+/+YkXY4GTOHEYBM8SnkrdztzjG/TvZzLK+OLkusknE2ET
 6Gg=
Date: Wed, 12 Feb 2020 01:30:46 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
In-Reply-To: <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_173104_958693_7D400911 
X-CRM114-Status: UNSURE (   9.60  )
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
 Vineet Gupta <vineetg76@gmail.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Zong Li <zongbox@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 11 Feb 2020, Alistair Francis wrote:

> > > diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> > > new file mode 100644
> > > index 0000000000..0da3bdeb5d
> > > --- /dev/null
> > > +++ b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> >
> > I was hoping newer arches could simply use the asm-generic one ?
> 
> We need to specify that RV32 uses a 64-bit time_t. The generic ones
> don't do that for 32-bit arches.

Since it seems we'd like future 32-bit ports of glibc to use 64-bit time 
and offsets, we should make that as easy as possible.

That is, you need an RISC-V-specific bits/timesize.h.  But you shouldn't 
need an RISC-V-specific bits/typesizes.h - rather, make the linux/generic 
one do the right thing for __TIME_T_TYPE based on bits/timesize.h.  And 
have some other header that 32-bit linux/generic ports can use to say 
whether they use the 64-bit offset/stat/statfs interface, that 
bits/typesizes.h can use together with its existing __LP64__ check, and 
make the definitions of __OFF_T_TYPE etc. check that as well, and then you 
shouldn't need an RISC-V-specific bits/typesizes.h - the RISC-V-specific 
headers should be strictly minimal.  (No architecture-specific 
bits/time64.h headers should be needed in any case.)

At some point (or indeed now) we might flip the default for linux/generic 
so the architectures needing an architecture-specific header are only the 
older 32-bit linux/generic architectures that have support for 32-bit 
times and offsets, and the newer ones with no such support don't need such 
a header.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
