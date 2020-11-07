Return-Path: <SRS0=Y3bE=EN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45B1C55179
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Nov 2020 05:08:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F48C20878
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Nov 2020 05:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XnpfzQ0n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="clH9jKll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F48C20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tt7dS9CDcdU/nZc+SHseHuG8wlHAYPtV8w66ZCCTaXc=; b=XnpfzQ0noZmcEnrS5/UjtyJO3
	mFd3bkZgshMT6IiHGeAn2d2B0jx1e8MV/gDrDna3W52BZ7fZvo9lNlUPDvFBBqrsC5ZaGE/rGQj43
	0kWHfsKBwj5f2gFu/91QQxeigIE1JJm3McYoyJD7BbH3cef2MKyIsEdVleE3hyhn/dA1bWhKSuzFz
	xwL6wecWLAfUHiUQuAJDApusfuQwgHtsqcEpQEm99xcFDAzwbJY62/uUsXsUFLA9EtqK2cRgV8d+e
	kigXoLKSII7sFqdOEils2Z/O2Oq5pQbEGNaJy+B/KQiK05VXs8uNwIRZco4PsAbcDSQv3xpruo194
	0hUXDw+bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbGT4-0000x3-NU; Sat, 07 Nov 2020 05:08:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbGT3-0000w9-0V
 for linux-snps-arc@lists.infradead.org; Sat, 07 Nov 2020 05:08:49 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BF4C20872;
 Sat,  7 Nov 2020 05:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604725727;
 bh=55KoHb8qRGofoRpTcqTP6+Sj4wA/iZddMk3945/FVcc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=clH9jKll51JXfmaZOHedvXOzyp7t2WgbUCWUJcFUbBilgShWQhDpvNoMEYLV6qd43
 +Fl/JEjNDA8ao703NxINPTq7DhZShDMQQ3SqcctGfKdjL2V0jw0fCkDbxitCqY1TJo
 ueNrSwM6MnUGAptjcct12z9Zzj6EsXyQ2pksLgGM=
Date: Fri, 6 Nov 2020 21:08:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC] proc: get_wchan() stack unwind only makes sense for
 sleeping/non-self tasks
Message-Id: <20201106210845.e9e95e91b779a01b6751e240@linux-foundation.org>
In-Reply-To: <20201105231132.2130132-1-vgupta@synopsys.com>
References: <20201105231132.2130132-1-vgupta@synopsys.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_000849_131491_5CFE0688 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: linux-arch@vger.kernel.org, John Johansen <john.johansen@canonical.com>,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-snps-arc@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>, Ingo Molnar <mingo@kernel.org>,
 Andrei Vagin <avagin@gmail.com>, "Eric W . Biederman" <ebiederm@xmission.com>,
 Oleg Nesterov <oleg@redhat.com>, linux-fsdevel@vger.kernel.org,
 Michel Lespinasse <walken@google.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu,  5 Nov 2020 15:11:32 -0800 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> Most architectures currently check this in their get_wchan() implementation
> (ARC doesn't hence this patch). However doing this in core code shows
> the semantics better so move the check one level up (eventually remove
> the boiler-plate code from arches)

It would be nice to clean up the arch callees in the same patch, at
least so it doesn't get forgotten about.  Are you prepared to propose
such a change?


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
