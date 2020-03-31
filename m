Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6D1C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 20:45:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7102520787
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 20:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MwUBRAbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7102520787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnGbfgRX41UwJFCBiL71C12SXYmeAP8bZukzXleEOYo=; b=MwUBRAbo22X/F3
	OmK1fHyRA5Ic0K6XJlaxCwzxTT7b/R2Zwq94SN17cjaji1ELQEyMaBmb4q18z5eejwJTpdq0uk6ta
	cHFcAV4+9V7vAOs4p1tbUI+XYk4qEmkGcV0p8xXWWsVd6S4H8vVIqUv4e4X1xKdMN/43ps/32Rf9o
	AFhDHZ0uOrWQZb9OVt7GSn9/9e4dB4qnk/tnF+Wm4ipRx9+NWFdoFHjroeutm3yaOibangXQPRgqK
	RtnThMtVr5orZKFRxFgzMHfgLtsfeD4YRUE9AgFLZPvo2BQ/Kz2EZcHM9vAbEGIRZjMs7/YJ84QuZ
	Sci6tIuRFYh6OA4hqlLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJNlN-0006kO-9Q; Tue, 31 Mar 2020 20:45:33 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJNlK-0006jo-GM
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 20:45:32 +0000
IronPort-SDR: YTr4KmCoqWsiZdAOx7vKRTg+VFSZ1wD67CfCwHEcsG8kpVSir2m0B4akyxW/zhgodH0tH8r8hx
 sLgtywGSVy21OrKaK7nVUOmSZ0m3+K48CT2BJRInmULE1qohlLz/weO/NVuUZx0HjXO+pX2EbI
 BGeO97AyyGZYkLXU5dZToR1o5ZczYuhQI94GzMMuIboVNlolOhMmXRXnK7tP+sr+t+C7F0fmZP
 7gFte0OYtpW1khpaDqGJ/okj5D+6xssbeYHiSByigpu2MGMu+rb/8SD2DOFp4WlHTzJ0yg1Sf2
 RZ0=
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; d="scan'208";a="49284220"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 31 Mar 2020 12:45:27 -0800
IronPort-SDR: UcuAreY8KWt1p5KjSMcFAYYgzpma2vAeRihUyHOWwNcwRoF20Ltha6DD/nRNydx/xDGKNVUbz5
 eMAagKaBkilVg5We6wUcDRXALxrW3FFu+SfMK4mor9Fo8RZlWNqtZUWfaAzO9gjYKqFfzNv37I
 7Ov9NwMh2Nivp/HcmF7MjzMqf8+B30MPa/gBEaPHE/tsc7VELuHHRey3/lwE7uMgSrkjIYgU5e
 mkn6cbsoxpMco3KqOkZV8aWj60vx87jpQqeI7aZdFWHkeerPpBXDUVQEtKYP4mEv1giockCHxW
 6KQ=
Date: Tue, 31 Mar 2020 20:45:22 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: [PATCH] provide y2038 safe socket constants
In-Reply-To: <87r1x8qpx6.fsf@mid.deneb.enyo.de>
Message-ID: <alpine.DEB.2.21.2003312038320.30236@digraph.polyomino.org.uk>
References: <20200329041612.4071-1-vgupta@synopsys.com>
 <87r1x8qpx6.fsf@mid.deneb.enyo.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_134530_669861_9BEA38ED 
X-CRM114-Status: UNSURE (   7.30  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 31 Mar 2020, Florian Weimer wrote:

> What about the parallel changes to the sysdeps overrides?  I would
> expect changes for hppa, mips, powerpc.  (Not sure about the alpha
> situation.)

This fix is only about the case where the *default* ABI in glibc requires 
these different values.

The header will need further changes (to use a conditional not based on 
__TIMESIZE) when _TIME_BITS=64 is supported on platforms that currently 
have 32-bit time_t.  That's the point at which changes for other 
architectures are needed - once we have an appropriate conditional for 
"the current compilation uses 64-bit time but kernel long is 32-bit" (or 
something like that).

I'm concerned the present patch is wrong for x32, however; that has 
__TIMESIZE == 64 && __WORDSIZE == 32 but should use the old values; the 
patch should be using __SYSCALL_WORDSIZE when available in place of 
__WORDSIZE.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
