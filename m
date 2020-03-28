Return-Path: <SRS0=RUT9=5N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D89BC43331
	for <linux-snps-arc@archiver.kernel.org>; Sat, 28 Mar 2020 00:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29FF206F1
	for <linux-snps-arc@archiver.kernel.org>; Sat, 28 Mar 2020 00:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSFlkUvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E29FF206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7B6TQI+8hZ9egSbrZm++7WArkSZkIRO8B8j25GQIhfc=; b=lSFlkUvioYPRTx
	B1jFDzVtUyD4nk92x/M+O2jrq1wNnR0Ziy5b7TLwxtVcNNW4aiqbd07vPLrzIGjtV6mdvDyZwBdoN
	hpcOqfBzd9rvxduWwEWOzuswoT0WSS03HlO6N51IwQWYBCCEoGzMLYwq1nyqs9Ak7oLaQ+tEqpBOz
	ngfMOk3JwEAEAp+57XeAHMAHnMxt7J/qXvmDiy70cnQx4V4maFs2YK/w2D/I01OAmxvrRY/0N2wcd
	3q54ajxajhfVTNzedNrfS5G6JSHTUIrldEszjrB4+joEt3szLxHylIVC7X25tN9x3k/t6kOCO+F8u
	WGTvWJD864SO+SN+56jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHyv3-0004uh-Bt; Sat, 28 Mar 2020 00:01:45 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHyv0-0004uO-5s
 for linux-snps-arc@lists.infradead.org; Sat, 28 Mar 2020 00:01:44 +0000
IronPort-SDR: k22rfjsZx4McH79QMdWEoWRdMdhIcr4Oez59drc/QXPHI4ObCrbP0hyrFmU/kT8BSBSm5X3Uj5
 IEh4U38qxtpc9Kj0nlZ86t8iLhn4bpRvh/1ftLcQnyyMvGz0rUUQB8onZnOpbFSTpQTH+ThbLJ
 nCwEQG/suXb1h/c/Dm7WjZp36VcH41j/2NWfi+n9uKxfaT+SamFG5iDBJ5tl5hkQDhFyTT1cVc
 d39aS965IpwVNJYaZwilnepf00JsEFkSzCMWCM4uGUzg1fF9sXgP8Hz1bNiZdT5EDy3PS0a6gF
 TNA=
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="47201486"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 27 Mar 2020 16:01:38 -0800
IronPort-SDR: biEKw/EJkMU75O7X63BGV19ey+RxiKmvvRIuyGykvO1j3EBsRqeOBn8VJHUmSZjsHTUmyutglU
 UaO6vfU2rjwj1BZGXY3uRhWkjlizsJueYB0YZV4D4GdqwZuQa3ZPE6RhOtCzcmHW4wDYzWGeBY
 BsGGiwPMGooiaSuiCq/jZMlCv7wUAZd1tJmEBCMsaf28PFj7QsCoahMXzb5X0/Gm6vrdV2LNLu
 kX+TJFXffbKvLtJDI0pWI+aj4hjEbD9XbANVcocx1vMvARStrEj8MFpRaDAiVy+akAhZzmftXC
 7xs=
Date: Sat, 28 Mar 2020 00:01:32 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 15/15] Documentation for ARC port
In-Reply-To: <fb36f261-f20c-77cb-acf8-1ec82aa9c93b@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003272359580.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-16-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272247560.5132@digraph.polyomino.org.uk>
 <fb36f261-f20c-77cb-acf8-1ec82aa9c93b@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_170142_246755_BC208151 
X-CRM114-Status: UNSURE (   7.40  )
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

On Fri, 27 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> On 3/27/20 3:49 PM, Joseph Myers wrote:
> > On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> > 
> >> +* Support for ARC HS cores running Linux has been contributed by Synopsys.
> >> +
> >> +  Port requires atleast
> >> +    - binutils-2.32 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
> >> +    - gcc 8.3 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
> >> +    - Linux kernel 5.1+
> >> +
> >> +  ISA: ARCv2
> >> +  ABI: 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2 (compatible with
> >> +       hard-float builds)
> > I don't think the default of the dynamic linker name etc. (which should go 
> > on https://sourceware.org/glibc/wiki/ABIList) belong in the NEWS entry.
> 
> OK, at the time port is ready and about to be committed or now ?

I think the wiki should be updated at the time the port is committed.  
https://sourceware.org/glibc/wiki/NewPorts lists all the wiki pages that 
should be updated (MAINTAINERS, ABIList, PortStatus, Release/X.Y and the 
copy for the next release).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
