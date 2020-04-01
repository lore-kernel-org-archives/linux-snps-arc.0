Return-Path: <SRS0=CVFw=5R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481B0C43331
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 17:06:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1076F20719
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 17:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XrWDk78O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1076F20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLivwq+nH5IMd6n2SCA1zhLZ3P1smLnpEdJsD0UjuCc=; b=XrWDk78OF/UaLf
	YaJiQuDIxAZBfwGR0V0WNDrxxD2TnHN0YZr8jWLCPp0aou6nOcle4QdTspoS7uK+7RKQy3FV1TfJL
	GGiDKReDT9hlQte5QeidaGbJr6mwNSwTABrCdgCMo0AFpaj7mBrcI0HPfAAgXbRe4biWryo9fXT8B
	veVA/Bot41wdpzlR4nfwpK6X4DfEvLPBFEVGiGOlj36e2+1TjXz8HY4jVqVKNfB/jGst5ugIKyLY1
	Ydo17q2frFp76MTlKXKxsZKUsr2m36yLJl1fEWh9Ix8zzm000aH8WbPYBDp52at5+amht40gyYlMn
	rch9K++7MvwHTnEohkrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJgor-0005vI-2u; Wed, 01 Apr 2020 17:06:25 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJgon-0005uq-Sw
 for linux-snps-arc@lists.infradead.org; Wed, 01 Apr 2020 17:06:23 +0000
IronPort-SDR: 8tnEx4hiq6gg1Z/gNEs3xSX1izyEdkAOmpdlRVf5QW6M6aaQBiRS8UKceZO1OazbcOq8VQi1eI
 +07U2VR9yK4niJaj8O5w2rn0ChXk5ix37ZUwCZS+trQTr3N/wEEjYQiBvVioqvUC30xduUJwqL
 HShNbJqix/024STxz2YkTaz2uHTbjPmfqqP/l0PlImS157hC94KAAiQMwjzor57i/C4Ag+Em3g
 5zfdIJKif54i6EICP+QMg+n6A1CPrt1/5Y6BsAct2Lp2J9SYKPR8kO9qUCisIntwbJJq7RoDea
 qK0=
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; d="scan'208";a="49317636"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 01 Apr 2020 09:06:21 -0800
IronPort-SDR: qLkTvFmBKSTJSPBRIHjuTBGan1xEaKoyY4KTiZXvQ1S0Agysb600uRTc9saS5ZsxAzCmX6ImGP
 1WaWFkrhINMYnBrRhYvYWwKBNnGLPlDcurBRbEc1ZbV80kT7sJ96djCtigG0DVBN9V3p+O2eyi
 o+On/TJdTDJiud6ngXW61ahw1375S6RcW3CoXnjr2d4lK9gUY+3PSXFNsk93or1N026Cn+oAnU
 67FssiXSNRCWvyNdV2r3S1CA+z50uP2s22Qep1LxWFqZ0KyS56bto8yk5acDr89WeUvCa92smN
 kdg=
Date: Wed, 1 Apr 2020 17:06:16 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
In-Reply-To: <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004011703160.3007@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
 <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
 <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_100621_932919_22643568 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 1 Apr 2020, Vineet Gupta via Libc-alpha wrote:

> > If there's an inline function referring to this in an installed header, we 
> > can consider whether that inline function *should* be referring to it.  
> > Similarly if there's a reference in crt*.o / lib*_nonshared.a / GCC static 
> > libraries, we can consider if that reference *should* be there or if the 
> > function in question should actually be calling some function from libc.so 
> > that does the syscall there.
> 
> The assembler macros in syscall template for generating wrappers use
> __syscall_error (sysdeps/unix/sysv/linux/arc/sysdep.h).

That's an internal header.  It might be included in code used in crt*.o / 
lib*_nonshared.a, but can't be included from any installed header, so 
can't result in references in inline functions from installed headers.

> If public Version is removed, I get errors like below:

What if you move it to GLIBC_PRIVATE?  My concern isn't that it's exported 
from the shared library, it's that it's exported at a public version.

A public version is only needed if there are references in code that might 
be statically linked into user binaries that use shared libc.  Which means 
the symbol being used in some .o or .a file that gets linked into user 
binaries in that case (crt*.o, lib*_nonshared.a).  You can examine the 
symbols used by such objects after building and installing glibc.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
