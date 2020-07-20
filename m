Return-Path: <SRS0=+Xh6=A7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BF1C433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jul 2020 14:34:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61A822482
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jul 2020 14:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q7/QeLBZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LS7s2/U0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61A822482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XrvvCcS9tkMdulo8UsBNPE9+2zEbg6/QXl9tCeaXAtA=; b=Q7/QeLBZAK+/v4+mcvosY6YT0
	rVhtQ29fAa7QF9SBm3fT+r5DdXT/QVmHVU2dW1kHs5vXAxxokVsBfyL+0OprhFBEJP+q7l2GVnEdR
	3v78PiLE5OUTB7BElqaPcsvTfILm7aQ96OObZqkw9Zrg/FxP7DZZlNwXSbdlqm8ZzQj0ifeIMweMv
	IQWcpXu3vWr92dmnDz1maOSFj7W+zxbOgCVbO3gDRHgCDDuHMV20UUKZUKyR09l3xFre9xG4rPgPk
	GzrFUNHnxWuy33g8P3MXwJ7a/W5DRJIqm/nXnNzczuxdRLC6ymhRX0Tt49B5Rh568fuagyjWFk9sx
	0cTJtexkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxWri-0004WP-4u; Mon, 20 Jul 2020 14:34:02 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxWrh-0004Vz-5b
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jul 2020 14:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595255639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ubRu4GHcAtFgcxwixYO4qOt71kpePeAUsWY7MoOGXs=;
 b=LS7s2/U0nb7BEKTuV2smn4YGCMWNt6n1IbfutQ3ucipVZWNbULCeq9CdbxFgBNxmrpj09d
 UVgQnCN4E/y5/IjSavYAeLms3mMgBp0UsqiC73BShv5sENf7rP6nwQqQHBT5sfrZddT3uH
 dohbhpBfa3jQLSZe+txAoFQKGP6s/X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-dsRkpmTmOvWDBXwwbMEh7w-1; Mon, 20 Jul 2020 10:33:56 -0400
X-MC-Unique: dsRkpmTmOvWDBXwwbMEh7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE014800688;
 Mon, 20 Jul 2020 14:33:55 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-112-226.ams2.redhat.com
 [10.36.112.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D46535C240;
 Mon, 20 Jul 2020 14:33:54 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2] elf: Change TLS static surplus default back to 1664
References: <87eepaqsgk.fsf@oldenburg2.str.redhat.com>
 <95bfdf25-19b3-33b6-15a0-f4ba4326bf11@synopsys.com>
Date: Mon, 20 Jul 2020 16:33:53 +0200
In-Reply-To: <95bfdf25-19b3-33b6-15a0-f4ba4326bf11@synopsys.com> (Vineet Gupta
 via Libc-alpha's message of "Sun, 19 Jul 2020 04:39:37 +0000")
Message-ID: <878sfew90u.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_103401_240048_E4D10DB3 
X-CRM114-Status: GOOD (  11.91  )
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
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta via Libc-alpha:

> Hi Florian,
>
> On 7/17/20 4:41 AM, Florian Weimer via Libc-alpha wrote:
>> Make the computation in elf/dl-tls.c more transparent, and add
>> an explicit test for the historic value.
>> 
>> ---
>>  elf/Makefile          |  4 +++-
>>  elf/dl-tls.c          | 37 ++++++++++++++++++++++++++++++-------
>>  elf/tst-tls-surplus.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 75 insertions(+), 8 deletions(-)
>
> On ARC, tst-tls-surplus passes, but it seems there's still some static TLS
> shenanigans.
>
> FAIL: elf/tst-tls-ie
> FAIL: elf/tst-tls-ie-dlmopen
>
> $ cat elf/tst-tls-ie.out
>
> maintls[1000]:	 0x20026f80 .. 0x20027368
> var0[480]:	 0x2093c648 .. 0x2093c828 global-dynamic
> var1[120]:	 0x2093cc40 .. 0x2093ccb8 global-dynamic
> var2[24]:	 0x2093d0d0 .. 0x2093d0e8 global-dynamic
> var3[16]:	 0x2093d500 .. 0x2093d510 global-dynamic
> error: xdlfcn.c:29: error: dlopen:
> glibc-2.31.9000-730-ge9422236a2dd4/build/elf/tst-tls-ie-mod4.so: cannot allocate
> memory in static TLS block
>
> cat elf/tst-tls-ie-dlmopen.out
> maintls[1000]:	 0x20026f80 .. 0x20027368
> var0[480]:	 0x2093c648 .. 0x2093c828 global-dynamic
> var1[120]:	 0x2093d3d8 .. 0x2093d450 global-dynamic
> var2[24]:	 0x2093e000 .. 0x2093e018 global-dynamic
> var3[16]:	 0x2093ebc8 .. 0x2093ebd8 global-dynamic
> error: xdlmopen.c:28: error: dlmopen:
> glibc-2.31.9000-730-ge9422236a2dd4/build/elf/tst-tls-ie-mod6.so: cannot allocate
> memory in static TLS block

I looked at the binaries, but I do not see anything obviously wrong.  I
think you need to single-step through the allocations to see where they
fail, sorry.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
