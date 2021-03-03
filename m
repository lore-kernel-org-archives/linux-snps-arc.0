Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDD4C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDB56146D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EDB56146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TAh0+Euqdy8rKBvyGMHLPyuSVlJO+ah189sSCjpSvfs=; b=qj/9HC2TUpjuVSSobCqkhxlLQ
	j9u/w4zqagYL6+i342IpHnzD4o7nJXyrcFd9cI3txMKxCkPYqxhDEKQApL8s6lAkEFZCjTbHp+XDa
	OZRuXT8P0Dd2Hdmt1rEYfGgvHwEQWKyUhnA4S/AaCW28YVwIMuUWuGlhtewDMY6JFzv/OgOi1KfKA
	ORy9zZPTwRPcImltX0gMZg+mVOoSVIld4m/P312rlSVQQe8eSCSKQCpKFRjerNGs/cw4gRff2P/g/
	M5pUziS9Z6/l5mPwkB0DQPVUO53o9xWtp/apt6dO0Ev+xqY6EF3lEbNcHztWrPtuwmmdWadlS76ri
	epIf7S59A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHbkW-0078N3-Kg; Thu, 04 Mar 2021 00:21:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHVs1-005wPP-2E
 for linux-snps-arc@desiato.infradead.org; Wed, 03 Mar 2021 18:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yCY5perx1SZjDDCr696owmfORcHGYDHJ7kfkiV0FTBc=; b=duxm3k6e3bDF4YjD0ur8oY6WwS
 pXfWkxU9vacMX0RRqapGXE2JmuQ394q3vUAUdB2T55bnsHWKpj/+qae+HcrGJt1+FBOCgz+yMqK13
 geM3hcft/6pLEAURzF0nMU3oYrqMBsfu0IgvQFNqPpFuNNrWbhMnCs93qds2xr9wgltK6vJ3qMi4b
 gRb8zvLQRFquJnz3tWZF6KbEE8Kod+83/Yfwh92g/xkX268a0Cvqpsw24jA8w+wGvNIhQ0PifQXFm
 uqsNAni6luwNAGneBMfwfVCbwpeHpZkbURI/TnCnq/hnXw/NuSZ553mL1jrr0YZu/U/GMHsRL9h6L
 atfdrIIw==;
Received: from isilmar-4.linta.de ([136.243.71.142])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHVry-003fNH-Qq
 for linux-snps-arc@lists.infradead.org; Wed, 03 Mar 2021 18:05:11 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id 9D6F82000B1;
 Wed,  3 Mar 2021 18:04:53 +0000 (UTC)
Date: Wed, 3 Mar 2021 19:04:36 +0100
From: Helmut Grohne <helmut@subdivi.de>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, 980963@bugs.debian.org
Cc: Guillem Jover <guillem@debian.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Message-ID: <YD/PtMrNdGYmBY3/@alf.mars>
Mail-Followup-To: Helmut Grohne <helmut@subdivi.de>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 980963@bugs.debian.org, Guillem Jover <guillem@debian.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <BN8PR12MB333028A46C2A7A80690DDB76A1B19@BN8PR12MB3330.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB333028A46C2A7A80690DDB76A1B19@BN8PR12MB3330.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_180511_350251_6A2A92F5 
X-CRM114-Status: UNSURE (   4.75  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Feb 06, 2021 at 07:25:35PM +0000, Alexey Brodkin wrote:
> Any chances to get updates on this one some time soon?

No. The triplet cannot be changed once added. Therefore, the addition is
often deferred. The absence of the triplet can easily be worked around.
A bootstrap can be prototyped already. A major missing piece though is
glibc 2.32 being packaged in Debian. That likely is a prerequisite for
resolving this bug.

Things that often need architecture-specific support for a new
architecture include:
 * guile-X.Y (cross support)
 * libgc
 * libxcrypt (symbols)
 * nspr
 * openssl (packaging)

Are any of these fixed or confirmed working for arc?

I suggest that you coordinate with Vineet Gupta as he is already working
on this.

Helmut


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
