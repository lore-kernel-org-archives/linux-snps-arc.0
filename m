Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BC2C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 22:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34E121973
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 22:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPWjEjzD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34E121973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agKUK4mfv80knvyQdX7SSHWJWdpRv20swEvTpoDF1qk=; b=iPWjEjzD3JkS5b
	jBAFHtGDboAKE8HqoPQaRY40XWswxCU6tVekZZqYsHgu8LzIVCrupC6bMikQZJAxXHrvjlLckgUTa
	QLbsWUlXgvetMIp7GcJ6HejZuuAuvJL8tNqW5fo8+3GeV3LbScp6hV2Nz+Bw8gybjzL3IwhWCVkJ1
	UKIL9TYHTntkAPWBuc65O1ZJ1B+7FSkG3HeKlcSQhAtU7+8GOODAKL9CDnK49aGBD4xu3V+6dmrm0
	N40Mdjdkd43+Din+i895/ykxPvd22/zct+WAfpT4miA95cEB9WMkJ+CIXVxhu8TSM5PUqE6KZ+5/i
	3bjtrIgbW+2TdbLvJsIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJPgk-0004h3-KG; Tue, 31 Mar 2020 22:48:54 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJPgh-0004gh-NR
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 22:48:53 +0000
IronPort-SDR: tYJz9spi1mJk7wteFImTknd1ujtrS0rb+ATFOTMVuv92LWVhz826AxI5m2WhnAvPC0cX2Nxg3/
 Ij5x5GvsWDbMa0FOx0faA/JEgEa0WVQxqV9RJYbL5F2mG2FFTlfzlQERypJBCb4sINi005xYiH
 hvAnSnt3JIwukpPYHOCHmXWPR7zsN5l3bVGjO7VEION5LKiumBCbZh59nIOwdfdvTt9l2V9caD
 gdT/jeK5PUqHt9NtwO1mAeBbPSsXApRi1uq0pQ+xpiNLMUUGdBHvTTWTG5Mmo+8EKj7CyCa8Q9
 fWI=
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; d="scan'208";a="47364549"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 14:48:37 -0800
IronPort-SDR: v+dUoPbB/+soc++JNLW2sCL6u+R8Ikses9tc6EW1icxIrAqYRovvzdFu79RPn6SH02TNbRGgZa
 WCEhT24B4m52hC598lH3BR1+tXAHZnWvCvfE4qM+QIhasYFTC+uE2MMsMZNGd+eLOBvoh5Sqae
 fT5XBh/9bAaA7jAuNUniiB9XKKPT5DIIaFDwqdpDdPnQaKhDi6bzteJrd1W4PAyAA6USugewf9
 ShBrBpw/AVCyLjJowF96S93oVvRzmOi6R6NEqitV1bOiznHTF9OqTR8EwRqvPCsxQyPZtgiVpD
 sTg=
Date: Tue, 31 Mar 2020 22:48:31 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 13/15] ARC: Build Infrastructure
In-Reply-To: <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_154851_797541_E6CDAE25 
X-CRM114-Status: GOOD (  12.16  )
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

On Tue, 31 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> On 3/27/20 11:42 PM, Vineet Gupta via Libc-alpha wrote:
> >>> +++ b/sysdeps/arc/Versions
> >>> @@ -0,0 +1,6 @@
> >>> +libc {
> >>> +  GLIBC_2.32 {
> >>> +    __syscall_error;
> >>
> >> Why does __syscall_error need a public symbol version?  If it's used by a 
> >> library other than libc, that means it needs to be exported at some symbol 
> >> version - but it only needs a public version (as opposed to GLIBC_PRIVATE) 
> >> if it might be used by user programs linked with glibc (if it's used in 
> >> crt*.o, lib*_nonshared.a, or inline functions in installed headers, for 
> >> example - or in libgcc.a, libstdc++.a, etc. (GCC static libraries)).
> >
> > We'll historically I've preferred an out-of-line errno setter in the syscall
> > wrappers and those are used in libpthread et all as well but not expected to be
> > used by user programs. See my sysdeps.h
> 
> Ok so this will not be called directly from user programs, but indeed 
> could end up in non shared libs and/or inline functions in headers, so I 
> suppose this is fine ?

What inline function or object in lib*_nonshared.a / crt*.o / GCC static 
library has a reference to this symbol?

If there's an inline function referring to this in an installed header, we 
can consider whether that inline function *should* be referring to it.  
Similarly if there's a reference in crt*.o / lib*_nonshared.a / GCC static 
libraries, we can consider if that reference *should* be there or if the 
function in question should actually be calling some function from libc.so 
that does the syscall there.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
