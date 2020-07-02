Return-Path: <SRS0=5IfC=AN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC91EC433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 07:17:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780C020874
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 07:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IGt0V6zs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780C020874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YaVmZIg8Zhw/7G8roefPlJOjxmEytM/D8gkRPM9tMUg=; b=IGt0V6zsX3v1fIRbj/N8e1iFz
	I3yJGbxFHhJKF8Sx5j4B1N7jmkYFwd/M5Q01v2xb51gOtRPZllWaAO6xbVdDWRisTB7Y9tPiviPLd
	uNvpCyHGFn9pbDKMd+aFz0bYnkyDsWdYPjZE62P375Z0yATWVPw1x6NZ27l4VLXJrk1naSUYsVzWR
	FK/JZCKKSIR58v+RIVuaqIXGauQ1/EGXvfJOD8nkGT34KwvvK2/wfejwwkHU7NtEiwOATBlm367v/
	gpBF0SiSM8kH3mvJ1hFQ+RYPo1Cj8NmIcVWOxL+gaKPaugMzi0pSKbJzIwtM8hXd6wXFsKM0eWGkU
	bhvkN0HrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqtTa-000655-Tp; Thu, 02 Jul 2020 07:17:42 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqtTY-00060L-7r
 for linux-snps-arc@lists.infradead.org; Thu, 02 Jul 2020 07:17:41 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49y8Yq1JB0z1rt3q;
 Thu,  2 Jul 2020 09:17:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49y8Yq0b1yz1qw6t;
 Thu,  2 Jul 2020 09:17:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 84mOLxU0jxNv; Thu,  2 Jul 2020 09:17:34 +0200 (CEST)
X-Auth-Info: MaIsQsElQB94LOTeDCSkM96ep/gahDqVEGGV9imyICuSD9fmtSicMgtFdtdfIB/k
Received: from igel.home (ppp-46-244-186-157.dynamic.mnet-online.de
 [46.244.186.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  2 Jul 2020 09:17:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id BFF832C0D96; Thu,  2 Jul 2020 09:17:33 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: ARC math test regressions (was Re: [PATCH v7 00/13] glibc port
 to ARC processors)
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
 <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
 <e88bc836-ff16-d32b-cc06-fa473c4c6744@synopsys.com>
 <4a04f8dc-c888-1411-0add-8603822d5ee4@synopsys.com>
X-Yow: PEGGY FLEMING is stealing BASKET BALLS to feed the babies in VERMONT.
Date: Thu, 02 Jul 2020 09:17:33 +0200
In-Reply-To: <4a04f8dc-c888-1411-0add-8603822d5ee4@synopsys.com> (Vineet Gupta
 via Libc-alpha's message of "Thu, 2 Jul 2020 01:00:19 +0000")
Message-ID: <877dvm5qsy.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_031740_434539_A158C18C 
X-CRM114-Status: UNSURE (   6.76  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Jul 02 2020, Vineet Gupta via Libc-alpha wrote:

> Now acos can come from 2 places depending on LIBM_SVID_COMPAT
>  - math/w_acos_template.c	<-- sets errno only
>  - math/w_acos_compat.c	<-- raises exception FE_INVALID
>
> For ARC, 1st variant is building, so explicit exception is NOT raised.

LIBM_SVID_COMPAT is a compat feature, thus not relevant and always off
for new ports.

It's a bug in the testsuite that it doesn't handle that case yet.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
